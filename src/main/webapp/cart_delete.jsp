<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./script/dbconn.jsp" %>
<title>장바구니 상품제거</title>
</head>
<body>
	<%
//DB장바구니 테이블에 저장돼있는 상품을 제거하는 페이지입니다.
		String user_id = (String)session.getAttribute("id");
		String item=request.getParameter("target");
		String itemName=request.getParameter("itemName");
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM cart WHERE PCODE ='" + item + "' AND ID = '" + user_id + "'";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	%>
	<script>
		alert("<%=itemName%>삭제가 완료되었습니다.");
		window.location.href="./shoppingcart.jsp";
	</script>
</body>
</html>