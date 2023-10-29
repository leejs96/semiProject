<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<%@ include file="./common/nav.jsp" %>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<% 
		String file_repo = "/ThisIsJava/workspace/semiProject/src/main/webapp/assets/images/";
		int count = 1;
	%>
	
	<div class="culmn">
	    <!--Home Sections-->
	
		<section id="home" class="home bg-black fix">
		    <div class="overlay"></div>
		    <div class="container">
		        <div class="row">
		            <div class="main_home text-center">
		                <div class="col-md-12">
		                    <div class="hello_slid">
		                        <div class="slid_item">
		                            <div class="home_text ">
		                                <!-- <h2 class="text-white">Welcome to <strong>Made</strong></h2> -->
		                                <h1 class="text-white">Welcome to <strong>Made</strong></h1>
		                                <!-- <h3 class="text-white">- We Create a <strong>Concept</strong> into The Market -</h3> -->
		                            </div>
								</div>
				            </div>
				        </div>
				    </div>
				</div><!--End off row-->
			</div><!--End off container -->
		</section> <!--End off Home Sections-->
	
		<!--product section-->
		<section id="product" class="product">
		    <div class="container">
		        <div class="main_product roomy-80">
		            <div class="head_title text-center fix">
		                <h2 class="text-uppercase">New Product</h2>
		                <h5>새로운 제품을 확인해보세요!</h5>
		            </div>
		
		            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	         	       <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				            <i class="fa fa-angle-left" aria-hidden="true"></i>
				            <span class="sr-only">Previous</span>
				        </a>
   				        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				            <i class="fa fa-angle-right" aria-hidden="true"></i>
				            <span class="sr-only">Next</span>
				        </a>
	         	       
	         	       <!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
						   <!-- 시간 되면 코드 정리하기!! -->         
				            <c:forEach var="prod" items="${listProduct }"> 
								<% 
									if(count%4 == 1) {
										if(count/4 == 0) {
								%>
								   	 <div class="item active">
								<% 
										} else {
								%>
								    <div class="item">
								<% 
										}
								%>
								        <div class="container">
								            <div class="row">
								<% 
									}
								%>
												<div class="col-sm-3">
													<div class="port_item xs-m-top-30">
		                                                <div class="port_img">
		                                                    <img src="<%=file_repo %>${prod.PIMG}" class="img-thumbnail" alt=""/>
		                                                    <div class="port_overlay text-center">
		                                                       <%-- <a><i class="fa fa-heart-o" id="${prod.PCode }" onclick="heart(this, this.id);"></i></a> --%>
		                                                       <a><i class="fa fa-shopping-cart" id = "${prod.PCODE }" onclick="addCart(this.id,'<%=user_id%>');"></i></a>
		                                                    </div>
		                                                </div>
		                                                <div class="port_caption m-top-10">
		                                                    <h5>${prod.PNAME }</h5>
		                                                    <h6>- ${prod.PRICE }원</h6>
		                                                </div>
		                                            </div>
		                                       	</div>
								<% 
									if(count%4 == 0) {
								%>						            
							            </div>
							        </div>
							    </div>
							    <% 
								}
								count++;
								%>
							</c:forEach>

						</div>
		
						<!-- Controls -->
				        
			
					</div>
				</div>
			</div><!-- End off container -->
		</section><!-- End off Product section -->
	
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
			location.href="${contextPath}/cart?PCode=" + PCode;
		}
	}
</script>

