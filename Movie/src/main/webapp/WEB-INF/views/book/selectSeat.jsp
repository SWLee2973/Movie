<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.movie.book.vo.BookInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="book" value="${bookVO }"/>
<c:set var="movie" value="${movieVO }"/>
<c:set var="image" value="${mainImage }"/>
<link href="${contextPath }/resources/css/seat.css" rel="stylesheet">
<script src="${contextPath }/resources/lib/jquery/jquery.min.js"></script>
<body>
<script>
	var selected;
	var price;
	
	$(function(){
		$('.seat').click(function(e){
			$(e.target).toggleClass('clicked');
			var ea = $('.clicked').length;
			var total_price = ea * 10000;
			$('.price').html(total_price);
			$('.seat_count').html(ea);
			var selected_seat = [];
			var clicked_class = $('.clicked').attr('class', function(i){
				selected_seat.push(this.className.split(' ')[1].substring(1));
				$('.selected_seat').html(selected_seat + ", ");
			});
			selected = selected_seat;
			price = total_price;
		});
		
	});
	
	function book(movie_name, theater_name, screen_name,
								time, movie_date){
		if(selected == null || selected == ''){
			alert('좌석을 선택해 주세요.');
			return false;
		} else{
		var formObj = document.createElement("form");
		var f_movie_name = document.createElement("input");
		var f_theater_name = document.createElement("input");
		var f_screen_name = document.createElement("input");
		var f_selected_seat = document.createElement("input");
		var f_time = document.createElement("input");
		var f_movie_date = document.createElement("input");
		var f_total_price = document.createElement("input");

		var f_movie_code = document.createElement("input");
		var f_theater_code = document.createElement("input");
		var f_screen_code = document.createElement("input");
		
		f_movie_name.name = "movie_name";
		f_movie_name.value = movie_name;
		f_theater_name.name = "theater_name";
		f_theater_name.value = theater_name;
		f_screen_name.name = "screen_name";
		f_screen_name.value = screen_name;
		f_selected_seat.name = "selected_seat";
		f_selected_seat.value = selected;
		f_time.name = "time";
		f_time.value = time;
		f_movie_date.name = "movie_date";
		f_movie_date.value = movie_date;
		f_total_price.name = "total_price";
		f_total_price.value = price;
		
		f_movie_code.name = "movie_code";
		f_movie_code.value = "${movie.movie_code}";
		f_theater_code.name = "theater_code";
		f_theater_code.value = "${book.theater_code}";
		f_screen_code.name = "screen_code";
		f_screen_code.value = "${book.screen_code}";
		
		formObj.appendChild(f_movie_name);
		formObj.appendChild(f_theater_name);
		formObj.appendChild(f_screen_name);
		formObj.appendChild(f_selected_seat);
		formObj.appendChild(f_time);
		formObj.appendChild(f_movie_date);
		formObj.appendChild(f_total_price);
		
		formObj.appendChild(f_movie_code);
		formObj.appendChild(f_theater_code);
		formObj.appendChild(f_screen_code);
		
		document.body.appendChild(formObj);
		
		formObj.method = "post";
		formObj.action = "${contextPath}/book/bookResult.do";
		formObj.submit();
		}
	}
	
</script>
<%
	List bookInfo = (List)request.getAttribute("bookInfoList");
%>
<div style="height: 150px;"></div>
<div class="_wrapper">
	<div class="__box">
		<div class="inner_box">
			<div class="px-2 py-3 bg-warning text-white">좌석 선택</div>
			<div class="seat_section">
				<div class="px-3 py-5 bg-primary text-white">
					<b>SCREEN</b>
					</div><br>
					<div align="right">
						<div class="seat_ok">　</div>선택가능 <div class="bookedSeat">　</div>선택불가<br><br>
					</div>
				<c:forEach var="row" items="${row }">
					<div class="line_index">${row }</div>
					<c:forEach begin="1" end="13" step="1" var="i">
						<c:set var="test" value="${row }${i }"/>
						<%
						List<String> tmp = new ArrayList<String>();
						for(int i=0; i<bookInfo.size(); i++){ 
							BookInfoVO bookInfoVO = (BookInfoVO)bookInfo.get(i);
					 			if((bookInfoVO.getBooked_flag().equals("1")) && 
					 					(bookInfoVO.getSeat_code().equals(pageContext.findAttribute("test")))){ %><%-- 예매내역에 등록된 좌석이면 --%>
								<div class="bookedSeat">　</div> <%-- 선택되지 않는 좌석을 출력 --%>
						<%	
								tmp.add((String)pageContext.findAttribute("test")); /* tmp 리스트에 해당 예매된 좌석을 추가 */
								}
						 	}
						 		if(!tmp.contains(pageContext.findAttribute("test"))){%> <%-- tmp리스트에 포함되지 않은(예매되지 않은) 모든좌석들은  --%>
								<div class="seat _${row }${i}">${i }</div> <%-- 선택할 수 있는 좌석을 출력 --%>
								<%}%>
					</c:forEach><br>
				</c:forEach>
				<br>
				선택한 좌석: <strong><span class="selected_seat">없음,</span></strong>
				총 <strong><span class="seat_count">0</span></strong> 석
			</div>
			
			<div class="book_form">
				<%-- <img src="${contextPath }/resources/img/${image}" class="movie_img"> --%>
				<img class="movie_img" src="${contextPath}/thumbnails.do?movie_code=${movie.movie_code}&image=${movie.image}"><br>
				<div class="info">
					<div class="info_book">
						● <span class="badge badge-warning">${movie.rating }</span> 
						<span class="movie">${movie.name }</span><br>
						● <span class="theater">${book.theater_name }</span> 
						<span class="screen">${book.screen_name }</span><br>
						● <span class="date">${book.movie_date }</span> 
						<span class="time">${book.time }</span><br>
						● <span class="price">0</span><b> 원</b><br><!-- 좌석 갯수 세어서 * 10000원 -->
					</div>
					<div class="info_pay">
						<input class="btn btn-success pay" type="button" value="결제하기"
									onclick="return book('${movie.name}', '${book.theater_name }', '${book.screen_name }'
																	,'${book.time }', '${book.movie_date }');"><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="height: 100px;"></div>
</body>			