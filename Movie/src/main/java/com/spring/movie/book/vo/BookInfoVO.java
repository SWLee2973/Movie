package com.spring.movie.book.vo;

import org.springframework.stereotype.Component;

@Component("bookInfoVO")
public class BookInfoVO {
	String seat_code;
	String booked_flag;
	
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getBooked_flag() {
		return booked_flag;
	}
	public void setBooked_flag(String booked_flag) {
		this.booked_flag = booked_flag;
	}
	
	
}
