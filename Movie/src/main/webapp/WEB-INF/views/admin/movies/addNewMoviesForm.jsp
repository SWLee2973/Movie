<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-lastest.min.js"></script>
<script type="text/javascript">
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function backToMain(obj){
		obj.action="${contextPath}/movies/movies.do";
		obj.submit();
	}
</script>
</head>
<body>
<div style="height: 70px;"></div>
<div style="height: 600px; text-align: center;">
	<div class="login_wrapper">
		<h3 class="m-0 font-weight-bold text-success" align="center">영화 추가</h3>
		<form name="addNewMovies.do" method="post" action="${contextPath}/admin/movies/addNewMovies.do" enctype="multipart/form-data">
			<table class="member">
				<tbody>
					<tr>
						<td class="fixed_join">movie_code</td>
						<td>
							<input type="text" name="movie_code" size="30" maxlength="300" placeholder="mc000" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">name</td>
						<td>
							<input type="text" name="name" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">genre</td>
						<td>
							<input type="text" name="genre" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">running_time</td>
						<td>
							<input type="text" name="running_time" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">director</td>
						<td>
							<input type="text" name="director" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">rating</td>
						<td>
							<select class="reg_form_input" name="rating">
								<option value="전체">전체</option>
								<option value="12세">12세</option>
								<option value="15세">15세</option>
								<option value="청불">청불</option>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">company</td>
						<td><input type="text" name="company" size="30" maxlength="300" class="reg_form_input"/></td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">country</td>
						<td>
							<input type="text" name="country" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">actors</td>
						<td>
							<input type="text" name="actors" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">open_date</td>
						<td>
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
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">summary</td>
						<td>
							<textarea class="reg_form_input" name="summary" rows="10" cols="70" maxlength="4000"
											style="height: 100%;"></textarea>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">movie_view</td>
						<td>
							<input type="text" name="movie_view" size="30" maxlength="300" class="reg_form_input"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">image</td>
						<td>
							<input class="reg_form_input" type="file" name="image" onchange="readURL(this)"/>
						</td>
						<td style="height: 200px;">
							<img class="reg_form_input" id="preview" src="#" style="width: 200px; height: 100%;"/>
						</td>
					</tr>
				</tbody>
			</table>
				<input class="btn btn-primary" type="submit" value="추가하기" />
				<input class="btn btn-danger" type=button value="돌아가기" onClick="backToMain(this.form)"/>
		</form>
	</div>  
</div>
<div style="height: 330px;"></div>