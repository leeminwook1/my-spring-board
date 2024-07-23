package com.kitri.myspringboard.controller;

import com.kitri.myspringboard.domain.Comment;
import com.kitri.myspringboard.mapper.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    public CommentService commentService;

    @PostMapping("/create")
    public String addComment(Comment comment) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        comment.setUsername(authentication.getName());
        commentService.insertComment(comment);
        return "redirect:/board/" + comment.getBoardId();
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable long id, long boardId) {

        commentService.delete(id);
        return "redirect:/board/" + boardId;
    }
}
