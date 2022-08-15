package com.example.demo.controller;

import com.example.demo.model.BuyList;
import com.example.demo.model.Member;
import com.example.demo.service.impl.MemberServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;


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
    @GetMapping(value = "/member/mypage")
    public String mypage() throws Exception {
        return "myPage";
    }

    @GetMapping("/getbuylist")
    @ResponseBody
    public Object getBuylist(Authentication auth) {
        List<BuyList> list = memberService.buylist(((Member) auth.getPrincipal()).getName());
        HashMap<String, Object> map = new HashMap<>();
        map.put("buy", list);
        return map;
    }
}
