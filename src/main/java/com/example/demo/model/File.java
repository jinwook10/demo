package com.example.demo.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class File {
    private int id;
    private int board_no;
    private String orgin_name;
    private String random_name;
    private LocalDateTime regdate;
}
