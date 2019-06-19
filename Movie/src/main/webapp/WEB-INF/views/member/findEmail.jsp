<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<c:if test='${not empty message }'>
<script>
function move(){
	submit();
}
</script>
</c:if>
<div style="height: 100px;"></div>
<div style="height: 480px; text-align: center;">
	<br><br><br><br><br><br><br><br>
	<div class="login_wrapper">
		<c:choose>
		<c:when test="${email != null || not empty email }">
		<font size="6">찾으시는 아이디는
		<strong>${email }</strong>	
		입니다.</font><br><br>
		</c:when>
		<c:when test="${email == null || empty email }">
		<font size="6">찾으시는 아이디가 없습니다.</font><br><br>
		</c:when>
		</c:choose>
		<a href="${contextPath }/member/loginForm.do" class="btn btn-success">로그인</a>
		<a href="${contextPath }/member/forgotPassword.do" class="btn btn-primary">비밀번호 찾기</a>
	</div>   
</div>