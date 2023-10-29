<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin_product</title>
        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    
    <!-- 상품등록 시 입력창 천단위 콤마찍기 -->
	<script type= "text/javascript">
	    function inputNumberAutoComma(obj) {  
	        // 콤마의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
	        var deleteComma = obj.value.replace(/\,/g, "");
	        // 콤마를 제외하고 문자가 입력되었는지를 확인한다.
	        if(isFinite(deleteComma) == false) {
	            alert("문자는 입력하실 수 없습니다.");
	            obj.value = "";
	            return false;
	        } 
	        // 기존에 들어가있던 콤마를 제거한 이 후의 입력값에 다시 콤마를 삽입한다.
	        obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
	    }
	   
	    // 천단위 이상의 숫자에 콤마를 삽입하는 함수
	    function inputNumberWithComma(str) {
	        str = String(str);
	        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	    }
	    
	    // 콤마가 들어간 값에 콤마를 제거하는 함수
	    function inputNumberRemoveComma(str) {
	        str = String(str);
	        return str.replace(/[^\d]+/g, "");
	    }
	</script>

	<!-- 상품등록 제출하기 -->
	<script>
		function submitForm() {
			document.getElementById('uploadForm').submit();
		}
	</script>


	<style>
		
		td.left {
			padding-left : 1em;
		}
				 
		label {
			font-weight : bold;
		}
	</style>    
    
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
                        <span>main</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
                    aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Product</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Product</h6>
                        <a class="collapse-item" href="list.do">상품조회</a>
                        <a class="collapse-item" href="admin_product2.jsp">상품등록</a>
                        <a class="collapse-item active" href="admin_product3.jsp">상품수정</a>
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
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">admin</span>
                                    <img class="img-profile rounded-circle" src="assets/images/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
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
                        <h1 class="h3 mb-2 text-gray-800">Product</h1>
                        <p class="mb-4">펫홈페이지 상품관리입니다.</p>
					<!-- Brand Buttons -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                             <h6 class="m-0 font-weight-bold text-primary">상품수정</h6>
                        </div>
                    <div class="card-body">
                    <table border ="1">
                            <form id="uploadForm" action="upload.do"  method="post" enctype="multipart/form-data">
     							<tr><td class="left" width="400px" height="100px"><label for="PImg">상품사진</label></td>
     							<td class="left" width="800px"><input id="PImg" name="PImg" type="file"></td></tr>
      							
     							<tr><td class="left" height="70px"><label for="PCode">상품코드</label></td>
     							<td class="left" ><input id="PCode" name="PCode" type="number" pattern="[0-9]+" required></td></tr>
     							
     							<tr><td class="left" height="70px"><label for="PName">상품이름</label></td>
     							<td class="left" ><input id="PName" name="PName" type="text" required></td></tr>
     							
     							<tr><td class="left" height="70px"><label for="price">상품가격</label></td>
     							<td class="left" ><input id="price" name="price" type="text" required onKeyup="inputNumberAutoComma(this);"> 원</td></tr>
     							
     							<tr><td class="left" height="70px"><label for="stock">재고</label></td>
     							<td class="left" ><input id="stock" name="stock" type="number" pattern="[0-9]+" required></td></tr>
     							
     							<tr><td class="left" height="70px"><label for="category">카테고리</label></td>
     							<td class="left" >
									<select id="category" name="category">
										<option>강아지</option>
										<option>고양이</option>
									</select>&nbsp;&nbsp;
									<select id="category" name="category">
										<option>사료</option>
										<option>간식</option>
									</select>&nbsp;&nbsp;
									<select id="category" name="category">
										<option>건식</option>
										<option>습식</option>
									</select></td></tr>
			
     							<tr><td class="left" height="70px"><label for="PKG">상품무게</label></td>
     							<td class="left" ><input id="PKG" name="PKG" type="number" pattern="[0-9]+" required> kg</td></tr>
								<br><input type=submit value=상품수정 class="btn btn-google btn-block">
				 			</form>
				 	</table> 					
                       	 	                                        														
                     </div>
                     </div>
 			   </div>
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
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
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
            <script src="vendor/chart.js/Chart.min.js"></script>
            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>
    </body>
</html>