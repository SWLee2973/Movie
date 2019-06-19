<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<script>
function move(){
	var email = findForm.email.value;
	var name = findForm.name.value;
	var tel = findForm.tel.value;
	
	if(email == "" || name == "" || tel == ""){
		alert('빈칸을 채워 주세요.')
		return false;
	}
	submit();		
}

function back(){
	location.href='${contextPath}/member/loginForm.do';
}

function findEmail(){
	location.href='${contextPath}/member/forgotEmail.do';
}
</script>
<div style="height: 100px;"></div>
<div style="height: 480px; text-align: center;">
	<br><br><br>
	<div class="login_wrapper">
		<H3>이름과 전화번호를 입력해 주세요.</H3>
		<form action="${contextPath}/member/findPassword.do" method="post" name="findForm">
			<input name="email" type="text" placeholder="이메일" class="form_input"/><br>
			<input name="name" type="text" placeholder="이름" class="form_input"/><br>
			<input name="tel" type="text" placeholder="전화번호, '-'포함 입력" class="form_input"/><br><br>
			
			<button onclick="return move();" class="btn btn-success" style="width: 100%;">
				<i class="glyphicon glyphicon-question-sign"></i> 비밀번호 찾기
			</button>
		</form><br>		
			<button onclick="return findEmail();" class="btn btn-success" style="width: 100%;">
				<i class="glyphicon glyphicon-question-sign"></i> 아이디 찾기
			</button>
			<button onclick="return back();" class="btn btn-warning" style="width: 100%;">
				<i class="glyphicon glyphicon-chevron-left"></i> 돌아가기
			</button>
	</div>   
</div>