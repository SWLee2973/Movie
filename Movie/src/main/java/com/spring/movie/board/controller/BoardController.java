package com.spring.movie.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView boardView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
