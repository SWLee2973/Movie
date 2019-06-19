<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${contextPath }/resources/css/book.css" rel="stylesheet">
<script>
	function deleteBook(booking_code){
		if(confirm('정말 삭제하시겠습니까?') == true){
			location.href = '${contextPath}/admin/book/deleteBook.do?booking_code='+booking_code;
			alert('삭제했습니다.');
		}
	}
</script>
<body>
<div style="height: 100px;"></div>
<div class="container-fluid">
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h3 class="m-0 font-weight-bold text-primary" align="center">예매 목록</h3>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="book_manage">
				<tr>
					<th>예매 코드</th>
					<th>예매 회원</th>
					<th>지점</th>
					<th>상영관</th>
					<th>영화명</th>
					<th>좌석</th>
					<th>일시</th>
					<th>비고</th>
				</tr>
				<c:forEach var="book" items="${bookList }">
				<tr>
					<td>${book.booking_code }</td>
					<td>${book.email }</td>
					<td>${book.theater_name }</td>
					<td>${book.screen_name }</td>
					<td>${book.movie_name }</td>
					<td>${book.selected_seat }</td>
					<td>${fn:substring(book.movie_date,0,10) } ${book.time }</td>
					<td><a href="javascript:void(0);" class="badge btn-danger"
								onclick="return deleteBook('${book.booking_code}')">삭제</a></td>
				</tr>
				</c:forEach>				
			</table>
			<div style="height: 20px;"></div>
		</div>
	</div>
</div>
</div>

