package com.spring.movie.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.movie.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedEmail(String email) throws DataAccessException;
	public String findEmail(Map<String, String> tool) throws DataAccessException;
	public String findPassword(Map<String, String> tool) throws DataAccessException;
	public MemberVO memberDetail(String email) throws DataAccessException;
}
