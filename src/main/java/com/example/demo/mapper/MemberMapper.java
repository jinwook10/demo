package com.example.demo.mapper;

import com.example.demo.model.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

	public Member getUserById(String username);

	public void signup(String username, String password);
	public List<Member> listAll();
}
