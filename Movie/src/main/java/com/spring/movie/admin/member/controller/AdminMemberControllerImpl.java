package com.spring.movie.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.admin.book.service.AdminBookService;
import com.spring.movie.admin.member.service.AdminMemberService;
import com.spring.movie.book.vo.BookVO;
import com.spring.movie.common.base.BaseController;
import com.spring.movie.member.vo.MemberVO;

@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl extends BaseController implements AdminMemberController{
	@Autowired
	AdminMemberService adminMemberService;
	@Autowired
	AdminBookService adminBookService;
	
	@RequestMapping(value="/adminMemberMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminMembersList(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List membersList = adminMemberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
			
		mav.addObject("membersList", membersList);
		mav.setViewName(viewName);
	
		return mav;
		
	}
	@RequestMapping(value="/memberDetail.do" ,method=RequestMethod.GET)
	public ModelAndView memberDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String email = (String) request.getParameter("email");
		
		MemberVO member_info=adminMemberService.memberDetail(email);
		List<BookVO> book_info = adminBookService.bookDetail(email);
		
		mav.addObject("member_info",member_info);
		mav.addObject("book_info", book_info);
		return mav;
	}
	
	@RequestMapping(value="/deleteMember.do" ,method=RequestMethod.GET)
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("email");
		List<String> booking_code = adminBookService.getBook_code(email);
		try {
		adminMemberService.deleteMember(email);
		for(int i=0; i<booking_code.size(); i++) {
			adminBookService.deleteBook(booking_code.get(i));
		}
		
		mav.setViewName("redirect:/admin/member/adminMemberMain.do");
		return mav;
		} catch(Exception e) {
			mav.setViewName("redirect:/admin/member/adminMemberMain.do");
			return mav;
		}
		
	}
		
}
