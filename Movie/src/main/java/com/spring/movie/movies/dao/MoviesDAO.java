package com.spring.movie.movies.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.movie.movies.vo.MoviesVO;

public interface MoviesDAO {
	public List getMovieList() throws DataAccessException;
	public List getMoviePictureList() throws DataAccessException;
	public List getOpenDate() throws DataAccessException;
	public String getMovieMainImage(String movie_code) throws DataAccessException;
	public MoviesVO getMovieByMovieCode(String movie_code) throws DataAccessException;
	public List getMovieStillCut(String movie_code) throws DataAccessException;
}
