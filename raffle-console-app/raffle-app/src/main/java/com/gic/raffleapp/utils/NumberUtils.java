package com.gic.raffleapp.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class NumberUtils {
    public static List<Integer> generateLotteryNumbers(){
        List<Integer> numList = new ArrayList<>();
        Random random = new Random();
        while (numList.size()<5){
            int number = random.nextInt(15)+1;
            if(!numList.contains(number)) {
                numList.add(number);
            }
        }
        return numList;
    }

    public static String getDisplayNumber(List<Integer> numList){
        return numList.stream()
                .map(Object::toString)
                .collect(Collectors.joining(" "));
    }
}
