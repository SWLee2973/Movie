package com.spring.movie.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.movie.book.vo.BookInfoVO;
import com.spring.movie.book.vo.BookVO;

@Repository("bookDAO")
public class BookDAOImpl implements BookDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void addNewBook(BookVO bookVO) throws DataAccessException {
		sqlSession.insert("mapper.book.addNewBook", bookVO);
	}

	@Override
	public void setBookedSeat(Map<String, String> tool) throws DataAccessException {
		sqlSession.insert("mapper.book.setSelectedSeat", tool);
	}

	@Override
	public List<BookInfoVO> getBookInfo(Map<String, String> bookedSeatTool) throws DataAccessException {
		return sqlSession.selectList("mapper.book.getBookInfo", bookedSeatTool);
		
	}

	@Override
	public List<BookVO> getBookDetail(String email) throws DataAccessException {
		return sqlSession.selectList("mapper.book.getUserBook", email);
	}

}
