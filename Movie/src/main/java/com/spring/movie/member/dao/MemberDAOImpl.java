package com.spring.movie.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO login(Map loginMap) throws DataAccessException {
		return (MemberVO) sqlSession.selectOne("mapper.member.login", loginMap);
	}

	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNewMember", memberVO);
	}

	@Override
	public String selectOverlappedEmail(String email) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectOverlappedEmail", email);
	}

	@Override
	public String findEmail(Map<String, String> tool) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.findEmail", tool);
	}

	@Override
	public String findPassword(Map<String, String> tool) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.findPassword", tool);
	}

	@Override
	public MemberVO memberDetail(String email) throws DataAccessException {
		return (MemberVO) sqlSession.selectOne("mapper.member.memberDetail", email);
	}	
	
	
}
