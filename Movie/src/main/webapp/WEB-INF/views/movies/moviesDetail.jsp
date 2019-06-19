<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<title>상세보기창</title>
<script>
	var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  if(n > slides.length) {
		  	slideIndex = 1;
		}    
	  if(n < 1) {
		  	slideIndex = slides.length;
		}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  slides[slideIndex-1].style.display = "block";  
	}
</script>
<link href="${contextPath }/resources/css/movie.css" rel="stylesheet">
</head>
<body>
	<div class="mystyle">
		<h1>${moviesVO.name}</h1>
		<div style="height: 20px;"></div>
		<div style="text-align: center;">
			<table>
				<tr>
					<td rowspan='10'>
						<img class="poster" src="${contextPath}/thumbnails.do?movie_code=${moviesVO.movie_code}&image=${moviesVO.image}">
					</td>
				</tr>
				<tr>
					<td>　　　　　　</td>
					<td><span class="category">장르 :</span>  ${moviesVO.genre}</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">러닝타임 :</span> ${moviesVO.running_time} 분</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">감독 :</span> ${moviesVO.director}</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">상영등급 :</span> ${moviesVO.rating}</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">제작사 :</span> ${moviesVO.company}</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">국가 :</span> ${moviesVO.country}</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">출연진 :</span> ${moviesVO.actors}</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span class="category">개봉 날짜 :</span> ${fn:substring(moviesVO.open_date,0,10)}
					</td>
				</tr>
				<tr>
					<td></td>
					<td><span class="category">누적 관객 :</span> ${moviesVO.movie_view}</td>
				</tr>
			</table>
		</div>
		<div class="clear"></div>
		<h3>줄거리</h3>
		<hr class="myLine">
		<h4>${moviesVO.summary}</h4>
		<br>
		<br>
		<br>
		<h1>${moviesVO.name} 스틸컷</h1>
		<br><br><br><br><br>
		<div class="slideShow-container">
			<c:forEach var="i" items="${stillCutList}">
				<div class="mySlides" style="display: block;">
					<img id="stillCutImage" src="${contextPath}/thumbnails2.do?movie_code=${i.movie_code}&movie_image_path=${i.movie_image_path}">
				</div>
			</c:forEach>
			<div class="block1"></div>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
	</div>
	<div style="height: 500px;"></div>
</body>
</html>