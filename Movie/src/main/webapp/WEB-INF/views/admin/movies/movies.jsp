<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	hr {width:100%; color:#000000;}
	tr td{display:inline; float: left;}
	ul li {line-height:2em;}
</style>
<meta charset="UTF-8">
</head>
<body>
	<div style="height: 100px;"></div>
	<hr>

 		<div id="grid-container">
			<ul>
			<c:forEach var="i" items="${movieList}"><!-- mainController movieList -->
	      		<li class="cbp-item">
					<a data-title="images" href="${contextPath}/movies/moviesDetail.do?movie_code=${i.movie_code}">
						<div class="cbp-caption-defaultWrap">
	            			<img src="${contextPath}/thumbnails.do?movie_code=${i.movie_code}&image=${i.image}" alt="">
						</div>
					</a>
				</li>
				</c:forEach>
			</ul>
		</div>
</body>
</html>