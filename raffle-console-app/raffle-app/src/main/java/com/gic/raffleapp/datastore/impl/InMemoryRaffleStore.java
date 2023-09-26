package com.gic.raffleapp.datastore.impl;

import com.gic.raffleapp.datastore.RaffleStore;
import com.gic.raffleapp.dtos.Ticket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * In memory datastore for storing raffle data
 */

public class InMemoryRaffleStore implements RaffleStore {
    private Map<String, List<Ticket>> ticketsByUserName;
    private Double potSize;
    private List<Ticket> tickets;

    @Override
    public void initializeStore() {
        ticketsByUserName = new HashMap<>();
        potSize = 100.0;
        tickets = new ArrayList<>();
    }

    @Override
    public void resetStore() {
        ticketsByUserName = new HashMap<>();
        tickets = new ArrayList<>();
    }

    @Override
    public Double getPotSize() {
        return potSize;
    }

    @Override
    public void setPotSize(double size) {
        this.potSize = this.potSize + size;
    }

    @Override
    public void updateTicketsMap(String userName, List<Ticket> tickets) {
        ticketsByUserName.computeIfAbsent(userName, value -> new ArrayList<>()).addAll(tickets);
    }

    @Override
    public List<Ticket> getTicketsByUserName(String userName) {
        return ticketsByUserName.computeIfAbsent(userName, value -> new ArrayList<>());
    }

    @Override
    public List<Ticket> getTickets() {
        return tickets;
    }

    @Override
    public void setTickets(List<Ticket> tickets) {
        this.tickets.addAll(tickets);
        tickets.forEach(ticket -> ticketsByUserName.computeIfAbsent(ticket.getUserName(), value -> new ArrayList<>()).add(ticket));
    }


}
