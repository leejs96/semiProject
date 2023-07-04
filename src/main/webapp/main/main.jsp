<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
  </head>
  
  <body>
   <!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script> -->

	 
	<!-- <header class="navbar navbar-expand-lg navbar-light shadow-sm" style="background-color: #f2f5fc;">
  	<div class="container">

	    Brand
	    <a class="navbar-brand d-none d-lg-block order-lg-1" href="#">
	      <img width="142" src="../img/woman.png"/>
	    </a>
	    
	    Toolbar
	    <div class="navbar-toolbar d-flex align-items-center order-lg-3">
	      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
	        <span class="navbar-toggler-icon"></span>
	      </button>
	      <a class="navbar-tool" href="#">
	        <div class="navbar-tool-icon-box"><i class="ci-user"></i></div>
	      </a>
	      <a class="navbar-tool ms-1 me-n1" href="#">
	        <div class="navbar-tool-icon-box">
	          <i class="navbar-tool-icon ci-user"></i>
	        </div>
	      </a>
	      <a class="navbar-tool ms-3" href="#">
	        <div class="navbar-tool-icon-box bg-secondary">
	          <span class="navbar-tool-label">4</span>
	          <i class="navbar-tool-icon ci-cart"></i>
	        </div>
	      </a>
	    </div>

	    Collapsible menu
	    <div class="collapse navbar-collapse me-auto order-lg-2" id="navbarCollapse">
	      <hr class="d-lg-none my-3">
	      <ul class="navbar-nav">
	        <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
	        <li class="nav-item"><a class="nav-link" href="#">강아지</a></li>
	        
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" data-bs-auto-close="outside">강아지</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">사료</a></li>
	            <li><a class="dropdown-item" href="#">간식</a></li>
	           </ul>
	        </li>
	        
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" data-bs-auto-close="outside">고양이</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">사료</a></li>
	            <li><a class="dropdown-item" href="#">간식</a></li>
	           </ul>
	        </li>
	        
	        <li class="nav-item">
	          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</header> -->

<!-- <div class="tns-carousel tns-nav-enabled">
  <div class="tns-carousel-inner">
    <img width="600" src="../img/favorite.jpg" alt="Alt text">
    <img width="600" src="../img/favorite.jpg" alt="Alt text">
    <img width="600" src="../img/favorite.jpg" alt="Alt text">
  </div>
</div>

Caption in the center
<figure class="figure">
  <img width="300" src="../img/favorite.jpg" class="img-thumbnail rounded" alt="Rounded image">
  <figcaption class="figure-caption text-center">Caption in the center</figcaption>
</figure> -->

<!-- Basic navbar -->
<header class="navbar navbar-expand-lg navbar-light shadow-sm" style="background-color: #f2f5fc;">
  <div class="container">

    <!-- Brand -->
    <a class="navbar-brand d-none d-lg-block order-lg-1" href="#">
      <img width="74" src="../img/man.png" alt="Cartzilla"/>
    </a>

    <!-- Toolbar -->
    <div class="navbar-toolbar d-flex align-items-center order-lg-3">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-tool" href="#">
        <div class="navbar-tool-icon-box"><i class="navbar-tool-icon ci-search"></i></div>
      </a>
      <a class="navbar-tool ms-1 me-n1" href="#">
        <div class="navbar-tool-icon-box">
          <i class="navbar-tool-icon ci-user"></i>
        </div>
      </a>
      <a class="navbar-tool ms-3" href="#">
        <div class="navbar-tool-icon-box bg-secondary">
          <span class="navbar-tool-label">4</span>
          <i class="navbar-tool-icon ci-cart"></i>
        </div>
      </a>
    </div>

    <!-- Collapsible menu -->
    <div class="collapse navbar-collapse me-auto order-lg-2" id="navbarCollapse">
      <hr class="d-lg-none my-3">
      <ul class="navbar-nav">
        <li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" data-bs-auto-close="outside">Dropdown</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action link</a></li>
            <li class="dropdown">
              <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Dropdown</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action link</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
                <li><a class="dropdown-item" href="#">Yet another link</a></li>
              </ul>
            </li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
    </div>
  </div>
</header>
</body>
</html>