<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Date" %>
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

<title>주문완료페이지</title>
<%@ include file="./script/dbconn.jsp" %>

</head>
<body>
<%@ include file="./common/nav.jsp" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
    
//주문서와 주문에 필요한 정보를 OrderForm에서 Form태그 submit받아 DB주문테이블에 저장하는 페이지입니다.
			

     // 장바구니에 들어있는 상품은 여러가지이기 때문에 배열로 저장했습니다.     
     String[] Pcode = request.getParameterValues("itemcode"); //상품코드   
     String[] QUANTITY = request.getParameterValues("quantity");//상품수량
     String[] totalp = request.getParameterValues("totalp");//상품수량 * 단가 = 품목 별 합산가격
     String[] PName = request.getParameterValues("itemname");  // 상품이름
     String[] price = request.getParameterValues("price"); // 상품 단가
     
     String payment = request.getParameter("payment");
     int sum = Integer.parseInt(request.getParameter("sum"));
     

		    
          %>
          <%
          
          String sql = "INSERT INTO ordered(ID, PCODE, SUM, PAYMENT)" + "VALUES(?,?,?,?)";
          
          PreparedStatement pstmt = conn.prepareStatement(sql);
          for(int i=0; i < Pcode.length; i++){
          
	          pstmt.setString(1, user_id);
	          pstmt.setInt(2, Integer.parseInt(Pcode[i]));
	          pstmt.setInt(3, Integer.parseInt(totalp[i]));
	          pstmt.setString(4, payment);
	          
	          
	          int rows=pstmt.executeUpdate();
          }   
          pstmt.close();
    
          
          %>
          
		<script>
			alert("주문이 완료되었습니다.\n아이디: <%=user_id%>\n총 금액: <%=sum%>\n지불방법: <%=payment%>");
			window.location.href="${contextPath}/dogcat";
		</script>
		          
 
</body>
</html>