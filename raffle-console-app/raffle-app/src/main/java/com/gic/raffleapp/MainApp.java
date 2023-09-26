package com.gic.raffleapp;

import com.gic.raffleapp.datastore.RaffleStore;
import com.gic.raffleapp.datastore.impl.InMemoryRaffleStore;
import com.gic.raffleapp.service.RaffleService;

import java.util.Scanner;

public class MainApp {
    public static void main(String[] args) {
        RaffleStore raffleStore = new InMemoryRaffleStore();
        raffleStore.initializeStore();
        RaffleService raffleService = new RaffleService(raffleStore);
        boolean drawStatus = false;
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("Welcome to My Raffle App\n");
            System.out.println(drawStatus ? "Status: Draw is ongoing. Raffle pot size is $" + raffleStore.getPotSize() : "Status: Draw has not started");
            System.out.println("[1] Start a New Draw\n" +
                    "[2] Buy Tickets\n" +
                    "[3] Run Raffle");
            try {
                int action = scanner.nextInt();
                if (action == 1) {
                    raffleStore.resetStore();
                    System.out.println("New Raffle draw has been started. Initial pot size: $" + raffleStore.getPotSize());
                    drawStatus = true;
                } else if (action == 2) {
                    System.out.println("Enter your name, no of tickets to purchase");
                    String buyTickets = scanner.next();
                    String[] buyTicketsInput = buyTickets.split(",");
                    raffleService.buyTickets(buyTicketsInput[0], Integer.parseInt(buyTicketsInput[1]));
                } else if (action == 3) {
                    System.out.println("Running Raffle..");
                    raffleService.runRaffle();
                }
                System.out.println("Press any key to return to main menu");
                scanner.nextLine();
                scanner.nextLine();
            } catch (Exception ex) {
                System.out.println("Error in processing raffle");
            }
        }
    }
}