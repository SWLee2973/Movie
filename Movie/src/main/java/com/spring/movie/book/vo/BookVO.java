package com.spring.movie.book.vo;

import org.springframework.stereotype.Component;

@Component("bookVO")
public class BookVO {
	private String booking_code;
	private String email;
	private String phone_number;
	private String movie_name; //영화 이름
	private String movie_code;
	private String theater_code;
	private String theater_name;
	private String screen_code;
	private String screen_name;
	private String time;
	private String movie_date;
	private String selected_seat;
	private int total_price;
	
	public String getSelected_seat() {
		return selected_seat;
	}
	public void setSelected_seat(String selected_seat) {
		this.selected_seat = selected_seat;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getBooking_code() {
		return booking_code;
	}
	public void setBooking_code(String booking_code) {
		this.booking_code = booking_code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
}
