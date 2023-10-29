<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    import = "java.io.IOException, java.util.Enumeration"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.col-sm-3 {
			width:24%;
			margin-bottom:20px;
		}
		.cond {
			margin-right:10px;
		}
	</style>

	<script>
		function process_list(id){   // 신상품순, 가격순 버튼 클릭시 submit
			document.forms['searching'].submit();
		} 
	</script>

</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<%@ include file="./common/nav.jsp" %>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
	<%!
		public String isIn(String str,String[] values) throws Exception {
			for(int i=0;i<values.length;i++)
			{
			String temp = values[i];
			
			if(temp.equals(str))
			       return "checked";
			 }
			    return "";
			}
	%>
	
	<%
		String[] values = {};
		Enumeration e = request.getParameterNames();
		
		while ( e.hasMoreElements() ){
			String name = (String) e.nextElement();
			
			if(name.equals("sub_category")) {
				values = request.getParameterValues(name); 
				for (String value : values) {
				out.println("value=" + value);
				}  
			}
		}
	%>
	
	<% 
		String file_repo = "/ThisIsJava/workspace/semiProject/src/main/webapp/assets/images/";
		String animal = request.getParameter("animal");
		String category = request.getParameter("category");
		String word = request.getParameter("word");
		String food = request.getParameter("food");
		String snack = request.getParameter("snack");
		String order = request.getParameter("order");
		String kg1 = request.getParameter("kg1");
		String kg2 = request.getParameter("kg2");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		String[] sub_category = request.getParameterValues("sub_category");

		if(sub_category != null) {
			for(int i = 0; i < sub_category.length; i++) {
				String sub_i = sub_category[i];
				System.out.println(sub_i);
			}
		}
		
		String animal_Kor;
		String category_Kor;
		
		if(animal.equals("dog")) {
			animal_Kor = "강아지";
		} else {
			animal_Kor = "고양이";
		}
		
		if(category.equals("food")) {
			category_Kor = "사료";
		} else if(category.equals("snack")){
			category_Kor = "간식";
		} else {
			category_Kor = "화식";
		}
	%>
	
	<div class="culmn">
		<div class="culmn">
			<section id="test" class="test roomy-20 m-top-110 fix">
				<div class="container" style="padding-left:4%;">
					<ul>
						<li style="font-size:18px; float:left;"><i class="fa fa-angle-right	"></i> <%=animal_Kor %>&nbsp; &nbsp;</li>
						<li style="font-size:18px; float:left;"><i class="fa fa-angle-right	"></i> <%=category_Kor %></li>
					</ul>
				</div>
			</section>
		</div>
		<!--Test section-->
		<div class="culmn">
			<form name = "searching" class="form-inline my-2 my-lg-0" action="product" method="get">
				<section id="test" class="test bg-grey roomy-60 m-top-10 fix">
					<div class="container">
						<div class="row" style="margin:0 15%;">                        
							<table class="table">
								<thead>
									<tr>
										<th scope="col" style = "font-size:25px;">상품명</th>
										<td>
											<input type="hidden" name="animal" value = "<%=animal%>"/>
											<input type="hidden" name="category" value = "<%=category%>"/>
											<input type="hidden" name="command" value = "search"/>
											<input class="form-control" type="search" placeholder="Search" aria-label="Search" name = "word" <%if(word != null){%>value="<%=word%>"<%}%> style="width:70%">
											<button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
										</td>
									</tr>
								</thead>
								<tbody class="table-group-divider" >
									<tr>
									<th scope="row" style="width:13%;">종류</th>
										<td>
										<%if(category.equals("food")) { %>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "function" <%=isIn("function",values)%>>기능성 사료</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "diet" <%=isIn("diet",values)%>>다이어트 사료</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "nutrition" <%=isIn("nutrition",values)%>>영양 사료</span>
										<%} else if(category.equals("snack")) { %>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "home" <%=isIn("home",values)%>>홈메이드</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "wet" <%=isIn("wet",values)%>>습식</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "dry" <%=isIn("dry",values)%>>건식</span>
										<%} else if(category.equals("cooked")) { %>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "duck" <%=isIn("duck",values)%>>오리</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "turkey" <%=isIn("turkey",values)%>>칠면조</span>
											<span class="cond"><input type="checkbox" class = "chb" name="sub_category" value = "chicken" <%=isIn("chicken",values)%>>닭</span>
										<%}%>
										</td>
									</tr>
										
									<tr>
										<th scope="row" style="width:13%;">용량</th>
										<td>
											<span class="cond"><input type="text" name = "kg1" placeholder = "0.0" <%if(kg1 != null){%>value="<%=kg1%>"<%}%>> ~</span>
											<span class="cond"><input type="text" name = "kg2" placeholder = "20.0" <%if(kg2 != null){%>value="<%=kg2%>"<%}%>> kg</span>
										</td>
									</tr>
										
									<tr>
										<th scope="row" style="width:13%;">가격</th>
										<td>
											<span class="cond"><input type="text" name = "price1" placeholder = "0" <%if(price1 != null){%>value="<%=price1%>"<%}%>> ~</span>
											<span class="cond"><input type="text" name = "price2" placeholder = "0" <%if(price2 != null){%>value="<%=price2%>"<%}%>> 원</span>
										</td>
									</tr>
											
								</tbody>
							</table>
						</div>
					</div>
				</section><!-- End off test section -->
				
				<div class="container">
					<div class="position-relative" style = "margin-top: 5%; position: relative;">
						<div class="btn-group btn-group-sm position-absolute bottom-0 end-0" role="group" aria-label="Basic radio toggle button group" style="float:right;">
							<input type="radio" class="btn-check" name="order" id="btnradio1" autocomplete="off" value = "recent" onclick = "process_list(this.id);" <%if(order == null || order.equals("recent")){%>checked<%}%> >
							<label class="btn" for="btnradio1" style = "border-top-left-radius: 3px; border-bottom-left-radius: 3px; <%if(order == null || order.equals("recent")){%>background-color:rgba(93, 156, 89,0.7); color : white;<%}%>">신상품순</label>
							
							<input type="radio" class="btn-check" name="order" id="btnradio2" autocomplete="off" value = "Hprice" onclick = "process_list(this.id);" <%if(order != null && order.equals("Hprice")){%>checked<%}%>>
							<label class="btn" for="btnradio2" <%if(order != null && order.equals("Hprice")){%>style="background-color:rgba(93, 156, 89,0.7); color : white;"<%}%>>가격높은순</label>
							
							<input type="radio" class="btn-check" name="order" id="btnradio3" autocomplete="off" value = "Lprice" onclick = "process_list(this.id);" <%if(order != null && order.equals("Lprice")){%>checked<%}%>>
							<label class="btn" for="btnradio3" <%if(order != null && order.equals("Lprice")){%>style="background-color:rgba(93, 156, 89,0.7); color : white;"<%}%>>가격낮은순</label>
						</div>
					</div>
				</div>
			</form>
		</div>
	
		<div class="culmn">
			<!--product section-->
			<section id="product" class="product">
				<div class="container">
					<div class="main_product roomy-80" style="padding-top:15px;">
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<div class="container">
									<div class="row m-top-30">
										<c:forEach var="prod" items="${listProduct }"> <!-- 특정 개수 초과하면 다음페이지로 넘어가게 설정해야함 (if문 돌려서 ex>int가 8이 넘어가면 2페이지부터)-->
											<div class="col-sm-4">
												<div class="port_item xs-m-top-30">
													<div class="port_img">
														<img src="<%=file_repo %>${prod.PIMG}" class="img-thumbnail" alt=""/>
														<div class="port_overlay text-center">
															<a><i class="fa fa-shopping-cart" id = "${prod.PCODE }" onclick="addCart(this.id,'<%=user_id%>');"></i></a>
														</div>
													</div>
													<div class="port_caption m-top-10">
														<h5>${prod.PNAME }</h5>
														<h6>- ${prod.PRICE }원</h6>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				
				</div>
			</section><!-- End off Product section -->
		</div><!-- End off row -->

		<nav aria-label="Page navigation example" style="text-align:center;"> <!-- 전체개수/페이지별 개수 -->
			<ul class="pagination">
				<c:forEach var="i" begin = "1" end="${pageCount }">
					<li class="page-item">
						<%-- <c:if test="${page eq ${i}}" > --%>
							<a class="page-link" href="product?animal=<%=animal%>&category=<%=category %>&page=${i}">${i}</a>
						<%-- </c:if> --%>
					</li>
				</c:forEach>
			</ul>
		</nav>
		
	</div>
   	<%@ include file="./common/footer.jsp" %>
</body>
</html>

<script>
	function addCart(PCode,id) {
		if(id == "null") {
			alert("로그인을 먼저 하세요");
			location.href="login_Pet.jsp";
		} else {
			location.href="${contextPath}/cart?command=in&PCode=" + PCode;
		}
	}
</script>

<style>
	.btn-check {
		display: none;
	}
	
	.btn {
		color : rgb(93, 156, 89);
	}
	
	.btn:hover {
		background-color:rgba(93, 156, 89,0.7);
		color : white;
	}
	
	.chb {
		accent-color:rgb(93, 156, 89);
	}
	
</style>