package com.gic.raffleapp.dtos;

import lombok.Getter;
import lombok.Setter;
import com.gic.raffleapp.utils.NumberUtils;

import java.util.List;

@Getter
@Setter
public class Ticket {
    private String ticketId;
    private List<Integer> numList;
    private String displayNumbers;
    private String userName;

    public Ticket(List<Integer> numList, String userName) {
        this.numList = numList;
        this.userName = userName;
        this.displayNumbers = NumberUtils.getDisplayNumber(numList);
    }
}
