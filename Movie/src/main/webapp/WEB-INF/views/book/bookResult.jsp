<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="book" value="${bookVO }"/>
<link href="${contextPath }/resources/css/book.css" rel="stylesheet">
</head>
<BODY>
<div style="height: 100px;"></div>
<div class="_wrapper">
	<div class="__box">
		<h2>예매 완료!</h2><br><br>
		<div class="table_box">
			<table class="book_result">
				<tr >
					<th colspan="5">예매 결과</th>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">	예매 코드</td>
					<td></td>
					<td></td>
					<td><strong>${book.booking_code}</strong></td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">영화명</td>
					<td></td>
					<td></td>
					<td>${book.movie_name }</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">영화관</td>
					<td></td>
					<td></td>
					<td>기가박스 ${book.theater_name } ${book.screen_name }</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">일시</td>
					<td></td>
					<td></td>
					<td>${book.movie_date }, ${book.time }</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">좌석</td>
					<td></td>
					<td></td>
					<td>${book.selected_seat }</td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: center;">가격</td>
					<td></td>
					<td></td>
					<td>총 <strong>${book.total_price }</strong> 원</td>
				</tr>
			</table>
		</div><br><br>
		<div align="right">
			<a href="${contextPath }/main/main.do"
				class="btn btn-primary">메인으로 돌아가기</a>
		</div>
	</div>
</div>
</BODY>
			