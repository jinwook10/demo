package com.example.demo.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class BuyList {
    private String member;
    private String board_title;
    private int board_no;
    private LocalDateTime buy_date;
}
