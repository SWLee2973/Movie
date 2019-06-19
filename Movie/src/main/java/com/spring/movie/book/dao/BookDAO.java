package com.spring.movie.book.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.movie.book.vo.BookInfoVO;
import com.spring.movie.book.vo.BookVO;

public interface BookDAO {
	public void addNewBook(BookVO bookVO) throws DataAccessException;
	public void setBookedSeat(Map<String, String> tool) throws DataAccessException;
	public List<BookInfoVO> getBookInfo(Map<String, String> bookedSeatTool) throws DataAccessException;
	public List<BookVO> getBookDetail(String email) throws DataAccessException;
}
