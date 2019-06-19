package com.spring.movie.admin.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.member.vo.MemberVO;

@Repository("adminMemberDao")
public class AdminMemberDAOImpl  implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = (List) sqlSession.selectList("mapper.admin.member.selectAllMemberList");
		return membersList;
	}
	
	public MemberVO memberDetail(String email) throws DataAccessException{
		MemberVO memberVO = (MemberVO) sqlSession.selectOne("mapper.admin.member.memberDetail", email);
		return memberVO;
	}

	@Override
	public void deleteMember(String email) throws DataAccessException {
		sqlSession.delete("mapper.admin.member.deleteMember", email);		
	}

	
	

}
