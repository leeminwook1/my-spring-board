package com.kitri.myspringboard.mapper.service;

import com.kitri.myspringboard.domain.Board;
import com.kitri.myspringboard.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public List<Board> getBoards(int page, int size, String search) {
        int offset = (page - 1) * size;
        return boardMapper.findAll(offset, size, search);
    }

    public int getBoardCount(String search) {
        return boardMapper.countBoards(search);
    }

    public Board findById(long id) {
        return boardMapper.findById(id);
    }
    public void insert(Board board) {
        boardMapper.insert(board);
    }
    public void update(Board board) {
        boardMapper.update(board);
    }
    public void delete(long id) {
        boardMapper.delete(id);
    }
}
