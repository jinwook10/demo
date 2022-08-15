package com.example.demo.service;

import com.example.demo.model.BuyList;
import com.example.demo.model.Member;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MemberService {

    public void signup(String username, String password);

    public Member getUserById(String username);

    public List<BuyList> buylist(String username);
}
