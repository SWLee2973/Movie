package com.spring.movie.admin.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminBookController {
	ModelAndView adminBookList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView m_deleteBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
