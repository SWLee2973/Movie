package com.spring.movie.movies.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.movies.vo.MoviesVO;

@Repository("moviesDAO")
public class MoviesDAOImpl implements MoviesDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List getMovieList() throws DataAccessException {
		return sqlSession.selectList("mapper.movie.selectMovies");
	}

	@Override
	public List getMoviePictureList() throws DataAccessException {
		return sqlSession.selectList("mapper.movie.selectPictures");
	}

	@Override
	public List getOpenDate() throws DataAccessException {
		return sqlSession.selectList("mapper.movie.openDate");
	}

	@Override
	public String getMovieMainImage(String movie_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.movie.getMainImage", movie_code);
	}

	@Override
	public MoviesVO getMovieByMovieCode(String movie_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.movie.getMovieDetail", movie_code);
	}

	@Override
	public List getMovieStillCut(String movie_code) throws DataAccessException {
		return sqlSession.selectList("mapper.movie.selectStillCut", movie_code);
	}

}
