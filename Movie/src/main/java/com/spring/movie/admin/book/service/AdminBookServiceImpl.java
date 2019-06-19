package com.spring.movie.admin.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movie.admin.book.dao.AdminBookDAO;
import com.spring.movie.book.vo.BookVO;

@Service("adminbookService")
public class AdminBookServiceImpl implements AdminBookService {
	@Autowired
	AdminBookDAO adminBookDAO;

	@Override
	public List<BookVO> getAllBookList() throws Exception {
		return adminBookDAO.getAllBookList();
	}

	@Override
	public void deleteBook(String booking_code) throws Exception {
		adminBookDAO.deleteBook(booking_code);
	}

	@Override
	public List<BookVO> bookDetail(String email) throws Exception {
		return adminBookDAO.bookDetail(email);
	}

	@Override
	public String getEmail(String booking_code) throws Exception {
		return adminBookDAO.getEmail(booking_code);
	}

	@Override
	public List<String> getBook_code(String email) throws Exception {
		return adminBookDAO.getBook_code(email);
	}
}
