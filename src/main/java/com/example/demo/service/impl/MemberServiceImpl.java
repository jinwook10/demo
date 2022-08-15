package com.example.demo.service.impl;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.model.Member;
import com.example.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;

	@Override
	public void signup(String username, String password) {

		memberMapper.signup(username, password);
	}

	@Override
	public Member getUserById(String username) {
		return null;
	}

	@Override
	public List<Member> listAll() {
		List<Member> userlist = memberMapper.listAll();
		return userlist;
	}

}
