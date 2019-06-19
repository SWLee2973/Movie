<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<body>
	 <!-- Custom navbar -->
	<div class="custom-navbar">
		<div style="float: left; display: inline-block;">
 			<a href="${contextPath}/main/main.do">
				<img src="${contextPath }/resources/img/gigabox-logo.png">
			</a>
		</div>

		<div style="margin-top: 7px;">
			<a class="fm-button" href="javascript:void(0);" style="display: inline-block;">menu</a>
			<span style="font-size: 12px; font-weight: bold;">|</span>
			<a href="${contextPath }/movies/movies.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">Movie</a>
			<span style="font-size: 12px; font-weight: bold;">|</span>
			<a href="${contextPath }/movies/theaters.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">Theater</a>
			<span style="font-size: 12px; font-weight: bold;">|</span>
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.admin_flag==0}">
					<a href="${contextPath }/member/myPage.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">My Page</a>
					<span style="font-size: 12px; font-weight: bold;">|</span>
					<span style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">${memberInfo.name }님</span>
					<span style="font-size: 12px; font-weight: bold;">|</span>
					<a href="${contextPath }/member/logout.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">Logout</a>
				</c:when>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.admin_flag==1}">
					<span style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">${memberInfo.name }님(admin)</span>
					<span style="font-size: 12px; font-weight: bold;">|</span>
					<a href="${contextPath }/member/logout.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">Logout</a>
				</c:when>
				<c:otherwise>
					<a href="${contextPath }/member/loginForm.do" style="display: inline-block; font-size: 12px; font-weight: bold; color: black;">Login</a>
				</c:otherwise>		
			</c:choose>
		</div>
	</div>
	<div class="sidemenu">
		<div style="height: 30px;"></div>
		<nav id="menu1" class="active">
			<c:choose>
				<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.admin_flag==1 }">
					<a href="${contextPath }/movies/addNewMoviesForm.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
		    			UPLOAD MOVIES
					</a>
					<a href="${contextPath }/movies/addNewStillCut.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						UPLOAD STILLCUT
					</a>
					<a href="${contextPath }/movies/addNewTime.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						UPLOAD TIMESTAMP
					</a>
					<a href="${contextPath }/admin/member/adminMemberMain.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						MEMBER MANAGEMENT
					</a>
					<a href="${contextPath }/movies/adminMovieList.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						MOVIE MANAGEMENT
					</a>
					<a href="${contextPath }/admin/book/bookManagement.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						RESERVATION MANAGEMENT
					</a>
				</c:when>
				<c:otherwise>
					<a href="${contextPath }/movies/movies.do">
		    			<span class="subtitle">GIGABOX LIFE THEATER</span>
		  		 	 	MOVIES
					</a>
      				<a href="${contextPath }/movies/theaters.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						THEATER
					</a>
					<%-- <a href="${contextPath }/board/eventBoard.do">
						<span class="subtitle">GIGABOX LIFE THEATER</span>
						EVENT
					</a> --%>
    			</c:otherwise>
    		</c:choose>
		</nav>
	</div>
	<!-- /END CUSTOM NAVBAR -->
</body>
</html>