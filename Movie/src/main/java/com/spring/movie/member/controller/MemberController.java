package com.spring.movie.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView login(Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO member,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findEmail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
