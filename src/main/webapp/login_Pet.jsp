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
	<div style = "margin-top: 1%; text-align:center;">
		
		<form action = "member" method ="post" style = "padding-top:15%;">
		
			<h1>로그인</h1><br>
			아이디 : <input type = "text" id= "id" name = 'id'> <br><br>
			비밀번호 : <input type = "password" id = "password" name = 'password'> <br><br>
			<input type= "submit" value = "로그인">
			<input type= "button" value = "회원가입" onclick = "location = 'Join_Pet.jsp'">
			<input type= "button" value = "아이디찾기 " onclick = "test()" >
			<input type= "button" value = "비밀번호찾기" onclick = "test()">
			<input type="hidden" name="command" value="login">
		</form>
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
