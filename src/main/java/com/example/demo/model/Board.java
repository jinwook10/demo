package com.example.demo.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private int id;
    private String title;
    private String content;
    private int read_cnt;
    private String writer;
    private LocalDateTime write_time;
}
