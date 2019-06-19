package com.spring.movie.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movie.admin.member.dao.AdminMemberDAO;
import com.spring.movie.member.vo.MemberVO;


@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	AdminMemberDAO adminMemberDAO;
	
	@Override
	public List listMembers() throws DataAccessException{
		List<MemberVO> membersList = null;
		membersList = adminMemberDAO.selectAllMemberList();
		return membersList;
	}

	public MemberVO memberDetail(String email) throws Exception{
		 return adminMemberDAO.memberDetail(email);
	}

	@Override
	public void deleteMember(String email) throws Exception {
		adminMemberDAO.deleteMember(email);
	}

	
}
