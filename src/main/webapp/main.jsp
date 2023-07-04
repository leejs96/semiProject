<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<%@ include file="./common/nav.jsp" %>
	
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
	         	       <!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
						    <div class="item active">
						        <div class="container">
						            <div class="row">
						            
						                <div class="col-sm-3">
						                    <div class="port_item xs-m-top-30">
						                        <div class="port_img">
						                            <img src="assets/images/food.jpg" class="img-thumbnail" alt="" style="width:290px; height:250px"/>
										            <div class="port_overlay text-center">
										               <a href="#"><i class="fa fa-heart-o"></i></a>
										               <a href="#"><i class="fa fa-shopping-cart"></i></a>
										            </div>
										        </div>
					        					<div class="port_caption m-top-20">
										            <h5>제품명</h5>
										            <h6>- 가격</h6>
										        </div>
						    				</div>
										</div>
										
										<div class="col-sm-3">
										    <div class="port_item xs-m-top-30">
										        <div class="port_img">
										            <img src="assets/images/snack.jpg" class="img-thumbnail" alt="" style="width:290px; height:250px"/>
										            <div class="port_overlay text-center">
										               <a href="#"><i class="fa fa-heart-o"></i></a>
										               <a href="#"><i class="fa fa-shopping-cart"></i></a>
										            </div>
										        </div>
										        <div class="port_caption m-top-20">
										            <h5>제품명</h5>
										            <h6>- 가격</h6>
										        </div>
										    </div>
										</div>
						
										<div class="col-sm-3">
										    <div class="port_item xs-m-top-30">
										        <div class="port_img">
										            <img src="assets/images/work-img3.jpg" class="img-thumbnail" alt="" style="width:290px; height:250px"/>
										            <div class="port_overlay text-center">
										               <a href="#"><i class="fa fa-heart-o"></i></a>
										               <a href="#"><i class="fa fa-shopping-cart"></i></a>
										            </div>
										        </div>
										        <div class="port_caption m-top-20">
										            <h5>Your Work Title</h5>
										            <h6>- Graphic Design</h6>
										        </div>
										    </div>
										</div>
						
										<div class="col-sm-3">
										    <div class="port_item xs-m-top-30">
										        <div class="port_img">
										            <img src="assets/images/work-img4.jpg" class="img-thumbnail" alt="" style="width:290px; height:250px"/>
						                            <div class="port_overlay text-center">
						                               <a href="#"><i class="fa fa-heart-o"></i></a>
						                               <a href="#"><i class="fa fa-shopping-cart"></i></a>
						                            </div>
						                        </div>
						                        <div class="port_caption m-top-20">
						                            <h5>Your Work Title</h5>
						                            <h6>- Graphic Design</h6>
						                        </div>
						                    </div>
						                </div>
						            </div>
						            
						        </div>
						    </div>
						</div>
		
						<!-- Controls -->
				        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				            <i class="fa fa-angle-left" aria-hidden="true"></i>
				            <span class="sr-only">Previous</span>
				        </a>
			
				        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				            <i class="fa fa-angle-right" aria-hidden="true"></i>
				            <span class="sr-only">Next</span>
				        </a>
					</div>
				</div>
			</div><!-- End off container -->
		</section><!-- End off Product section -->
	
	</div>
	<%@ include file="./common/footer.jsp" %>
	</body>
</html>