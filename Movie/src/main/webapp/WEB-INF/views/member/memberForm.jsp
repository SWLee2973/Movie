<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="${contextPath }/resources/css/login.css" rel="stylesheet">
<script>

/* 도로명 주소 */
function execDaumPostcode() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가한다.
	      if(data.buildingName !== '' && data.apartment === 'Y'){
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	      if(extraRoadAddr !== ''){
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	      if(fullRoadAddr !== ''){
	        fullRoadAddr += extraRoadAddr;
	      }

	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
	      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
	      document.getElementById('roadAddress').value = fullRoadAddr;
	      document.getElementById('jibunAddress').value = data.jibunAddress;
			
	     
	    }
	  }).open();
	}

/* 로그인 */
function fn_overlapped(){
    var _email=$("#_email").val();
    if(_email==''){
   	 alert("email를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:true,  //동기
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {email:_email},
       success:function (data,textStatus){//status=4, ok
          if(data=='false'){//회원번호가 존재하지않으면
       	    alert("사용할 수 있는 email입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_email').prop("disabled", true);
       	    $('#_email').val(_email);
       	    $('#_myInfo').val(_email);
          }else{//이미 id가 존재하면
        	  alert("사용할 수 없는 email입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){
    	   // alert("작업을완료 했습니다");
    	   return;
       }
    });  // end ajax	 
 }	
 
 function chkForm(){
	 var email = reg_form.email.value;
	 var password = reg_form.password.value;
	 var name = reg_form.name.value;
	 var y = reg_form.member_birth_y.value;
	 var m = reg_form.member_birth_m.value;
	 var d = reg_form.member_birth_d.value;
	 var hp1 = reg_form.phone_number.value;
	 var hp2 = reg_form.hp2.value;
	 var hp3 = reg_form.hp3.value;
	 var zipcode = reg_form.zipcode.value;
	 var road = reg_form.roadAddress.value;
	 var jibun = reg_form.jibunAddress.value;
	 var namuji = reg_form.namujiAddress.value;
	 var myInfo = reg_form.myInfo.value;
	 
	 if(email == "" || password == "" || name == "" || y == "" || m == "" || d == "" ||
			 hp1 == "" || hp2 == "" || hp3 == "" || zipcode == "" || road == "" ||
			 jibun == "" || namuji == ""){
		 alert('빈칸을 채워 주세요.');
		 return false;
	 }
	 if(myInfo == ""){
		 alert('이메일 중복확인을 해주세요.');
		 return false;
	 }
	 submit();
	 
 }
</script>
</head>
<body>
<div style="height: 70px;"></div>
<div style="height: 480px; text-align: center;">
	<div class="login_wrapper">
		<h3 class="m-0 font-weight-bold text-primary" align="center">회원 가입</h3>
		<form action="${contextPath}/member/addMember.do" method="post" name="reg_form">	
		<div>
			<table class="member">
				<tbody>
					<tr>
						<td class="fixed_join">이메일</td>
						<td>
						  <input type="text" name="email" id="_email" class="reg_form_input">
						  <input type="hidden" name="myInfo" id="_myInfo">
						</td>
						<td style="text-align: right">
						  <input type="button"  id="btnOverlapped" value="중복체크"
						  			onClick="fn_overlapped()" class="btn btn-primary"> 
						</td>
					</tr>
					<tr>
						<td class="fixed_join">비밀번호</td>
						<td><input name="password" type="password" class="reg_form_input"></td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">이름</td>
						<td><input name="name" type="text" class="reg_form_input"></td>
						<td></td>
					</tr>
					<tr>
						<td class="fixed_join">성별</td>
						<td>
							<span><input type="radio" name="gender" value="남" checked>남성</span>
							<span><input type="radio" name="gender" value="여">여성</span>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td class="fixed_join">법정생년월일</td>
						<td>
						<select name="member_birth_y" class="reg_form_input_t">
						 
						     <c:forEach var="year" begin="1" end="100">
						       <c:choose>
						         <c:when test="${year==80}">
								   <option value="${ 1920+year}" selected>${ 1920+year} </option>
								</c:when>
								<c:otherwise>
								  <option value="${ 1920+year}" >${ 1920+year} </option>
								</c:otherwise>
								</c:choose>
						   	</c:forEach> 
								
						</select>년 
						 <select name="member_birth_m" class="reg_form_input_t">
						   <c:forEach var="month" begin="1" end="12">
						       <c:choose>
						         <c:when test="${month==5 }">
								   <option value="${month }" selected>${month }</option>
								</c:when>
								<c:otherwise>
								  <option value="${month }">${month}</option>
								</c:otherwise>
								</c:choose>
						   	</c:forEach>
						</select>월  
						<select name="member_birth_d" class="reg_form_input_t">
								<c:forEach var="day" begin="1" end="31">
						       <c:choose>
						         <c:when test="${day==10 }">
								   <option value="${day}" selected>${day}</option>
								</c:when>
								<c:otherwise>
								  <option value="${day}">${day}</option>
								</c:otherwise>
								</c:choose>
						   	</c:forEach>
						</select>일 <span style="padding-left:50px"></span>
						
					  </td>
					  <td></td>
					</tr>
	
					<tr style="top: 5px;">
						<td class="fixed_join">휴대폰번호</td>
						<td><select  name="phone_number" class="reg_form_input_t">
								<option>없음</option>
								<option selected value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> - <input size="10px"  type="text" name="hp2" class="reg_form_input_t"> - 
						<input size="10px"  type="text"name="hp3" class="reg_form_input_t">
						<td></td>
					</tr>
					
					<!-- 도로명 주소 -->
					<tr>
						<td class="fixed_join">주소</td>
						<td>
						   <input type="text" id="zipcode" name="zipcode" class="reg_form_input_t"> 
						   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"><br>
						   지번 주소: <input type="text" id="roadAddress"  name="roadAddress" class="reg_form_input"><br>
						  도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" class="reg_form_input"><br>
						  나머지 주소: <input type="text"  name="namujiAddress" class="reg_form_input">
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			</div><br>
					<button class="btn btn-success" onclick="return chkForm();">회원 가입</button>
					<input type="reset" value="다시입력" class="btn btn-warning">
		</form>	
	</div>
</div>
<div style="height: 25px;"></div>
</body>
</html>