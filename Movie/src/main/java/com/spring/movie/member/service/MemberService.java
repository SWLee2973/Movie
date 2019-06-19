package com.spring.movie.member.service;

import java.util.Map;

import com.spring.movie.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public String findEmail(Map<String, String> tool) throws Exception;
	public String findPassword(Map<String, String> tool) throws Exception;
	public MemberVO memberDetail(String email) throws Exception;
}
