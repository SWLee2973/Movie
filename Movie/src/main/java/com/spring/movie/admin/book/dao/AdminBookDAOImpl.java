package com.spring.movie.admin.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.book.vo.BookVO;

@Repository("adminBookDao")
public class AdminBookDAOImpl implements AdminBookDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BookVO> getAllBookList() throws DataAccessException {
		return sqlSession.selectList("mapper.admin.book.getAllBookList");
	}

	@Override
	public void deleteBook(String booking_code) throws DataAccessException {
		sqlSession.delete("mapper.admin.book.deleteBook", booking_code);
		sqlSession.delete("mapper.admin.book.deleteBookedSeat", booking_code);
	}

	@Override
	public List<BookVO> bookDetail(String email) throws DataAccessException {
		return sqlSession.selectList("mapper.admin.book.getUserBook", email);
	}

	@Override
	public String getEmail(String booking_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.book.getEmail", booking_code);
	}

	@Override
	public List<String> getBook_code(String email) throws DataAccessException {
		return sqlSession.selectList("mapper.admin.book.getBook_code", email);
	}
}
