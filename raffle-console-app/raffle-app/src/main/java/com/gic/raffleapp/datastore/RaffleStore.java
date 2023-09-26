package com.gic.raffleapp.datastore;

import com.gic.raffleapp.dtos.Ticket;

import java.util.List;

/**
 * Interface for handling data
 */

public interface RaffleStore {


    void initializeStore();

    void resetStore();


    Double getPotSize();

    void setPotSize(double size);

    void updateTicketsMap(String userName, List<Ticket> tickets);

    List<Ticket> getTicketsByUserName(String userName);

    List<Ticket> getTickets();

    void setTickets(List<Ticket> tickets);


}
