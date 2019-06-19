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
		<c:when test="${password != null || not empty password }">
		<font size="6">찾으시는 비밀번호는
		<strong>${password }</strong>	
		입니다.</font><br><br>
		</c:when>
		<c:when test="${password == null || empty password }">
		<font size="6">일치하는 정보가 없습니다.</font><br><br>
		</c:when>
		</c:choose>
		<a href="${contextPath }/member/loginForm.do"
			class="btn btn-success">로그인</a>
	</div>   
</div>