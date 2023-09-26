package com.gic.raffleapp.datastore.impl;

import com.gic.raffleapp.datastore.RaffleStore;
import com.gic.raffleapp.dtos.Ticket;
import com.gic.raffleapp.enums.RedisKeys;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import redis.clients.jedis.Jedis;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class RedisRaffleStore implements RaffleStore {
    private Jedis jedis;
    private Gson gson;

    public RedisRaffleStore() {
        jedis = new Jedis("localhost", 6379);
        gson = new Gson();
    }

    @Override
    public void initializeStore() {
        jedis.del(RedisKeys.TICKETS.name(), RedisKeys.TICKETS_BY_USER.name());
        jedis.set(RedisKeys.POT_SIZE.name(), String.valueOf(100.0));
    }

    @Override
    public void resetStore() {
        jedis.del(RedisKeys.TICKETS.name(), RedisKeys.TICKETS_BY_USER.name());
    }

    @Override
    public Double getPotSize() {
        String potSize = jedis.get(RedisKeys.POT_SIZE.name());
        if (potSize != null && !potSize.isEmpty()) {
            return Double.parseDouble(jedis.get(RedisKeys.POT_SIZE.name()));
        } else {
            return 0.0;
        }
    }

    @Override
    public void setPotSize(double size) {
        String potSize = jedis.get(RedisKeys.POT_SIZE.name());
        double existingPotSize = 0.0;
        if (potSize != null && !potSize.isEmpty()) {
            existingPotSize = Double.parseDouble(potSize);
        }
        jedis.set(RedisKeys.POT_SIZE.name(), String.valueOf(existingPotSize + size));
    }

    @Override
    public void updateTicketsMap(String userName, List<Ticket> tickets) {
        String ticketString = jedis.hget(RedisKeys.TICKETS_BY_USER.name(), userName);
        List<Ticket> existingTicketsByUserName = new ArrayList<>();
        if(ticketString !=null && !ticketString.isEmpty()) {
            existingTicketsByUserName = gson.fromJson(ticketString, new TypeToken<ArrayList<Ticket>>() {
            }.getType());
        }
        existingTicketsByUserName.addAll(tickets);
        jedis.hset(RedisKeys.TICKETS_BY_USER.name(), userName, gson.toJson(existingTicketsByUserName));
    }

    @Override
    public List<Ticket> getTicketsByUserName(String userName) {
            String ticketString = jedis.hget(RedisKeys.TICKETS_BY_USER.name(), userName);
            if(ticketString !=null && !ticketString.isEmpty()) {
                return gson.fromJson(ticketString, new TypeToken<ArrayList<Ticket>>() {
                }.getType());
            }
            return new ArrayList<>();
    }

    @Override
    public List<Ticket> getTickets() {
        Set<String> ticketsString = jedis.smembers(RedisKeys.TICKETS.name());
        if(ticketsString !=null && !ticketsString.isEmpty()) {
            return ticketsString.stream().map(ticket -> gson.fromJson(ticket, Ticket.class)).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    @Override
    public void setTickets(List<Ticket> tickets) {
        tickets.forEach(ticket -> jedis.sadd(RedisKeys.TICKETS.name(), gson.toJson(ticket)));
        updateTicketsMap(tickets.get(0).getUserName(),tickets);
    }
}
