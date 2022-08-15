package com.example.demo.mapper;

import com.example.demo.model.Board;
import com.example.demo.model.File;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public void write(Board board);
    public List<Board> listAll();
    public Board viewDetail(String no);
    public void fileSave(File file);
    public File down(String no);
    public Integer viewfile(String no);
}
