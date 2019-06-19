package com.spring.movie.movies.service;

import java.util.List;
import java.util.Map;

import com.spring.movie.movies.vo.MoviesVO;

public interface MoviesService {
	
	public List getMoviesList() throws Exception;
	public List getMoviePictureList() throws Exception;
	public List getOpenDate() throws Exception;
	public MoviesVO getMovieDetail(String movie_code) throws Exception;
	public List getMovieStillCut(String movie_code) throws Exception;
}
