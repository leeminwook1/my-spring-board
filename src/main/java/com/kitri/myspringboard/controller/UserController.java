package com.kitri.myspringboard.controller;

import com.kitri.myspringboard.domain.User;
import com.kitri.myspringboard.mapper.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class UserController {
    @Autowired
    public UserService userService;

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("user", new User());
        return "user/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute("user") User user) {
        userService.save(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "user/login";
    }
}