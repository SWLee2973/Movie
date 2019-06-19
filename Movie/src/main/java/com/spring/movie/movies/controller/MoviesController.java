package com.spring.movie.movies.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MoviesController {
	public ModelAndView moviesDetail(String movie_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
