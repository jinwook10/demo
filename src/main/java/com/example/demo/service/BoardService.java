package com.example.demo.service;

import com.example.demo.model.Board;
import com.example.demo.model.File;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BoardService {
    public void write(Board boardDetails);
//    public void delete();
    public void fileSave(File file);

    public List<Board> listAll();

    public Board viewDetail(String no);

    public File down(String no);

    public Integer viewfile(String no);
}
