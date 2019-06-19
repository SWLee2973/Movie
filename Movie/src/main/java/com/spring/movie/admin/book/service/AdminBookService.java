package com.spring.movie.admin.book.service;

import java.util.List;

import com.spring.movie.book.vo.BookVO;

public interface AdminBookService {

	List<BookVO> getAllBookList() throws Exception;
	void deleteBook(String booking_code) throws Exception;
	List<BookVO> bookDetail(String email) throws Exception;
	String getEmail(String booking_code) throws Exception;
	List<String> getBook_code(String email) throws Exception;

}
