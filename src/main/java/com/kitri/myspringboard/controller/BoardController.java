package com.kitri.myspringboard.controller;


import com.kitri.myspringboard.domain.Board;
import com.kitri.myspringboard.domain.Comment;
import com.kitri.myspringboard.domain.User;
import com.kitri.myspringboard.mapper.service.BoardService;
import com.kitri.myspringboard.mapper.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Stack;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;
    @Autowired
    private CommentService commentService;

    @GetMapping("/list")
    public String getBoards(@RequestParam(defaultValue = "1") int page,
                            @RequestParam(defaultValue = "10") int size,
                            @RequestParam(required = false) String search, Model model) {
        List<Board> boards = boardService.getBoards(page, size, search);
        int total = boardService.getBoardCount(search);
        int totalPages = (int) Math.ceil((double) total / size);

        model.addAttribute("boards", boards);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", search);

        return "board/list";
    }
    @GetMapping("/{id}")
    public String show(@PathVariable long id , Model model) {
        Board board = boardService.findById(id);
        List<Comment> Comments = commentService.findById(id);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("board", board);
        model.addAttribute("Comments", Comments);
        model.addAttribute("username", authentication.getName());
        return "board/show";
    }

    @GetMapping("/add")
    public String add(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", authentication.getName()); // 사용자 정보를 모델에 추가
        return "board/add";
    }

    @PostMapping("/add")
    public String addBoard(@ModelAttribute Board board) {
        boardService.insert(board);
        return "redirect:/board/list";
    }

   @GetMapping("/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Board board = boardService.findById(id);
        model.addAttribute("board", board);
        return "board/edit";
   }

   @PostMapping("/edit")
    public String editBoard(@ModelAttribute Board board) {
        boardService.update(board);
        return "redirect:/board/list";
   }

   @PostMapping("/{id}/delete")
    public String delete(@PathVariable long id) {
        boardService.delete(id);
        return "redirect:/board/list";
   }
}