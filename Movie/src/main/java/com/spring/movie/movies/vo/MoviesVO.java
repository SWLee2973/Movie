package com.spring.movie.movies.vo;

import org.springframework.stereotype.Repository;

@Repository
public class MoviesVO {
	private String movie_code; //코드
	private String name; //이름
	private String genre; //장르
	private String running_time; //상영시간
	private String director; //감독
	private String rating; //관람등급
	private String company; //배급사
	private String country; //국가
	private String actors; //배우
	private String image; //대표 사진 코드
	private String open_date; //개봉일
	private String summary; //줄거리
	private String movie_view; //누적관객수
	private String category; //박스오피스, 최신개봉작, ...
	private Double score;
	private String movie_image_path;
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRunning_time() {
		return running_time;
	}
	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getMovie_view() {
		return movie_view;
	}
	public void setMovie_view(String movie_view) {
		this.movie_view = movie_view;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getMovie_image_path() {
		return movie_image_path;
	}
	public void setMovie_image_path(String movie_image_path) {
		this.movie_image_path = movie_image_path;
	}

	
}