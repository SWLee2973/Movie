package com.spring.movie.admin.movies.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminMoviesController {
	public ModelAndView moviesListMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView screenListMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewMovies(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
