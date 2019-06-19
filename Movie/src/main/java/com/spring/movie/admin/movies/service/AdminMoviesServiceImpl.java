package com.spring.movie.admin.movies.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.movie.admin.movies.dao.AdminMoviesDAO;
import com.spring.movie.movies.vo.TheaterVO;

@Service("adminMoviesService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMoviesServiceImpl implements AdminMoviesService {
	@Autowired
	AdminMoviesDAO adminMoviesDAO;
	
	@Override
	public List listTheaters() throws Exception {
		List<TheaterVO> theatersList = null;
		theatersList = adminMoviesDAO.selectAllTheatersList();
		return theatersList;
	}

	@Override
	public List getAreaList() throws Exception {
		List<String> areaList = null;
		areaList = adminMoviesDAO.selectAllAreaList();
		return areaList;
	}
	
	@Override
	public int addNewMovies(Map newMoviesMap) throws Exception {
		return adminMoviesDAO.addNewMovies(newMoviesMap);
	}

	@Override
	public Map theaterDetail(String theater_code) throws Exception {
		Map theaterMap = new HashMap();
		List<TheaterVO> theaterDetailList = adminMoviesDAO.selectTheaterDetail(theater_code);
		theaterMap.put("theaterDetailList", theaterDetailList);
		return theaterMap;
	}

	@Override
	public TheaterVO getTheaterSummary(String theater_code) throws Exception {
		TheaterVO theaterVO = adminMoviesDAO.getSummary(theater_code);
		return theaterVO;
	}

	@Override
	public int deleteMovies(Map deleteMoviesMap) throws Exception {
		return adminMoviesDAO.deleteMovies(deleteMoviesMap);
	}

	@Override
	public void addNewMoviesPicture(Map<String, Object> movieMap) throws Exception {
		adminMoviesDAO.addNewMoviesPicture(movieMap);
		
	}

	@Override
	public void addNewStillCut(Map<String, Object> newStillCutMap) throws Exception{
		adminMoviesDAO.addNewStillCut(newStillCutMap);
	}

	@Override
	public void addNewTime(Map<String, String> tool) throws Exception {
		adminMoviesDAO.addNewTime(tool);
	}

	@Override
	public void removeMovie(String movie_code) throws Exception {
		adminMoviesDAO.removeMovie(movie_code);
	}
}
