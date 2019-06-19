package com.spring.movie.admin.book.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.admin.book.service.AdminBookService;
import com.spring.movie.book.vo.BookVO;

@Controller("adminBookController")
@RequestMapping(value="/admin/book")
public class AdminBookControllerImpl implements AdminBookController {
	@Autowired
	AdminBookService adminBookService;
	
	@RequestMapping(value="/bookManagement.do", method=RequestMethod.GET)
	public ModelAndView adminBookList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<BookVO> bookList = adminBookService.getAllBookList();
		mav.addObject("bookList", bookList);
		return mav;
	}
	
	@RequestMapping(value="/deleteBook.do", method=RequestMethod.GET)
	public ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		String booking_code = (String) request.getParameter("booking_code");
		ModelAndView mav = new ModelAndView(viewName);
		
		try {
			adminBookService.deleteBook(booking_code);
			mav.setViewName("redirect:/admin/book/bookManagement.do");
		} catch(Exception e) {
			mav.setViewName("redirect:/admin/book/bookManagement.do");			
		}
		return mav;
	}
	
	@RequestMapping(value="/m_deleteBook.do", method=RequestMethod.GET)
	public ModelAndView m_deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		String booking_code = (String) request.getParameter("booking_code");
		ModelAndView mav = new ModelAndView(viewName);
		String email = adminBookService.getEmail(booking_code);
		try {
			adminBookService.deleteBook(booking_code);
			mav.setViewName("redirect:/admin/member/memberDetail.do?email=" + email);
		} catch(Exception e) {
			mav.setViewName("redirect:/admin/member/memberDetail.do?email=" + email);			
			e.printStackTrace();
		}
		return mav;
	}
}
