package com.spring.movie.book.service;

import java.util.List;
import java.util.Map;

import com.spring.movie.book.vo.BookInfoVO;
import com.spring.movie.book.vo.BookVO;
import com.spring.movie.movies.vo.MoviesVO;

public interface BookService {
	public void addNewBook(BookVO bookVO) throws Exception;
	public MoviesVO getMovieDetail(String movie_code) throws Exception;
	public String getMovieMainImage(String movie_code) throws Exception;
	public void setBookedSeat(Map<String, String> tool) throws Exception;
	public List<BookInfoVO> getBookInfo(Map<String, String> bookedSeatTool) throws Exception;
	public List<BookVO> bookDetail(String email) throws Exception;
}
