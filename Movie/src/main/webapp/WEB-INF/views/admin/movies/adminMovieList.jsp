<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath}/resources/css/adminMovieList.css" rel="stylesheet">
<script>
function deleteMovie(movie_code){
	if(confirm('정말 삭제하시겠습니까?') == true){
		location.href = '${contextPath}/movies/removeMovie.do?movie_code='+movie_code;
		alert('삭제했습니다.');
	}
}
</script>
</head>
<body>
<div style="height: 80px;"></div>
<div style="text-align: center;">
	<h3>영화 관리</h3>
</div>
<div class="container-fluid">
	<div class= card-body>
		<div class="table-responsive">
			<table class="am_manage">
				<tr>
					<th>영화 코드</th>
					<th>이름</th>
					<th>장르</th>
					<th>관람등급</th>
					<th>개봉일</th>
					<th>비고</th>
				</tr>
				<c:forEach var="item" items="${movieList}">
				<tr>
					<td><b>${item.movie_code}</b></td>
					<td>${item.name}</td>
					<td>${item.genre}</td>
					<td>${item.rating}</td>
					<td>${fn:substring(item.open_date,0,10)}</td>
					<td>
						<a href="javascript:void(0);" class="badge btn-danger" onclick="return deleteMovie('${item.movie_code}')">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<div style="height:20px"></div>
		</div>
	</div>
</div>
</body>
</html>