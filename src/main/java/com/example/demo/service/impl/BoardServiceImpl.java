package com.example.demo.service.impl;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.Board;
import com.example.demo.model.File;
import com.example.demo.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    @Override
    public void write(Board board) {
        boardMapper.write(board);
    }

    @Override
    public void fileSave(File file) {
        boardMapper.fileSave(file);
    }

    @Override
    public List<Board> listAll() {
        return boardMapper.listAll();
    }

    @Override
    public Board viewDetail(String no) {
        return boardMapper.viewDetail(no);
    }

    @Override
    public File down(String no){
        return boardMapper.down(no);
    }

    @Override
    public Integer viewfile(String no) {
        return boardMapper.viewfile(no);
    }

}
