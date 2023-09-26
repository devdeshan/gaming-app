package com.gic.raffleapp.enums;

public enum GroupType {
    GROUP_2("Group 2"),
    GROUP_3("Group 3"),
    GROUP_4("Group 4"),
    GROUP_5("Group 5");

    private String value;

    GroupType(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
