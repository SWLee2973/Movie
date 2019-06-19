<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<body>
<div style="height: 100px;"></div>
<H6>예매폼 페이지</H6>
<!-- 좌석고르기는 a태그가 아닌 form에서 action의 목적지로 설정해야함. 매핑 확인용 a태그 -->
<a href="${contextPath }/book/selectSeat.do">좌석고르기</a>
</body>			