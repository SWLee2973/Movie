<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-lastest.min.js"></script>
<script type="text/javascript">
	function backToMain(obj){
		obj.action="${contextPath}/main/main.do";
		obj.submit();
	}	
</script>
</head>
<body>
<div style="height: 160px;"></div>
<div style="text-align: center;">
	<div class="login_wrapper">
		<h3 class="m-0 font-weight-bold text-success" align="center">영화 시간표</h3>
		<form name="addNewStillCut.do" method="post" 
				action="${contextPath}/movies/addTimeStamp.do">
			<table class="member">
				<tr>
					<td class="fixed_join">time_code</td>
					<td>　</td>
					<td>
						<select name="time_code" class="reg_form_input">
							<option value="t1">t1</option>
							<option value="t2">t2</option>
							<option value="t3">t3</option>
							<option value="t4">t4</option>
							<option value="t5">t5</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="fixed_join">start_time</td>
					<td>　</td>
					<td>
						<input class="reg_form_input" type="text"
									name="start_time" placeholder="00:00"/>
					</td>
				</tr>
				<tr>
					<td class="fixed_join">end_time</td>
					<td>　</td>
					<td>
						<input class="reg_form_input" type="text"
									name="end_time" placeholder="00:00"/>
					</td>
				</tr>
				<tr>
					<td class="fixed_join">movie_date</td>
					<td>　</td>
					<td>
						<div style="vertical-align: center;">
							<select name="year" class="reg_form_input_t">
								<c:forEach var="year" begin="2019" end="2030">
								<option value="${year }">${year} </option>
								</c:forEach> 
							</select>년 
							<select name="month" class="reg_form_input_t">
								<c:forEach var="month" begin="01" end="12">
								<option value="${month }">${month }</option>
								</c:forEach>
							</select>월  
							<select name="day" class="reg_form_input_t">
								<c:forEach var="day" begin="01" end="31">
								<option value="${day}">${day}</option>
								</c:forEach>
							</select>일 <span style="padding-left:50px"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td class="fixed_join">screen_code</td>
					<td>　</td>
					<td>
						<select name="screen_code" class="reg_form_input">
							<option value="scr1">scr1</option>
							<option value="scr2">scr2</option>
							<option value="scr3">scr3</option>
							<option value="scr4">scr4</option>
							<option value="scr5">scr5</option>
							<option value="scr6">scr6</option>
							<option value="scr7">scr7</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="fixed_join">movie_code</td>
					<td>　</td>
					<td>
						<input class="reg_form_input" type="text" 
									name="movie_code" placeholder="mc000">
					</td>
				</tr>
				<tr>
					<td class="fixed_join">theater_code</td>
					<td>　</td>
					<td>
						<select name="theater_code" class="reg_form_input">
							<option value="seoul1">강남</option>
							<option value="seoul2">강남대로(씨티)</option>
							<option value="seoul3">강동</option>
							<option value="seoul4">군자</option>
							<option value="seoul5">동대문</option>
							<option value="seoul6">마곡</option>
							<option value="gyeonggi1">고양스타필드</option>
							<option value="gyeonggi2">동탄</option>
							<option value="gyeonggi3">분당</option>
							<option value="gyeonggi4">수원</option>
							<option value="gyeonggi5">안산중앙</option>
							<option value="gyeonggi6">용인테크노밸리</option>
							<option value="gyeonggi7">일산벨라시타</option>
							<option value="incheon1">검단</option>
							<option value="incheon2">송도</option>
							<option value="incheon3">영종</option>
							<option value="incheon4">인천논현</option>
							<option value="incheon5">청라</option>
							<option value="incheon6">청라지젤</option>
							<option value="dcs1">공주</option>
							<option value="dcs2">대전</option>
							<option value="dcs3">대전중앙로</option>
							<option value="dcs4">세종</option>
							<option value="dcs5">천안</option>
							<option value="bdg1">김천</option>
							<option value="bdg2">대구(칠성로)</option>
							<option value="bdg3">대구신세계(동대구)</option>
							<option value="bdg4">부산극장</option>
							<option value="bdg5">부산대</option>
							<option value="bdg6">울산</option>
							<option value="gj1">광주상무</option>
							<option value="gj2">목포하당(포르모)</option>
							<option value="gj3">순천</option>
							<option value="gj4">전주(객사)</option>
							<option value="gangwon1">남춘천</option>
							<option value="gangwon2">속초</option>
							<option value="gangwon3">원주</option>
							<option value="gangwon4">원주센트럴</option>
							<option value="jeju1">제주</option>
						</select>
					</td>
				</tr>
			</table>
			<input class="btn btn-primary" type="submit" value="추가하기" />
			<input class="btn btn-danger" type=button value="돌아가기" onClick="backToMain(this.form)"/>
		</form>	
	</div>
</div>
</body>
</html>