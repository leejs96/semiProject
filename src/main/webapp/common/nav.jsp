<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"     
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>쇼핑몰이름</title>
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="favicon.ico">

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!--Google Font link-->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/slick/slick.css"> 
    <link rel="stylesheet" href="assets/css/slick/slick-theme.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/iconfont.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/bootsnav.css">

    <!--Theme custom css -->
    <link rel="stylesheet" href="assets/css/style.css">

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="assets/css/responsive.css" />

    <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>

<body>
	<% String user_id = (String)session.getAttribute("id"); %>

	<nav class="navbar navbar-default bootsnav navbar-fixed">
		<div class="container"> 
		     <div class="attr-nav">
				<ul>
					<!--  <li class="search"><i class="fa fa-heart-o"></i></li> -->
					<li class="search"><i class="fa fa-shopping-cart" onclick = "shoppingcart('<%=user_id%>')"></i></li>
					<li class = "menu">
						<div class = "dropdown" style = "padding-right: 10px;"><i class="fa fa-user"></i></div>
						<div class = "dropdown_menu">
						<% if(user_id != null) { %>
							<a href = "product?animal=dog&category=food">내정보</a>
							<a href = "dogcat?command=logout">로그아웃</a>
						<% } else { %>
							<a href = "login_Pet.jsp">로그인</a>
						<% } %>
						</div>
					</li>
				</ul>
			</div> 
		
		
		     <!-- Start Header Navigation -->
		     <div class="navbar-header">
		         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
		             <i class="fa fa-bars"></i>
		         </button>
		         <a class="navbar-brand" href="dogcat">
		             <img src="assets/images/logo.png" class="logo" alt="">
		             <!--<img src="assets/images/footer-logo.png" class="logo logo-scrolled" alt="">-->
		         </a>
		
		     </div>
		     <!-- End Header Navigation -->
		
		     <!-- navbar menu -->
		     <div class="collapse navbar-collapse" id="navbar-menu" style="display: inline-block">
		         <ul class="nav navbar-nav navbar-center" >
		             <li class = "menu">
						<div class = "dropdown" style = "padding-right: 10px;">강아지</div>
						<div class = "dropdown_menu">
							<a href = "product?animal=dog&category=food">사료</a>
							<a href = "product?animal=dog&category=snack">간식</a>
							<a href = "product?animal=dog&category=cooked">화식</a>
						</div>
					</li>
					<li class = "menu">
						<div class = "dropdown" style = "padding-right: 10px;">고양이</div>
						<div class = "dropdown_menu">
							<a href = "product?animal=cat&category=food">사료</a>
							<a href = "product?animal=cat&category=snack">간식</a>
							<a href = "product?animal=dog&category=cooked">화식</a>
						</div>
					</li>
					<li class = "menu">
						<div class = "dropdown" style = "padding-right: 10px;">고객지원</div>
						<div class = "dropdown_menu">
							<a href = "#">공지사항</a>
							<a href = "#">자주묻는질문</a>
						</div>
					</li>
		            <li class = "menu"><div class = "dropdown" style = "padding-right: 10px;"><a href = "#" style = "color:#797979;">리뷰</a></div></li>
		         </ul>
		     </div><!-- /.navbar-collapse -->
		 </div> 

	</nav>
</body>
</html>

<script>
	function shoppingcart(id) {
		if(id == "null") {
			alert("로그인을 먼저 하세요");
			location.href="login_Pet.jsp";
		} else {
			location.href="shoppingcart.jsp"
		}
	}
</script>

<style>
	.dropdown {
		position : relative;
	   	font-weight: bolder;
		padding: 30px 15px 30px 15px;
		width:100px;
	    text-align: center;
	}
	
	.dropdown_menu {
		position: absolute;
	    /* min-width: 50px; */
	    width:100px;
	}
	
	.dropdown_menu {
		display : none;
	}
	
	.menu:hover .dropdown_menu {
		display : block;
	}
	
	.dropdown_menu a:hover {
		background : rgb(238, 227, 203);
	}
	
	.dropdown_menu a {
	    color: black;
	    display: block;
	    width: 105px;
	    height : 35px;
	    text-align: center;
	    background: rgb(251, 247, 240);
	    font-weight: normal;
	    padding: 7px;
	    box-shadow: 5px 8px 16px 0px rgba(0,0,0,0.2);
	}
	
	.search {
	    color: #6f6f6f;
	    display: block;
	    padding: 28px 15px;
	    position: relative;
	}
	
</style>