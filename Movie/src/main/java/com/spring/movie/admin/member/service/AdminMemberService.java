package com.spring.movie.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.movie.member.vo.MemberVO;

public interface AdminMemberService {
	public List listMembers() throws DataAccessException;
	public MemberVO memberDetail(String email) throws Exception;
	public void deleteMember(String email) throws Exception;
}
