package com.kitri.myspringboard.mapper;

import com.kitri.myspringboard.domain.Board;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class BoardMapperTest {

    @Autowired
    BoardMapper boardMapper;

    @Test
    void findAll() {
        List<Board> boards = boardMapper.findAll();
        assertThat(boards).hasSize(5);
    }

    @Test
    void findById() {
        Board board = new Board();
        board.setTitle("ㅎㅇ");
        board.setContent("test");
        board.setWriter("writer");
        boardMapper.insert(board);

        Board foundBoard = boardMapper.findById(board.getId());

        assertThat(foundBoard).isNotNull();
        assertThat(foundBoard.getTitle()).isEqualTo("ㅎㅇ");
        assertThat(foundBoard.getContent()).isEqualTo("test");
        assertThat(foundBoard.getWriter()).isEqualTo("writer");
    }

    @Test
    void insert() {
        Board board = new Board();
        board.setTitle("ㅎㅇ");
        board.setContent("test");
        board.setWriter("writer");
        boardMapper.insert(board);
        System.out.println(board.getId());
    }

    @Test
    void update() {
        Board board = new Board();
        board.setTitle("안녕");
        board.setContent("잘가");
        board.setWriter("하이");
        boardMapper.insert(board);
        Board foundBoard = boardMapper.findById(board.getId());

        foundBoard.setTitle("안녕1");
        foundBoard.setContent("잘가2");
        foundBoard.setWriter("하이3");
        boardMapper.update(foundBoard);

        Board updatedBoard = boardMapper.findById(foundBoard.getId());

        assertThat(updatedBoard).isNotNull();
        assertThat(updatedBoard.getTitle()).isEqualTo("안녕1");
        assertThat(updatedBoard.getContent()).isEqualTo("잘가2");
        assertThat(updatedBoard.getWriter()).isEqualTo("하이3");
    }

    @Test
    void delete() {
        Board board = new Board();
        board.setTitle("안녕");
        board.setContent("잘가");
        board.setWriter("하이");
        boardMapper.insert(board);

        boardMapper.delete(board.getId());
        assertThat(boardMapper.findById(board.getId())).isNull();
    }
}