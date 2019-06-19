package com.spring.movie.book.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movie.book.dao.BookDAO;
import com.spring.movie.book.vo.BookInfoVO;
import com.spring.movie.book.vo.BookVO;
import com.spring.movie.movies.dao.MoviesDAO;
import com.spring.movie.movies.vo.MoviesVO;

@Service("BookService")
public class BookServiceImpl implements BookService{
	@Autowired
	BookDAO bookDAO;
	@Autowired
	MoviesDAO moviesDAO;

	@Override
	public String getMovieMainImage(String movie_code) throws Exception {
		return moviesDAO.getMovieMainImage(movie_code);
	}

	@Override
	public MoviesVO getMovieDetail(String movie_code) throws Exception {
		return moviesDAO.getMovieByMovieCode(movie_code);
	}

	@Override
	public void addNewBook(BookVO bookVO) throws Exception {
		bookDAO.addNewBook(bookVO);
	}

	@Override
	public void setBookedSeat(Map<String, String> tool)
			throws Exception {
		
		bookDAO.setBookedSeat(tool);		
	}

	@Override
	public List<BookInfoVO> getBookInfo(Map<String, String> bookedSeatTool) throws Exception {
		return bookDAO.getBookInfo(bookedSeatTool);
	}

	@Override
	public List<BookVO> bookDetail(String email) throws Exception {
		return bookDAO.getBookDetail(email);
	}

	

}
