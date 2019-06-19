package com.spring.movie.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movie.member.dao.MemberDAO;
import com.spring.movie.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO login(Map loginMap) throws Exception {
		return memberDAO.login(loginMap);
	}

	@Override
	public void addMember(MemberVO memberVO) throws Exception {
		memberDAO.insertNewMember(memberVO);
	}

	@Override
	public String overlapped(String email) throws Exception {
		return memberDAO.selectOverlappedEmail(email);
	}

	@Override
	public String findEmail(Map<String, String> tool) throws Exception {
		return memberDAO.findEmail(tool);
	}

	@Override
	public String findPassword(Map<String, String> tool) throws Exception {
		return memberDAO.findPassword(tool);
	}

	@Override
	public MemberVO memberDetail(String email) throws Exception {
		return memberDAO.memberDetail(email);
	}
	
}
