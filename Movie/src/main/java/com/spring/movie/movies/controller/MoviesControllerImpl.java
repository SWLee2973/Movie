package com.spring.movie.movies.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.common.base.BaseController;
import com.spring.movie.movies.service.MoviesService;
import com.spring.movie.movies.vo.MoviesVO;

@Controller("moviesController")
@RequestMapping(value="/movies")
public class MoviesControllerImpl extends BaseController implements MoviesController {
	@Autowired
	MoviesService moviesService;
	
	@RequestMapping(value="/moviesDetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView moviesDetail(@RequestParam("movie_code") String movie_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		MoviesVO moviesVO = moviesService.getMovieDetail(movie_code);
		List stillCutList = moviesService.getMovieStillCut(movie_code);
		
		mav.addObject("moviesVO", moviesVO);
		mav.addObject("stillCutList", stillCutList);
		
		return mav;
	}
	
	@RequestMapping(value = "/movies.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView movies(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		List movieList = moviesService.getMoviesList(); // List형태의 movieList를 moviesService에서 getMoviesList()생성, 메인 포스터

		mav.addObject("movieList", movieList);
		return mav;
	}

}
