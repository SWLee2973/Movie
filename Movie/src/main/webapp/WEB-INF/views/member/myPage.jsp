<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<link href="${contextPath }/resources/css/book.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deleteBook(booking_code){
		if(confirm('정말 삭제하시겠습니까?') == true){
			location.href = '${contextPath}/admin/book/m_deleteBook.do?booking_code='+booking_code;
			alert('삭제했습니다.');
		}
	}
</script>
<body>
	<div style="height: 100px;"></div>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3"> <!-- 회원 정보 -->
				<h3 class="m-0 font-weight-bold text-primary" align="center">회원 정보</h3>
			</div>
			<div class="card-body" style="text-align: center;">
				<div class="table_member">
					<table class="book_manage">
						<tr>
							<td style="text-align: left">이메일</td>
							<td>${member_info.email }</td>
						</tr>
						<tr>
							<td style="text-align: left">이름</td>
							<td>${member_info.name }</td>
						</tr>
						<tr>
							<td style="text-align: left">생년월일</td>
							<td>${fn:substring(member_info.birth,0,10) }</td>
						</tr>
						<tr>
							<td style="text-align: left">휴대폰번호</td>
							<td>${member_info.phone_number }</td>
						</tr>
						<tr>
							<td style="text-align: left;">우편번호</td>
							<td>${member_info.zipcode }</td>
						</tr>
						<tr>
							<td style="text-align: left">주소</td>
							<td>${member_info.roadAddress } ${member_info.namujiAddress }</td>
						</tr>
					</table>
				</div>
			</div><br><br><br>
			<div class="card-header py-3">
				<h3 class="m-0 font-weight-bold text-primary" align="center">예매 목록</h3>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="book_result">
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
						<c:forEach var="book" items="${book_info }">
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
</body>

