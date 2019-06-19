<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
	alert("아이디나 비밀번호가 틀렸습니다.");
}

function login(){
	submit();
}
</script>
</c:if>
<div style="height: 100px;"></div>
<div style="height: 480px; text-align: center;">
	<br><br><br><br>
	<div class="login_wrapper">
		<H3>LIFE THEATER, GIGABOX</H3>
		<form action="${contextPath}/member/login.do" method="post">
			<input name="email" type="text" placeholder="이메일" class="form_input"/><br>
			<input name="password" type="password" placeholder="비밀번호" class="form_input"/><br><br>
			
			<button onclick="return login();" class="btn btn-success" style="width: 100%;">
				<i class="fa fa-sign-in"></i> 로그인
			</button><Br><br>
			<a href="${contextPath }/member/forgotEmail.do" class="btn btn-primary">아이디 찾기</a> 
			<a href="${contextPath }/member/forgotPassword.do" class="btn btn-primary">비밀번호 찾기</a>
			<a href="${contextPath}/member/addMember.do" class="btn btn-warning">회원가입</a>
		</form>		
	</div>   
</div>