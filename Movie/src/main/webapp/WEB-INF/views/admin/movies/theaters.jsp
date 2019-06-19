<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	String rDate = format.format(date);
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="date"  value="<%=rDate%>"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${contextPath }/resources/css/theater.css" rel="stylesheet">
<script src="${contextPath }/resources/lib/jquery/jquery.min.js"></script>
<script src="${contextPath }/resources/js/theater.js"></script>
</head>
<body>
<div style="height: 78px;"></div>
<div style="height: 600px;">
	<div class="screen_header">
		<div class="header_elements">
			<div style="width: 20em; display: inline-block;">
				<span class="screen_font">
					<strong>GIGABOX</strong>
				</span>
				<h3>Life Theater</h3>
				<hr>
			</div>
			<div>
				<strong>¿Œª˝±ÿ¿Â, Life Theater GIGABOX</strong>
			</div>
		</div>
	</div>
</div>
<div class="_wrapper">
	<div class="__menubar">
		<ul class="__menu">
			<c:forEach var="theater_area" items="${theaterAreas }">
				<li><a href="javascript:void(0);">${theater_area.theater_area }</a>
					<ul>
						<c:forEach var="theater" items="${theatersList }">
							<c:if test="${theater.theater_area == theater_area.theater_area }">
						<li>
							<a href="${contextPath }/movies/theaterDetail.do?theater_code=${theater.theater_code }&movie_date=${date}">
								${theater.theater_name }
							</a>
						</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div><!-- theater menubar -->
	<div class="clear"></div>
	<div class="content_wrapper"></div>
	<!-- <div class="content_foot_wrapper">
		<div class="content_foot_wrapper_1">
			<div class="foot_head">
			
			</div>
			<div class="foot_content">
				<div></div>
			</div>
		</div>
		<div class="content_foot_wrapper_2">
		
		</div>
	</div> -->
</div>
</body>
</html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	var images = ["theater1.jpg", "theater2.jpg", "theater3.jpg", "theater4.jpg", "theater5.jpg", "theater6.jpg", "theater7.jpg", "theater8.jpg"];
	$(function () {
		var i = 0; $(".content_wrapper").css("background-image", "url(../resources/img/" + images[i] + ")");
		setInterval(function () {
			i++;
			if (i == images.length) {
				i = 0;
			} $(".content_wrapper").fadeOut("slow", function () {
				$(this).css("background-image", "url(../resources/img/" + images[i] + ")");
				$(this).fadeIn("slow");// 1000 = 1√ 
			});
		}, 2500);
	});
</script>
