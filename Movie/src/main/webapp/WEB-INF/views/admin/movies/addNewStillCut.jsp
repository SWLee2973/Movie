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
<div style="height: 160px;"></div>
<div style="text-align: center;">
	<div class="login_wrapper">
		<h3 class="m-0 font-weight-bold text-success" align="center">영화 스틸컷 추가</h3>
		<form name="addNewStillCut.do" method="post" action="${contextPath}/admin/movies/addNewStillCut.do" enctype="multipart/form-data">
			<table class="member">
				<tr>
					<td class="fixed_join">movie_code</td>
					<td>
						<input class="reg_form_input" type="text" name="movie_code" size="30" maxlength="300" value="mc000"/>
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="fixed_join">movie_image_path</td>
					<td>
						<input class="reg_form_input" type="file" name="movie_image_path" onchange="readURL(this)"/>
					</td>
					<td style="height: 200px">
						<img class="reg_form_input" id="preview" src="#" style="width: 150px; height: 100%;"/>
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