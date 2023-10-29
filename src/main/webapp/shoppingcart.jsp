<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%@ include file="./script/dbconn.jsp" %>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<%@ include file="./common/nav.jsp" %>

	<script type="text/javascript">
	
		function cart_delete(itemcode, itemName) {
			if (confirm(itemName + "을 삭제하시겠습니까?") == true) {
				location.href="cart_delete.jsp?target=" + itemcode + "&itemName=" + itemName;
			} else {
				return false;
			}
		}
	</script>
	
	<script>
        var sum = 0;
        function calc(){ 
            a = document.getElementsByClassName("c");
            for(i = 0; i < a.length; i++){
                if(a[i].checked == true){
                    sum += parseInt(a[i].value);
                }
            }
            document.getElementById("sum").value = sum;
            sum = 0;
        }
    </script>
    
	<div class="container" style="padding-top:5%; padding-bottom:16%">
		<hr class="my-4">
		<h1>장바구니</h1>
		<hr class="my-4">
		<form name="shoppingcart" action=OrderForm.jsp method=get>
			<table style="margin-left: auto; margin-right: auto;" class="table table-striped">
				<tr>
					<td>선택</td>
					<td>제품명</td>
					<td>수량</td>	
					<td>단가</td>
					<td>합계</td>	
					<td>수정</td>
					<td></td>	
				</tr>
				
				<%
					try{
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						String sql = "SELECT c.CART_NUM, p.PNAME, p.PCODE, c.QUANTITY, p.PRICE, c.QUANTITY*p.PRICE as sum FROM cart as c INNER JOIN product as p on c.PCODE = p.PCODE AND c.ID = '" + user_id + "'";
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
								
						while (rs.next()) {
							int cart_num = rs.getInt("CART_NUM");
							int pcode = rs.getInt("PCODE");
							int quantity = rs.getInt("QUANTITY");
							int price = rs.getInt("PRICE");
							int totalp = rs.getInt("sum");
							String PNAME = rs.getString("PNAME");
				%>
				
				<tr>
					<td><input type = "checkbox" class = "c"  onclick = "calc()" value = <%=totalp%>></td>
					<td><input type = hidden name = item value = "<%=PNAME%>"><%=PNAME%></td>								
					<td id= "quantity">
						<span><i class="fa fa-arrow-up" id = "<%=cart_num%>" onclick="change_quan(this.id, 'up');"></i></span>
						<input type="hidden" name="quantity" value=<%=quantity%>><%=quantity%>
						<span><i class="fa fa-arrow-down" id = "<%=cart_num%>" onclick="change_quan(this.id, 'down',<%=quantity%>);"></i></span>
					</td>
					<td><input type = hidden name = price value=<%=price%>>￦<%=price%></td>		
					<td><input type = hidden name = totalp value=<%=totalp%>>￦<%=totalp%></td>			
					<td><button type="button" class="btn btn-outline-secondary" id = <%=pcode%> onclick = "cart_delete(this.id,'<%=PNAME%>');">삭제</button></td>
					<td><input type = hidden name = itemcode value=<%=pcode%>></td>
				</tr>
				
				<%
						}
					} catch(Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
			<hr class="my-4">
			<div>주문금액 : ￦
				<input class="text-body-secondary" size = 7 id="sum" value="0">
				<input type = "submit" class="btn btn-secondary" value = "주문하기" style = "margin-left:10px;">
			</div>
		</form>
		<hr class="my-4">
	</div>
	<%@ include file="./common/footer.jsp" %>
</body>	
</html>

<script>
	function change_quan(id, change, quantity) {
		alert(change + "누름 > " + id + ">" + quantity);
		if(change == "down" && quantity == 1) {
			alert("안돼!!");
		}
	}
</script>

<style>
	.btn {
		padding : 2px 7px;
	}
</style>