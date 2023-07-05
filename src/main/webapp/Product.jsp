<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>

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
	
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> -->

	<script>
		function process_list(){   // 신상품순, 가격순 버튼 클릭시 submit
			document.forms['searching'].submit();
		} 
	</script>

</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<%@ include file="./common/nav.jsp" %>
	<% 
		String file_repo = "/Users/sunny/Desktop/SemiProject3/img/";
		String word = request.getParameter("word");
		String food = request.getParameter("food");
		String snack = request.getParameter("snack");
		String order = request.getParameter("order");
		String kg1 = request.getParameter("kg1");
		String kg2 = request.getParameter("kg2");
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
	%>
	
	

	<!--Test section-->
	<div class="culmn">
    	<form name = "searching" class="form-inline my-2 my-lg-0" action="product" method="get">
       <section id="test" class="test bg-grey roomy-60 m-top-120 fix">
               <div class="container">
                   <div class="row" style="margin:0 15%;">                        
                       <table class="table">
						  <thead>
						    <tr>
						      <th scope="col" style = "font-size:25px;">상품명</th>
						      <td>
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
										<span class="cond"><input type="checkbox" name = "food" value = "food" <%if(food != null){%>checked<%}%>>사료</span>
										<span class="cond"><input type="checkbox" name="snack" value = "snack" <%if(snack != null){%>checked<%}%>>간식</span>
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
								<!-- <tr>
									<th scope="row" style="width:13%;">kg</th>
									<td>
									<span class="cond"><input type="checkbox" name = "1" value="1">~1kg</span>
									<span class="cond"><input type="checkbox">1~3kg</span>
									<span class="cond"><input type="checkbox">3~5kg</span>
									<span class="cond"><input type="checkbox">5kg~</span>
									<input type="range" class="form-range" min="0" max="10" step="1" id="customRange3" style="width:50%;">
									 <input type="range" min="10" max="30" 
                  					  list="temperatures">30&deg; // list와 밑에 id를 똑같이 해줘야 연결이된다.
								    <datalist id="temperatures">
								         <option value="12" label="Low"> // value값을 조절할수록 조절이된다.
								         <option value="20" label="Medium">
								         <option value="28" label="High">
								    </datalist>
									</td>
								</tr> -->
							</tbody>
						</table>
                   </div>
               </div>
           </section><!-- End off test section -->
           <div class="container">
		<div class="position-relative" style = "margin-top: 5%;">
			<div class="btn-group btn-group-sm position-absolute bottom-0 end-0" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="order" id="btnradio1" autocomplete="off" value = "recent" onclick = "process_list();" <%if(order == null || order.equals("recent")){%>checked<%}%>>
				<label class="btn btn-outline-primary" for="btnradio1">신상품순</label>
				
				<input type="radio" class="btn-check" name="order" id="btnradio2" autocomplete="off" value = "Hprice" onclick = "process_list();" <%if(order != null && order.equals("Hprice")){%>checked<%}%>>
				<label class="btn btn-outline-primary" for="btnradio2">가격높은순</label>
				
				<input type="radio" class="btn-check" name="order" id="btnradio3" autocomplete="off" value = "Lprice" onclick = "process_list();" <%if(order != null && order.equals("Lprice")){%>checked<%}%>>
				<label class="btn btn-outline-primary" for="btnradio3">가격낮은순</label>
			</div>
		</div>
		</div>
  		 </form>
       </div>

       <div class="culmn">
           <!--product section-->
           <section id="product" class="product">
				<div class="container">
					<div class="main_product roomy-80" >
						<div class="carousel-inner" role="listbox">
                           <div class="item active">
                               <div class="container">
                                   <div class="row m-top-30">
	                                    <c:forEach var="prod" items="${listProduct }"> <!-- 특정 개수 초과하면 다음페이지로 넘어가게 설정해야함 (if문 돌려서 ex>int가 8이 넘어가면 2페이지부터)-->
											<div class="col-sm-4">
												<div class="port_item xs-m-top-30">
	                                                <div class="port_img">
	                                                    <img src="<%=file_repo %>${prod.PImg}" class="img-thumbnail" alt=""/>
	                                                    <div class="port_overlay text-center">
	                                                       <a><i class="fa fa-heart-o" onclick="heart(this);"></i></a>
	                                                       <a><i class="fa fa-shopping-cart"></i></a>
	                                                    </div>
	                                                </div>
	                                                <div class="port_caption m-top-10">
	                                                    <h5>${prod.PName }</h5>
	                                                    <h6>- ${prod.price }원</h6>
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

       </div>


	<nav aria-label="Page navigation example" style="text-align:center;"> <!-- 전체개수/페이지별 개수 -->
		<ul class="pagination">
			<%-- <li class="page-item">
				<a class="page-link" href="product?command=dogFood&page=${i+1 }" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
				</a>
			</li> --%>
			<c:forEach var="i" begin = "1" end="${pageCount }">
				<li class="page-item"><a class="page-link" href="product?command=dogFood&page=${i}">${i}</a></li>
			</c:forEach>
			<%-- <li class="page-item">
				<a class="page-link" href="product?command=dogFood&page=${i+1 }" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
				</a>
			</li> --%>
		</ul>
	</nav>
		
    <%@ include file="./common/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>

<script>
	function heart(obj) {
		if($(obj).hasClass("fa-heart-o")) {
			$(obj).addClass("fa-heart").removeClass("fa-heart-o");
			/* 누를 때마다 db update문(ajax로?!) */
	    } else {
			$(obj).addClass("fa-heart-o").removeClass("fa-heart");
	    }
	}
</script>