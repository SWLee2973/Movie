<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
	<title><tiles:insertAttribute name="title" /></title>
<!-- Favicons -->
<link href="${contextPath }/resources/img/favicon.png" rel="icon">
<link href="${contextPath }/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,300,700&subset=latin,cyrillic-ext" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="${contextPath }/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="${contextPath }/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="${contextPath }/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="${contextPath }/resources/lib/photostack/photostack.css" rel="stylesheet">
<link href="${contextPath }/resources/lib/fullpage-menu/fullpage-menu.css" rel="stylesheet">
<link href="${contextPath }/resources/lib/cubeportfolio/cubeportfolio.css" rel="stylesheet">
<link href="${contextPath }/resources/lib/superslides/superslides.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="${contextPath }/resources/css/style.css" rel="stylesheet">
</head>

<body>
	<div id="outer_wrap">
		<div id="wrap">
			<header>
				   <tiles:insertAttribute name="header" />
			</header>
			<div class="clear"></div>
			<article style="min-height: 607px;">
			 	<tiles:insertAttribute name="body" />
			</article>
			<div class="clear"></div>
			<footer>
        		<tiles:insertAttribute name="footer" />
        	</footer>
		</div>
    </div>        	
</body>      

<!-- JavaScript Libraries -->
  <script src="${contextPath }/resources/lib/jquery/jquery.min.js"></script>
  <script src="${contextPath }/resources/lib/modernizr/modernizr.min.js"></script>
  <script src="${contextPath }/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="${contextPath }/resources/lib/php-mail-form/validate.js"></script>
  <script src="${contextPath }/resources/lib/easing/easing.min.js"></script>
  <script src="${contextPath }/resources/lib/cubeportfolio/cubeportfolio.js"></script>
  <script src="${contextPath }/resources/lib/classie/classie.js"></script>
  <script src="${contextPath }/resources/lib/fullpage-menu/fullpage-menu.js"></script>
  <script src="${contextPath }/resources/lib/photostack/photostack.js"></script>
  <script src="${contextPath }/resources/lib/superslides/superslides.js"></script>

  <!-- Template Main Javascript File -->
  <script src="${contextPath }/resources/js/main.js"></script>
        
        