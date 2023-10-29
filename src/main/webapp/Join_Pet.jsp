<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<%@ include file= "./common/nav.jsp" %>
	
	<div class="container">
		<div style = "margin-top: 10%; text-align:center;">
			<form action = "join" method="get">
			
				<h1> 회원가입 </h1>
				<table style="margin : 1% auto;">
						<tr> 
							<td align = "right"> 아이디 </td>
							<td align = "left" style="display: table-cell;">
								<input id=user_id name=id placeholder ="아이디를 입력하세요." style="width:150px;"><br>
							</td>
						</tr>
						
						<tr>
							<td align = "right"> 비밀번호</td>
							<td align = "left">
								<input id=user_password name=password placeholder ="비밀번호를 입력하세요." style="width:160px; vertical-align :middle;"><br>
							</td>
						</tr>
						
						<tr>
							<td align = "right"> 비밀번호 확인</td>
							<td align = "left">
								<input id=user_password_check name=password_check placeholder ="비밀번호를 확인하세요."  style="width:160px;"><br>
							</td>
						</tr>
						<tr>
							<td align = "right"> 우리 아이 이름 </td>
							<td align = "left">
								<input id= animal_name name = pet_name style="width:100px;"><br>
							</td>
						</tr>
						<tr>
							<td align = "right"> 우리 아이 성별 </td>
							<td align = "left">
								<input type= "radio" id="male" name="sex" value ="male">
								<label for= "male"> Male</label>
								<input type= "radio" id="female" name="sex" value ="female">
								<label for= "female">Female</label><br>
							</td>
						</tr>
						<tr>
							<td align = "right"> 우리 아이 생년월일 </td>
							<td align = "left">
								<input type= number name = pet_yy id= pet_yy style="width:100px;" maxlength = '8'><br>
							</td>
						</tr>
						<tr>
							<td align = "right"> 생후 </td>
							<td align = "left">
								<input type = number name =year min='0' style="width:30px;"> 개월 <br>
							</td>
						</tr>
						<tr>
							<td align = "right"> 전화번호 </td>
							<td align = "left">
								<input  type= "number" name = user_phone id= user_phone placeholder = "- 빼고 입력하세요" style="width:150px;" maxlength= "11"><br>
							</td>
						</tr>
						
						<tr>
							<td align = "right" > 가입날짜 </td>
							<td align = "left">
								<input type = number name = join_day id= join_day style="width:100px;" maxlength= '8'><br>
							</td>
						</tr>
						
						<tr>
							<td align = "right" > 도로명주소  </td>
							<td align = "left">
								<input name=home_add id=home_add style="width:100px;"><br>
							</td>
						</tr>
						<tr>
							<td align = "right" > 이메일 주소 </td>
							<td align = "left">
								<input name=user_email id=user_email style="width:150px;"><br>
							</td>
						</tr>
						<tr>
							<td colspan =2>
								<input type = "hidden" name = "command" value="join">
								<input type = "submit" name = "JoinPets" value = "회원가입" style="float:right;">
							</td>
						</tr>
				</table>
			
			</form>
		</div>
	</div>
	
	<%@ include file= "./common/footer.jsp" %>
</body>
</html>

<style>
	td {
		padding-left: 20px;
		padding-bottom: 15px;
	}
	
	.footer {
	    position: absolute;
	    bottom: 0;
	}
</style>