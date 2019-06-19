<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<link href="${contextPath }/resources/css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function deleteMember(email, flag){
		if(flag == 1){
			alert('운영자는 삭제할 수 없습니다.');
			return false;
		} else{
			if(confirm('정말 삭제하시겠습니까?') == true){
				location.href = '${contextPath}/admin/member/deleteMember.do?email='+email;
				alert('삭제했습니다.');
			}			
		}
	}
</script>
<body>
<div style="height: 100px;"></div>
<div class="container-fluid">
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h3 class="m-0 font-weight-bold text-primary" align="center">회원 조회</h3>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="member">
				<tr>
					<th>이메일</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>주소</th>
					<th>가입일</th>
					<th>비고</th>
				</tr>
				<c:forEach var="member" items="${membersList }">
					<tr>
						<td>
							<a href="${contextPath }/admin/member/memberDetail.do?email=${member.email}" 
								class="btn btn-primary">${member.email }</a>
						</td>
						<td>${member.name }</td>
						<td>${fn:substring(member.birth,0,10)  }</td>
						<td>${member.gender }</td>
						<td>${member.roadAddress } ${member.namujiAddress }</td>
						<td>${fn:substring(member.reg_date,0,10) }</td>
						<td>
							<a href="javascript:void(0);" class="badge btn-danger"
										onclick="return deleteMember('${member.email}', '${member.admin_flag }');">								
								<span class="text">회원 삭제</span>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div style="height: 20px;"></div>
		</div>
	</div>
</div>
</div>

