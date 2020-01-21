<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<base href = "${pageContext.servletContext.contextPath}/">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>
	<style type="text/css">
		h1, h3,h2,h4,h5,form {
		  text-align: center;
		}
		input,checkbox{
		display: inline-block;
	}
		label {
		display: inline-block;
	}
	label.error {
		display: inline-block;
		text-align: center;
        color:red;
    }
	</style>
  <!-- Custom fonts for this template-->
  <link href="adminpage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="adminpage/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="adminpage/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="admin/query.htm">Admin SeaFood</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="admin/changepass.htm">Change Password</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="admin/out.htm" >Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="admin/trang-chu-sp.htm">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Sản phẩm</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="admin/admininsert.htm">
          <i class="fas fa-fw fa-table"></i>
          <span>Thêm sản phẩm</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        
        <!-- DataTables Example -->
        	<h1 class="form-title"><font face="Times New Roman" size="10" >Sửa Sản Phẩm</font></h1>
		<h6>${message}</h6>
		<form:form action="admin/editsp2.htm" method="POST" id ="form"  enctype="multipart/form-data"  modelAttribute="sp">
							 <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="masanpham" size="40" />
                            </div>
                            <div class="form-group">
                                <label for="hoten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="tensanpham" type="text" style = "display: inline-block"  placeholder="Tên sản phẩm" size="40"  /> <br/>
                            </div>
                            <h6>Hình ảnh</h6>
                            <p><img src=${sp.hinhanh } alt="Anh" style="width:500x;height:250px;" /></p>
                            <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="hinhanh" size="40" />
                            </div>
							<input type="file" name="image">                        
                            <div class="form-group">
                                <label for="diachi"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:textarea path="motangan" placeholder="Mô tả ngắn" COLS="43" ROWS="5"/>
                            </div>
                            <div class="form-group">
                                <label for="sdt"><i class="zmdi zmdi-account material-icons-phone"></i></label>
                                <form:input path="giagoc" placeholder="Giá góc" size="40" />
                            </div>
                            <div class="form-group">
                                <a><input class="btn btn-primary" type="submit" value="Sửa sản phẩm"></a>
                            </div>
		
		</form:form>
		<!--  
		<form action="upload.htm" method="post" enctype="multipart/form-data">
				<div>File</div>
				<input type="file" name="image">
				<button>Upload</button>
		</form>
		-->
      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
	
  <!-- Bootstrap core JavaScript-->
  <script src="adminpage/vendor/jquery/jquery.min.js"></script>
  <script src="adminpage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="adminpage/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="adminpage/vendor/chart.js/Chart.min.js"></script>
  <script src="adminpage/vendor/datatables/jquery.dataTables.js"></script>
  <script src="adminpage/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="adminpage/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="adminpage/js/demo/datatables-demo.js"></script>
  <script src="adminpage/js/demo/chart-area-demo.js"></script>
  
  <!-- Validate -->
  <script src="adminpage/vendor/jquery/jquery-1.11.3.js"></script>
  <script src="adminpage/vendor/jquery/jquery.validate.js"></script>
 
 
 <script type="text/javascript">

	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#form").validate({
			rules: {
				tensp: "required",
				giagoc: "required",
				mota: {
					required: true,
					minlength: 2
				}
			},
			messages: {
				tensp: "Vui lòng nhập tên sản phẩm",
				giagoc:"Vui lòng nhập giá góc sản phẩm",
				mota: {
					required: "Vui lòng nhập mô tả",
					minlength: "Mô tả ngắn vậy, chém gió ah?"
				}
			}
		});
	});
	</script>
</body>
</html>