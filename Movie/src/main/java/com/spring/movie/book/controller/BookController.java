package com.spring.movie.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.book.vo.BookVO;

public interface BookController {
	public ModelAndView bookMovies(@ModelAttribute("BookVO") BookVO bookVO,
															HttpServletRequest request,
															HttpServletResponse response) throws Exception;
}
