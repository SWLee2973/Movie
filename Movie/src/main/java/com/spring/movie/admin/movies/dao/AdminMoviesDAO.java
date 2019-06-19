package com.spring.movie.admin.movies.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.movie.movies.vo.TheaterVO;

public interface AdminMoviesDAO {
	public List selectAllTheatersList() throws DataAccessException;
	public List<String> selectAllAreaList() throws DataAccessException;
	public List<TheaterVO> selectTheaterDetail(String theater_code) throws DataAccessException;
	public TheaterVO getSummary(String theater_code) throws DataAccessException;
	public int deleteMovies(Map deleteMoviesMap) throws DataAccessException;
	public void addNewMoviesPicture(Map<String, Object> movieMap) throws DataAccessException;
	public int addNewMovies(Map newMoviesMap) throws DataAccessException;
	public int addNewStillCut(Map<String, Object> newStillCutMap) throws DataAccessException;
	public void addNewTime(Map<String, String> tool) throws DataAccessException;
	public void removeMovie(String movie_code) throws DataAccessException;
}
