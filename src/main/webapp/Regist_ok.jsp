<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./script/dbconn.jsp" %>
</head>
<body>
<%
try{
    String item = request.getParameter("item");    
    String quantity = request.getParameter("quantity");
    String itemcode = request.getParameter("itemcode");   	
%>
<%	
	String sql = "INSERT INTO shoppinglist(item, quantity, itemcode)" + "VALUES(?,?,?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, item);   
    pstmt.setString(2, quantity);    
    pstmt.setString(3, itemcode);
    int rows=pstmt.executeUpdate();    
     pstmt.close();}
    catch(Exception e) {
	e.printStackTrace();
	}


%>
<script>
		alert("장바구니에 상품이 추가완료었습니다.");
		window.location.href="./shoppingcart.jsp";
	</script>


</body>
</html>