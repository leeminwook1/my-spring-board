package com.kitri.myspringboard.mapper.service;

import com.kitri.myspringboard.domain.Board;
import com.kitri.myspringboard.domain.Comment;
import com.kitri.myspringboard.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    public CommentMapper commentMapper;

    public void insertComment(Comment comment) {
        commentMapper.insertComment(comment);
    }

    public List<Comment> findById(long boardId) {
        return commentMapper.findById(boardId);
    }

    public void delete(long id) {
        commentMapper.delete(id);
    }

}
