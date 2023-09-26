package com.gic.raffleapp.service;

import com.gic.raffleapp.datastore.RaffleStore;
import com.gic.raffleapp.dtos.Ticket;
import com.gic.raffleapp.enums.GroupType;
import com.gic.raffleapp.utils.CommonConstants;
import com.gic.raffleapp.utils.NumberUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class RaffleService {
    private final RaffleStore raffleStore;

    public RaffleService(RaffleStore raffleStore) {
        this.raffleStore = raffleStore;
    }

    /**
     * Handles but ticket operations and displays output.
     * @param userName
     * @param numberOfTickets
     */
    public void buyTickets(String userName, int numberOfTickets) {
        List<Ticket> tickets = new ArrayList<>();
        for (int i = 0; i < numberOfTickets; i++) {
            tickets.add(getTicket(userName));
            raffleStore.setPotSize(5);
        }
        raffleStore.setTickets(tickets);
        List<Ticket> purchasedTickets = raffleStore.getTicketsByUserName(userName);
        System.out.println(String.format(CommonConstants.TICKET_PURCHASE_OUTPUT, userName, purchasedTickets.size()));
        for (int i = 0; i < purchasedTickets.size(); i++) {
            System.out.println(String.format(CommonConstants.TICKET_PURCHASE_DETAILS, (i + 1), purchasedTickets.get(i).getDisplayNumbers()));
        }
    }

    /**
     * Execute the raffle and displays winners
     */
    public void runRaffle() {
        List<Integer> winningNumbers = getWinningTicket();
        System.out.println("Winning Ticket is " + NumberUtils.getDisplayNumber(winningNumbers));
        Map<String, List<String>> groupedWinners = getWinners(winningNumbers);
        System.out.println("\nGroup 2 Winners:");
        printWinners(groupedWinners.get(GroupType.GROUP_2.getValue()));
        System.out.println("\nGroup 3 Winners:");
        printWinners(groupedWinners.get(GroupType.GROUP_3.getValue()));
        System.out.println("\nGroup 4 Winners:");
        printWinners(groupedWinners.get(GroupType.GROUP_4.getValue()));
        System.out.println("\nGroup 5 Winners (Jackpot):");
        printWinners(groupedWinners.get(GroupType.GROUP_5.getValue()));
    }

    /**
     * Get winning ticket numbers
     * @return
     */
    private List<Integer> getWinningTicket() {
        return NumberUtils.generateLotteryNumbers();
    }

    /**
     * Find winners, Calculate prices and generate display messages
     * @param winningTicket
     * @return
     */
    private Map<String, List<String>> getWinners(List<Integer> winningTicket) {
        Map<String, List<String>> groupedWinners = new HashMap<>();
        List<Ticket> allTickets = raffleStore.getTickets();
        Map<Long, List<Ticket>> groupedTickets = allTickets.stream().collect(Collectors.groupingBy(
                ticket -> ticket.getNumList().
                        stream().
                        filter(winningTicket::contains).
                        count()));
        Map<GroupType, Double> winningPriceByGroup = getWinningPriceByGroup();
        groupedTickets.forEach((k, v) -> {

            if (k == 2) {
                groupedWinners.computeIfAbsent(GroupType.GROUP_2.getValue(), value -> new ArrayList<>()).addAll(getWinnerDetails(GroupType.GROUP_2, v, winningPriceByGroup));
            } else if (k == 3) {
                groupedWinners.computeIfAbsent(GroupType.GROUP_3.getValue(), value -> new ArrayList<>()).addAll(getWinnerDetails(GroupType.GROUP_3, v, winningPriceByGroup));
            } else if (k == 4) {
                groupedWinners.computeIfAbsent(GroupType.GROUP_4.getValue(), value -> new ArrayList<>()).addAll(getWinnerDetails(GroupType.GROUP_4, v, winningPriceByGroup));
            } else if (k == 5) {
                groupedWinners.computeIfAbsent(GroupType.GROUP_5.getValue(), value -> new ArrayList<>()).addAll(getWinnerDetails(GroupType.GROUP_4, v, winningPriceByGroup));
            }
        });
        return groupedWinners;
    }

    private List<String> getWinnerDetails(GroupType groupType, List<Ticket> winningTicketsInGroup, Map<GroupType, Double> winningPriceByGroup) {
        if (!winningTicketsInGroup.isEmpty()) {
            double groupWinningPrice = winningPriceByGroup.get(groupType);
            raffleStore.setPotSize(-groupWinningPrice);
            double winningPrice = groupWinningPrice / winningTicketsInGroup.size();
            Map<String, List<Ticket>> wonTicketsByUserName = winningTicketsInGroup.stream().collect(Collectors.groupingBy(Ticket::getUserName));
            return wonTicketsByUserName.entrySet().stream().map(entry -> String.format(CommonConstants.WINNING_OUTPUT, entry.getKey(), entry.getValue().size(), String.format("%.2f",winningPrice * entry.getValue().size()))
            ).collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    private Ticket getTicket(String userName) {
        return new Ticket(NumberUtils.generateLotteryNumbers(), userName);
    }

    private Map<GroupType, Double> getWinningPriceByGroup() {
        Map<GroupType, Double> winningPriceByGroup = new HashMap<>();
        double totalPot = raffleStore.getPotSize();
        winningPriceByGroup.put(GroupType.GROUP_2, totalPot * 0.1);
        winningPriceByGroup.put(GroupType.GROUP_3, totalPot * 0.15);
        winningPriceByGroup.put(GroupType.GROUP_4, totalPot * 0.25);
        winningPriceByGroup.put(GroupType.GROUP_5, totalPot * 0.5);
        return winningPriceByGroup;
    }

    /**
     * Print winner details
     * @param groupWinners
     */
    private void printWinners(List<String> groupWinners) {
        if (groupWinners != null && !groupWinners.isEmpty()) {
            groupWinners.forEach(System.out::println);
        } else {
            System.out.println("Nil");
        }
    }
}
