<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form	name="productForm" method="post" action="imgTry"  enctype="multipart/form-data">
		<table>
			<tr>
				<td>사진</td>
				<td><input type="file" name="img"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="홍길동"></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>
</body>
</html>