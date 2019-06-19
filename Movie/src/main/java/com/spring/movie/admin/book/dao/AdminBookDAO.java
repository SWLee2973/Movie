package com.spring.movie.admin.book.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.movie.book.vo.BookVO;

public interface AdminBookDAO {

	List<BookVO> getAllBookList() throws DataAccessException;
	void deleteBook(String booking_code) throws DataAccessException;
	List<BookVO> bookDetail(String email) throws DataAccessException;
	String getEmail(String booking_code) throws DataAccessException;
	List<String> getBook_code(String email) throws DataAccessException;

}
