package com.spring.movie.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.book.service.BookService;
import com.spring.movie.book.vo.BookInfoVO;
import com.spring.movie.book.vo.BookVO;
import com.spring.movie.common.base.BaseController;
import com.spring.movie.member.vo.MemberVO;
import com.spring.movie.movies.vo.MoviesVO;

@Controller("bookController")
@RequestMapping(value="/book")
public class BookControllerImpl extends BaseController implements BookController {
	@Autowired
	BookService bookService;
	
	@RequestMapping(value="/bookResult.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView bookMovies(@ModelAttribute("BookVO") BookVO bookVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String booking_code = getBookingCode();
		
		bookVO.setEmail(memberVO.getEmail());
		bookVO.setPhone_number(memberVO.getPhone_number());		
		bookVO.setBooking_code(booking_code);
		
		String time = bookVO.getTime();
		String movie_code = bookVO.getMovie_code();
		String screen_code = bookVO.getScreen_code();
		String theater_code = bookVO.getTheater_code();
		String movie_date = bookVO.getMovie_date();
		
		String seat = bookVO.getSelected_seat();
		String[] selected_seat = seat.split(",");
		
		bookService.addNewBook(bookVO);
		for(int i = 0; i<selected_seat.length; i++) {
			Map<String, String> tool = new HashMap<String, String>();
			tool.put("selected_seat", selected_seat[i]);
			tool.put("time", time);
			tool.put("movie_code", movie_code);
			tool.put("screen_code", screen_code);
			tool.put("theater_code", theater_code);
			tool.put("movie_date", movie_date);
			tool.put("booking_code", booking_code);
			bookService.setBookedSeat(tool);
		}
		
		ModelAndView mav = new ModelAndView(viewName);
		
		mav.addObject("bookVO", bookVO);
		session.removeAttribute("bookVO");
		return mav;
	}
	
	@RequestMapping(value="/selectSeat.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView selectSeat(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		
		BookVO bookVO = (BookVO) session.getAttribute("bookVO");
		String movie_code = bookVO.getMovie_code();
		String screen_code = bookVO.getScreen_code();
		String theater_code = bookVO.getTheater_code();
		String time = bookVO.getTime();
		String movie_date = bookVO.getMovie_date();
		Map<String, String> bookedSeatTool = new HashMap<String, String>();
		bookedSeatTool.put("movie_code", movie_code);
		bookedSeatTool.put("screen_code", screen_code);
		bookedSeatTool.put("theater_code", theater_code);
		bookedSeatTool.put("time", time);
		bookedSeatTool.put("movie_date", movie_date);
		
		List<BookInfoVO> bookInfoList = bookService.getBookInfo(bookedSeatTool);
		
		String seat_code_sum = "";
		for(int i=0; i<bookInfoList.size(); i++) {
			seat_code_sum += bookInfoList.get(i).getSeat_code();
		}
		
		List<String> row = new ArrayList<String>();
		row.add("A");		row.add("B");
		row.add("C");		row.add("D");
		row.add("E");		row.add("F");
		row.add("G");		row.add("H");
		row.add("I");		row.add("J");
		row.add("K");		row.add("L");
		
		
		MoviesVO movieVO = bookService.getMovieDetail(movie_code);
		String movieMainImage = bookService.getMovieMainImage(movie_code);
		
		mav.addObject("bookVO", bookVO);
		mav.addObject("movieVO", movieVO);
		mav.addObject("mainImage", movieMainImage);
		mav.addObject("seat_codeList", seat_code_sum);
		mav.addObject("row", row);
		mav.addObject("bookInfoList", bookInfoList);
		return mav;
	}
	
	@RequestMapping(value="/selectTime.do", method=RequestMethod.POST)
	public ModelAndView bookBySelectTime(@ModelAttribute("BookVO") BookVO bookVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("bookVO", bookVO);
		mav.setViewName("redirect:/book/selectSeat.do");
		return mav;
	}

	private static String getBookingCode() {
		int length = 7; //예약코드 길이
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		
		String chars[] =
				"a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z".split(",");
		
		for(int i = 0; i < length; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		
		return buffer.toString();
	}
}
