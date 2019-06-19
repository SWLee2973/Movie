package com.spring.movie.admin.movies.service;

import java.util.List;
import java.util.Map;

import com.spring.movie.movies.vo.TheaterVO;

public interface AdminMoviesService {
	public int addNewMovies(Map newMoviesMap) throws Exception;
	public List listTheaters() throws Exception;
	public List getAreaList() throws Exception;
	public Map theaterDetail(String theater_code) throws Exception;
	public TheaterVO getTheaterSummary(String theater_code) throws Exception;
	public int deleteMovies(Map deleteMoviesMap) throws Exception;
	public void addNewMoviesPicture(Map<String, Object> movieMap) throws Exception;
	public void addNewStillCut(Map<String, Object> movieMap) throws Exception;
	public void addNewTime(Map<String, String> tool) throws Exception;
	public void removeMovie(String movie_code) throws Exception;
}
