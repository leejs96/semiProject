<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Admin_member</title>
	<!-- Custom fonts for this template -->
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
	<!-- Custom styles for this page -->
	<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">
    <!-- Page Wrapper -->
	<div id="wrapper">
	    <!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		   
		    <!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin_main.jsp">
			    <div class="sidebar-brand-icon rotate-n-15">
			        <i class="fas fa-laugh-wink"></i>
			    </div>
			    <div class="sidebar-brand-text mx-3">Admin</div>
			</a>
		<!-- Divider -->
			<hr class="sidebar-divider my-0">
		<!-- Nav Item - Dashboard -->
			<li class="nav-item active">
				<a class="nav-link" href="admin_main.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i>
		   			<span>main</span>
		   	 	</a>
		    </li>
		<!-- Divider -->
			<hr class="sidebar-divider">
			
			
		<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
			    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        <i class="fas fa-fw fa-cog"></i>
			        <span>Product</span>
			    </a>
			    
			    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			        <div class="bg-white py-2 collapse-inner rounded">
			            <h6 class="collapse-header">Product</h6>
			            <a class="collapse-item" href="list.do">상품조회</a>
			            <a class="collapse-item" href="admin_product2.jsp">상품등록</a>
			            
			        </div>
			    </div>
			</li>
			
		    <!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item">
				<a class="nav-link" href="mem.do">
				    <i class="fas fa-fw fa-wrench"></i>
				    <span>Member</span>
				</a>
			</li>
		<!-- Divider -->
		    <hr class="sidebar-divider d-none d-md-block">
		</ul>
	<!-- End of Sidebar -->
	
	<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
		    <!-- Main Content -->
			<div id="content">
		    <!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				    <!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					    <i class="fa fa-bars"></i>
					</button>
				<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
			    <!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">admin</span>
						   		<img class="img-profile rounded-circle" src="assets/images/undraw_profile.svg">
							</a>
					<!-- Dropdown - User Information -->
				            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
					               	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
				                    Logout
				                </a>
				            </div>
				        </li>
				    </ul>
				</nav>
		<!-- End of Topbar -->
		<!-- Begin Page Content -->
				<div class="container-fluid">
			    <!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Member</h1>
					<p class="mb-4">펫홈페이지 회원관리입니다.</p>
				
				<!-- DataTales Example -->
					<div class="card shadow mb-4">
					    <div class="card-header py-3">
					        <h6 class="m-0 font-weight-bold text-primary">회원정보 리스트</h6>
					    </div>
					    <div class="card-body">
					        <div class="table-responsive">
					            <table class="table table-bordered" id="dataTable" width="100%"
					                   cellspacing="0">
					                <thead>
					                    <tr>
					                        <th>아이디</th>
					                        <th>비밀번호</th>
					                        <th>강아지이름</th>
					                        <th>강아지성별</th>
					                        <th>강아지생일</th>
					                        <th>강아지개월수</th>
					                        <th>전화번호</th>
					                        <th>가입날짜</th>
					                        <th>주소</th>
					                        <th>이메일</th>
					                    </tr>
					                </thead>
					                
					                <tbody>
					                    <c:choose>
						                  	<c:when test="${ empty membersList }">
						                      <tr>
						                          <td colspan="10" align="center">등록된 회원이 없습니다.</td>
						                      </tr>
				                  			</c:when>
				                  			<c:when test="${ !empty membersList }">
												<c:forEach var="mem" items="${ membersList }">
													<tr>
														<td>${mem.ID}</td>
														<td>${mem.PASSWORD}</td>
														<td>${mem.PET_NAME}</td>
														<td>${mem.PET_GENDER}</td>
														<td>${mem.PET_YY}</td>
														<td>${mem.PET_MONTH}</td>
														<td>${mem.USER_PHONE}</td>
														<td>${mem.JOIN_DAY}</td>
														<td>${mem.HOME_ADD}</td>
														<td>${mem.USER_EMAIL}</td>
													</tr>
				                     			 </c:forEach>
			                     			 </c:when>
				              			</c:choose>
				                    </tbody>
				                </table>
				            </div>
				        </div>
				    </div>
				</div>
		<!-- /.container-fluid -->
		</div>
		<!-- End of Main Content -->
		
		<!-- Footer -->
			<footer class="sticky-footer bg-white">
			    <div class="container my-auto">
			        <div class="copyright text-center my-auto">
			            <span>Copyright &copy; Your Website 2023</span>
			        </div>
			    </div>
			</footer>
		<!-- End of Footer -->
		</div>
	<!-- End of Content Wrapper -->
	</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
			<div class="modal-body">로그아웃하시면 홈페이지 메인으로 돌아갑니다.
			</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="dogcat">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>
	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
</body>
</html>