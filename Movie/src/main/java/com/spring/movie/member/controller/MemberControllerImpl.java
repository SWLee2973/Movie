package com.spring.movie.member.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.book.service.BookService;
import com.spring.movie.book.vo.BookVO;
import com.spring.movie.common.base.BaseController;
import com.spring.movie.member.service.MemberService;
import com.spring.movie.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	MemberService memberService;
	@Autowired
	BookService bookService;
	@Autowired
	MemberVO memberVO;
	
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(loginMap);
		if(memberVO != null && memberVO.getEmail() != null) {
			HttpSession session = request.getSession();
			session =request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			
			//String action = (String) session.getAttribute("action");
			//비로그인 상태에서 예매 시도할 경우
			/*
			 * if(action != null && action.equals("/book/bookForm.do")) {
			 * mav.setViewName("forward:" + action); } else {
			 */
				//일반적인 로그인 접근
			mav.setViewName("redirect:/main/main.do");
			/*}*/
		} else {
			String message = "로그인에 실패하였습니다.";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String email = request.getParameter("myInfo");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		
		DecimalFormat df = new DecimalFormat("00");
		String year = request.getParameter("member_birth_y");
		String month = df.format(Integer.parseInt(request.getParameter("member_birth_m")));
		String day = df.format(Integer.parseInt(request.getParameter("member_birth_d")));
		String birth = year + "-" + month + "-" + day;

		String ph1 = request.getParameter("phone_number");
		String ph2 = request.getParameter("hp2");
		String ph3 = request.getParameter("hp3");
		String phoneNumber = ph1 + "-" + ph2 + "-" + ph3;
		
		String zipcode = request.getParameter("zipcode");
		
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = request.getParameter("jibunAddress");
		String namujiAddress = request.getParameter("namujiAddress");
		
		_memberVO.setEmail(email);
		_memberVO.setPassword(password);
		_memberVO.setName(name);
		_memberVO.setGender(gender);
		_memberVO.setBirth(birth);
		_memberVO.setPhone_number(phoneNumber);
		_memberVO.setZipcode(zipcode);
		_memberVO.setRoadAddress(roadAddress);
		_memberVO.setJibunAddress(jibunAddress);
		_memberVO.setNamujiAddress(namujiAddress);
				
		try {
			memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('회원가입 완료');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += "</script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('회원가입 실패');";
		    message += " location.href='"+request.getContextPath()+"/member/addMember.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(email);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/findEmail.do", method=RequestMethod.POST)
	public ModelAndView findEmail(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String name = (String) request.getParameter("name");
		String tel = (String) request.getParameter("tel");
		Map<String, String> tool = new HashMap<String, String>();
		tool.put("name", name);
		tool.put("phone_number", tel);
		
		String email = memberService.findEmail(tool);
		mav.addObject("email", email);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/findPassword.do", method=RequestMethod.POST)
	public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String name = (String) request.getParameter("name");
		String tel = (String) request.getParameter("tel");
		String email = (String) request.getParameter("email");
		Map<String, String> tool = new HashMap<String, String>();
		tool.put("email", email);
		tool.put("name", name);
		tool.put("phone_number", tel);
		
		String password = memberService.findPassword(tool);
		mav.addObject("password", password);
		
		return mav;
	}
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("memberInfo");
		String email = member.getEmail();
		
		MemberVO member_info = memberService.memberDetail(email);
		List<BookVO> book_info = bookService.bookDetail(email);
		
		mav.addObject("member_info",member_info);
		mav.addObject("book_info", book_info);
		return mav;
	}
}
