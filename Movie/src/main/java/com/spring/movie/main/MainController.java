package com.spring.movie.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.movies.service.MoviesService;
import com.spring.movie.movies.vo.MoviesVO;


@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	@Autowired
	MoviesService moviesService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/main/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		List<MoviesVO> movieList = moviesService.getMoviesList(); // List형태의 movieList를 moviesService에서 getMoviesList()생성, 메인 포스터
		List openDate = moviesService.getOpenDate();

		mav.addObject("movieList", movieList);
		mav.addObject("openDate", openDate);
		return mav;
	}
}
