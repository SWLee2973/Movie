package com.spring.movie.admin.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.movie.member.vo.MemberVO;

public interface AdminMemberDAO {
	public List<MemberVO> selectAllMemberList() throws DataAccessException;
	public MemberVO memberDetail(String email) throws DataAccessException;
	public void deleteMember(String email) throws DataAccessException;
}
