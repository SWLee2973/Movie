<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<BODY>
<div style="height: 100px;"></div>
<h6>이벤트 게시판</h6>
이벤트 글쓰기, 수정, 댓글달기, 등등 게시판에 필요한 구성품 구현
<a href="${contextPath }/main/main.do">&gt;메인으로</a>

<%!
	/* 적분구간: -2~2 */
	/* f: sqrt(9-9/4*x), S: (int f) * 2 */
	/* n은 난수의 갯수 */
	public double method(int n){
		double sum = 0;
		double x = 2 * Math.random() - 2;
		double y = 3 * Math.random() - 3;
		for(int i = 0; i < n; i++){
			if(x*2/4 + y*3/9 <= 1){
				sum += 1;
			}
		}
		return sum;
	}
%>
<br>
n:10 => <%=method(10) %><br>
n:100 => <%=method(100) %><br>
n:1000 => <%=method(1000) %><br>
n:10000 => <%=method(10000) %><br>
</BODY>
			