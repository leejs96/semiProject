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
	<% 
		String file_repo = "/Users/sunny/Desktop/SemiProject3/img/";
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
		                                <h2 class="text-white">Welcome to <strong>Made</strong></h2>
		                                <h1 class="text-white">We Do Business All Of Time</h1>
		                                <h3 class="text-white">- We Create a <strong>Concept</strong> into The Market -</h3>
		                            </div>
			
	                       	   	 	<!--  <div class="home_btns m-top-40">
									    <a href="" class="btn btn-primary m-top-20">Buy Now</a>
									    <a href="" class="btn btn-default m-top-20">Take a Tour</a>
									</div> -->
								</div><!-- End off slid item -->
								<!-- <div class="slid_item">
						    		<div class="home_text ">
								        <h2 class="text-white">Welcome to <strong>Made</strong></h2>
								        <h1 class="text-white">We Do Business All Of Time</h1>
								        <h3 class="text-white">- We Create a <strong>Concept</strong> into The Market -</h3>
						    		</div>
					
								    <div class="home_btns m-top-40">
								        <a href="" class="btn btn-primary m-top-20">Buy Now</a>
								        <a href="" class="btn btn-default m-top-20">Take a Tour</a>
								    </div>
								</div>--><!-- End off slid item -->
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
	function heart(obj) {
		if($(obj).hasClass("fa-heart-o")) {
			$(obj).addClass("fa-heart").removeClass("fa-heart-o");
			/* 누를 때마다 db update문(ajax로?!) */
	    } else {
			$(obj).addClass("fa-heart-o").removeClass("fa-heart");
	    }
	}
</script>
