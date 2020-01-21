<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
<base href = "${pageContext.servletContext.contextPath}/">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

	<style type="text/css">
		h1, h3,h2,h4,h5,form,label {
		  text-align: center;
		}
		label.error {
		display: inline-block;
		text-align: center;
        color:red;
    }
	</style>
  <!-- Bootstrap core CSS -->
  <link href="shop/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="shop/css/shop-homepage.css" rel="stylesheet">
	
	<!-- Font Icon -->
    <link rel="stylesheet" href="colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css">
	 
    <!-- Main css -->
    <link rel="stylesheet" href="colorlib-regform-7/css/style.css">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">Sea Food</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="trang-gio-hang.htm">Giỏ Hàng</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <jsp:include page="footer.jsp"></jsp:include>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="shop/image/banner/banner1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="shop/image/banner/banner2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="shop/image/banner/banner3.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
        
		<!-- San pham can mua -->
		<div >
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="${sanpham.hinhanh }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${donhang.tensanpham }</a>
                </h4>
                <h5>Giá : ${sanpham.giagoc }VNĐ/1KG</h5>
              </div>
            </div>
		</div>
		
		<h2 class="form-title"><font face="Times New Roman" size="10">Đặt Hàng</font></h2>
		<h6>${message}</h6>
		<form:form action="send.htm" id="form" method="POST" modelAttribute="donhang">
							<div style="display: none">
							<label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<form:input path="madonhang" size="40" />
							</div>
							<div style="display: none">
							<label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<form:input path="tensanpham" size="40" />
							</div>
		
                            <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="masanpham" size="40" />
                            </div>
                            <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="tongtien" size="40" />
                            </div>
                            <div class="form-group">
                                <label for="hoten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="hoten" placeholder="Họ và tên" size="40"  />
                            </div>
                            <div class="form-group">
                                <label for="diachi"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="diachi" placeholder="Địa chỉ giao hàng" size="40"/>
                            </div>
                            <div class="form-group">
                                <label for="sdt"><i class="zmdi zmdi-account material-icons-phone"></i></label>
                                <form:input path="sdt" placeholder="Số điện thoại" size="40" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <form:input path="email" placeholder="Địa chỉ email" size="40" />
                            </div>
                           <div class="form-group">
                                <label for="soluong"><i class="zmdi zmdi-email"></i>Số lượng</label>
                                <form:input type="number" step="1" min="1" max="10" path="soluong" value="1" title="SL" class="input-text qty text" size="4" pattern="[0-9]*" inputmode="numeric"/>
                               <!-- <form:input path="soluong" placeholder="Số lượng" size="40" value ="1"  /> --> 
                            </div>
                            
                            <div class="form-group form-button">
                                <a><input class="btn btn-primary" type="submit" value="Đặt hàng"></a>
                            </div>
		
		</form:form>
		<!--  
		<form:form action="giohang.htm" method="POST" modelAttribute="sanpham">
								<div style="display: none">
							<label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<form:input path="masanpham" size="40" />
							</div>
							<div style="display: none">
							<label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
								<form:input path="tensanpham" size="40" />
							</div>
							
                            <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="hinhanh" size="40" />
                            </div>
                            <div style="display: none">
                                <label for="ten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="motangan" size="40" />
                            </div>
                            <div class="form-group" style="display: none">
                                <label for="hoten" style="display: none"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="giagoc" placeholder="Họ và tên" size="40"  />
                            </div>
								
							<div class="form-group form-button">
	              			<a><input class="btn btn-primary" type="submit" value="Thêm vào giỏ hàng"></a>
	         				</div>
		</form:form>
		-->
		 <!-- 
        <h2 class="form-title">Đặt Hàng</h2>
        				${message}
        				
                        <form action="insertorder.htm" method="POST" class="register-form" id="register-form"  modelAttribute="donhang">
                           
                            <div class="form-group">
                                <label for="hoten"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="hoten" id="hoten" placeholder="Họ và tên" size="40"  />
                            </div>
                            <div class="form-group">
                                <label for="diachi"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="diachi" id="diachi" placeholder="Địa chỉ giao hàng" size="40" />
                            </div>
                            <div class="form-group">
                                <label for="sdt"><i class="zmdi zmdi-account material-icons-phone"></i></label>
                                <input type="text" name="sdt" id="sdt" placeholder="Số điện thoại" size="40" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Địa chỉ email" size="40"  aria-required="true" aria-invalid="false"/>
                            </div>
                           <div class="form-group">
                                <label for="soluong"><i class="zmdi zmdi-email"></i></label>
                                <input type="soluong" name="soluong" id="soluong" placeholder="Số lượng" size="40"  aria-required="true" aria-invalid="false"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <a><input class="btn btn-primary" type="submit" value="Đặt hàng"></a>
                                <a><input class="btn btn-primary" type="submit" value="Thêm vào giỏ hàng"></a>
                            </div>
                        </form>  -->
    
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
	<div class="container">
      <p class="m-0 text-center text-white">© 2019 Cửa hàng thực phẩm | Design by <a href="https://www.facebook.com/BaoBao0112">Hoài Bảo</p>
    </div>
    <!-- /.container -->
  </footer>
	<!-- JS -->
    <script src="shop/colorlib-regform-7/vendor/jquery/jquery.min.js"></script>
    <script src="shop/colorlib-regform-7/js/main.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script src="shop/vendor/jquery/jquery.min.js"></script>
  <script src="shop/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!-- Validate -->
  <script src="adminpage/vendor/jquery/jquery-1.11.3.js"></script>
  <script src="adminpage/vendor/jquery/jquery.validate.js"></script>
 
 
 <script type="text/javascript">

	$(document).ready(function() {

		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#form").validate({
			rules: {
				hoten: "required",
				diachi: "required",
				sdt: "required",
				email: {
					required: true
				}
			},
			messages: {
				hoten: "Vui lòng nhập họ tên",
				diachi: "Vui lòng nhập địa chỉ",
				sdt:"Vui lòng nhập số đt",
				email: {
					required: "Vui lòng nhập email"
				}
			}
		});
	});
	</script>

</body>

</html>
