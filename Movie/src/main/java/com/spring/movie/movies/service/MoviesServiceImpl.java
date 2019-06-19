package com.spring.movie.movies.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movie.movies.dao.MoviesDAO;
import com.spring.movie.movies.vo.MoviesVO;

@Service("moviesService")
@Transactional(propagation=Propagation.REQUIRED)
public class MoviesServiceImpl implements MoviesService {
	@Autowired
	MoviesDAO moviesDAO;
	
	@Override
	public List getMoviesList() throws Exception {
		return moviesDAO.getMovieList();
	}

	@Override
	public List getMoviePictureList() throws Exception {
		return moviesDAO.getMoviePictureList();
	}

	@Override
	public List getOpenDate() throws Exception {
		return moviesDAO.getOpenDate();
	}

	@Override
	public MoviesVO getMovieDetail(String movie_code) throws Exception {
		return moviesDAO.getMovieByMovieCode(movie_code);
	}
	
	@Override
	public List getMovieStillCut(String movie_code) throws Exception {
		return moviesDAO.getMovieStillCut(movie_code);
	}

}
