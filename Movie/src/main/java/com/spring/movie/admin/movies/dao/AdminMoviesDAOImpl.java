package com.spring.movie.admin.movies.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.movies.vo.TheaterVO;

@Repository("adminMoviesDAO")
public class AdminMoviesDAOImpl implements AdminMoviesDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllTheatersList() throws DataAccessException {
		
		return sqlSession.selectList("mapper.theater.getAllTheatersList");
	}

	@Override
	public List<String> selectAllAreaList() throws DataAccessException {
		return sqlSession.selectList("mapper.theater.getAllAreaList");
	}

	@Override
	public List<TheaterVO> selectTheaterDetail(String theater_code) throws DataAccessException {
		List<TheaterVO> theaterList = sqlSession.selectList("mapper.theater.selectTheaterDetail", theater_code);
		return theaterList;
	}

	@Override
	public TheaterVO getSummary(String theater_code) throws DataAccessException {
		return (TheaterVO) sqlSession.selectOne("mapper.theater.getSummary", theater_code);
	}
	
	@Override
	public int addNewMovies(Map newMoviesMap) throws DataAccessException {
		return sqlSession.insert("mapper.movie.addNewMovies", newMoviesMap);
	}
	
	@Override
	public int deleteMovies(Map deleteMoviesMap) throws DataAccessException {
//		return sqlSession.selectOne("mapper.movie.removeMovies", deleteMoviesMap);
		return 0;
	}

	@Override
	public void addNewMoviesPicture(Map<String, Object> newMoviesMap) {
		sqlSession.insert("mapper.movie.addNewMoviesPictures",newMoviesMap);
	}

	@Override
	public int addNewStillCut(Map<String, Object> newStillCutMap) throws DataAccessException {
		return sqlSession.insert("mapper.movie.addNewStillCut", newStillCutMap);
		
	}

	@Override
	public void addNewTime(Map<String, String> tool) throws DataAccessException {
		sqlSession.insert("mapper.movie.addNewTime", tool);
	}

	@Override
	public void removeMovie(String movie_code) throws DataAccessException {
		String movie_name = sqlSession.selectOne("mapper.movie.nameFromBooking", movie_code);
		sqlSession.delete("mapper.movie.deleteMovie", movie_code);
		sqlSession.delete("mapper.movie.delete_booking", movie_name);
		sqlSession.delete("mapper.movie.delete_seat", movie_code);
		sqlSession.delete("mapper.movie.delete_time", movie_code);
		sqlSession.delete("mapper.movie.delete_movie_picture", movie_code);
	}


}
