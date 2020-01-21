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
        <h1 class="form-title"><font face="Times New Roman" size="10">Giỏ Hàng</font></h1>
        
		<!-- San pham can mua -->
		<div>
		<div class="row">
		<c:forEach var="dh" items="${sanpham}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
            <div><a class="close" aria-label="Close"  href="deletegiohang/${dh.masanpham}.htm"><span aria-hidden="true">&times;</span></a> </div>
              <a href="#"><img class="card-img-top" src="${dh.hinhanh }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${dh.tensanpham }</a>
                </h4>
                <h5>Giá : ${dh.giagoc }VNĐ/1KG</h5>

              </div>
              <div class="form-group">
                <h5>Số lượng <input type="number" step="1" min="1" max="10" name="soluong" value="1" title="SL" class="input-text qty text" size="4" pattern="[0-9]*" inputmode="numeric" /></h5>
              </div>
             <a class="btn btn-primary" href="edit/${dh.masanpham}.htm">Thanh Toán</a> 
             
            </div>
          </div>
		</c:forEach>
      </div>
      <h1><a class="btn btn-primary"  style="background: Orange" href="edit/${dh.masanpham}.htm"><img width="25" height="25" src="shop/image/banner/giohang1.png"  sizes="(max-width: 25px) 100vw, 25px">Xác nhận thanh toán giỏ hàng</a> </h1>
      </div>
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

</body>

</html>
