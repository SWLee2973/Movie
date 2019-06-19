<%@page import="com.spring.movie.member.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	
	String rDate = format.format(date);
%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="theaterDetailList" value="${theaterMap.theaterDetailList }"/>
<c:set var="date"  value="<%=rDate %>"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${contextPath }/resources/css/theater.css" rel="stylesheet">
<script src="${contextPath }/resources/lib/jquery/jquery.min.js"></script>
<script src="${contextPath }/resources/js/theater.js"></script>
</head>
<body>
<div style="height: 88px;"></div>
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
	<div style="height: 500px;">
		<div style="background-image: url('${contextPath}/resources/img/theater_seat.jpg');
							height: 100%; width: 100%; background-size: cover;
							text-align: center; color: white;">
			<br><br><br><br><br>
			<p style="background-color: black; background-color: rgba(0, 0, 0, 0.5);
								float: left; padding: 5px; text-align: left;">
				<span style="color: white; font-size: 20px;">라이프시어터</span><br><br>
				<span style="color: white; font-size: 40px;">기가박스 <strong>${theaterSummary.theater_name }</strong></span>
			</p><br><br><br><br><br><br>
			<p style="background-color: black; background-color: rgba(0, 0, 0, 0.5);
								float: left; padding: 5px; text-align: left;">
				<span style="color: white;">${theaterSummary.theater_summary }</span>
			</p>
		</div>
	</div>
	<div class="clear"></div>
	<%
		String theater_code = request.getQueryString();
		String movie_date = theater_code.substring(theater_code.indexOf("&") + 1);
		theater_code = theater_code.substring(theater_code.indexOf("=") + 1, theater_code.indexOf("&"));
		movie_date = movie_date.substring(movie_date.indexOf("=") + 1);
		pageContext.setAttribute("selectedTheater_code", theater_code);
		pageContext.setAttribute("selectedMovie_date", movie_date);
	%>
	<c:set var="theater_code" value="<%=theater_code %>"/>
	<c:set var="movie_date" value="<%=movie_date %>"/>
	<script>
	function selectDate(object){
		var formObj = document.createElement("form");
		var i_cal = document.createElement("input");
		var i_theater = document.createElement("input");
		i_theater.name = "theater_code";
		i_theater.value = "${selectedTheater_code}";
		i_cal.name = "movie_date";
		i_cal.value = object.value;
		
		formObj.appendChild(i_theater);
		formObj.appendChild(i_cal);
		
		document.body.appendChild(formObj);
		
		formObj.method = "get";
		formObj.action = "${contextPath}/movies/theaterDetail.do";
		formObj.submit(); 
	}
	
	function selectTime(movie_name, movie_code, theater_code, theater_name,
									screen_code, screen_name, time, date){
		/* var memberVO = ""; */
		var isLogOn = "${isLogOn}";
		if(isLogOn == false || isLogOn == ""){
			alert('로그인을 해주세요.');
			location.href="${contextPath}/member/loginForm.do";
		} else {	
			var formObj = document.createElement("form");
			var i_movie_name = document.createElement("input");
			var i_movie_code = document.createElement("input");
			var i_theater_code = document.createElement("input");
			var i_theater_name = document.createElement("input");
			var i_screen_code = document.createElement("input");
			var i_screen_name = document.createElement("input");
			var i_time = document.createElement("input");
			var i_date = document.createElement("input");
			
			i_movie_name.name = "movie_name";
			i_movie_name.value = movie_name;
			i_movie_code.name = "movie_code";
			i_movie_code.value = movie_code;		
			i_theater_code.name = "theater_code";
			i_theater_code.value = theater_code;		
			i_theater_name.name = "theater_name";
			i_theater_name.value = theater_name;		
			i_screen_code.name = "screen_code";
			i_screen_code.value = screen_code;		
			i_screen_name.name = "screen_name";
			i_screen_name.value = screen_name;		
			i_time.name = "time";
			i_time.value = time;		
			i_date.name = "movie_date";
			i_date.value = date;
			
			formObj.appendChild(i_movie_name);
			formObj.appendChild(i_movie_code);
			formObj.appendChild(i_theater_code);
			formObj.appendChild(i_theater_name);
			formObj.appendChild(i_screen_code);
			formObj.appendChild(i_screen_name);
			formObj.appendChild(i_time);
			formObj.appendChild(i_date);
			
			document.body.appendChild(formObj);
			
			formObj.method="post";
			formObj.action="${contextPath}/book/selectTime.do";
			formObj.submit();
		}
		
		
	}
	</script>
	<div style="color: black;">
		<h2>상영시간표</h2>
		<hr>
		<form>
			<strong>날짜 선택</strong>
			<input type="date" onchange="return selectDate(this);" 
						name="cal" value="${movie_date }">
		</form>
	</div>
	<form name="time_select" method="post" action="${contextPath }/book/selectSeat.do">
		<table>
			<tbody>
				<c:forEach var="theaterDetail" items="${theaterDetailList }">
					<c:if test="${theaterDetail.theater_code == selectedTheater_code && selectedMovie_date == fn:substring(theaterDetail.movie_date,0,10)}">
						<tr>
							<td class="sc_name">
								<c:choose>
									<c:when test="${theaterDetail.rating == '12세' }">
										<span class="badge badge-success">12</span>
									</c:when>
									<c:when test="${theaterDetail.rating == '15세' }">
										<span class="badge badge-success">15</span>
									</c:when>
									<c:when test="${theaterDetail.rating == '청불' }">
										<span class="badge badge-danger">청불</span>
									</c:when>
									<c:when test="${theaterDetail.rating == '전체' }">
										<span class="badge badge-warning">전체</span>
									</c:when>
								</c:choose>
								${theaterDetail.name }
							</td>
							<td class="sc_screen">
								${theaterDetail.screen_name }
							</td>
							<td class="sc_schedule">
								<c:if test="${not empty theaterDetail.t1 && theaterDetail.t1 != ' '}">
									<input type="button" class="table_elem" value="${theaterDetail.t1 }" 
												name="time" onclick="return selectTime('${theaterDetail.name}','${ theaterDetail.movie_code }'
																												,'${theaterDetail.theater_code }', '${theaterSummary.theater_name }'
																												,'${theaterDetail.screen_code }', '${theaterDetail.screen_name }'
																												,'${theaterDetail.t1 }','${movie_date }');">
								</c:if>
							</td>
							<td class="sc_schedule">
								<c:if test="${not empty theaterDetail.t2 && theaterDetail.t2 != ' '}">
									<input type="button" class="table_elem" value="${theaterDetail.t2 }" 
												name="time" onclick="return selectTime('${theaterDetail.name}','${ theaterDetail.movie_code }'
																												,'${theaterDetail.theater_code }', '${theaterSummary.theater_name }'
																												,'${theaterDetail.screen_code }', '${theaterDetail.screen_name }'
																												,'${theaterDetail.t2 }','${movie_date }');">
								</c:if>
							</td>
							<td class="sc_schedule">
								<c:if test="${not empty theaterDetail.t3 && theaterDetail.t3 != ' '}">
									<input type="button" class="table_elem" value="${theaterDetail.t3 }" 
												name="time" onclick="return selectTime('${theaterDetail.name}','${ theaterDetail.movie_code }'
																												,'${theaterDetail.theater_code }', '${theaterSummary.theater_name }'
																												,'${theaterDetail.screen_code }', '${theaterDetail.screen_name }'
																												,'${theaterDetail.t3 }','${movie_date }');">
								</c:if>
							</td>
							<td class="sc_schedule">
								<c:if test="${not empty theaterDetail.t4 && theaterDetail.t4 != ' '}">
									<input type="button" class="table_elem" value="${theaterDetail.t4 }" 
												name="time" onclick="return selectTime('${theaterDetail.name}','${ theaterDetail.movie_code }'
																												,'${theaterDetail.theater_code }', '${theaterSummary.theater_name }'
																												,'${theaterDetail.screen_code }', '${theaterDetail.screen_name }'
																												,'${theaterDetail.t4 }','${movie_date }');">
								</c:if>
							</td>
							<td class="sc_schedule">
								<c:if test="${not empty theaterDetail.t5 && theaterDetail.t5 != ' '}">
									<input type="button" class="table_elem" value="${theaterDetail.t5 }" 
												name="time" onclick="return selectTime('${theaterDetail.name}','${ theaterDetail.movie_code }'
																												,'${theaterDetail.theater_code }', '${theaterSummary.theater_name }'
																												,'${theaterDetail.screen_code }', '${theaterDetail.screen_name }'
																												,'${theaterDetail.t5 }','${movie_date }');">
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>
