package com.example.demo.controller;

import com.example.demo.service.impl.MemberServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
@RequiredArgsConstructor
public class MainController {

    private final MemberServiceImpl memberService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String home(){
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/signup")
    public String signup(){
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(String username, String password){
        memberService.signup(username, passwordEncoder.encode(password));
        return "redirect:/";
    }
}
