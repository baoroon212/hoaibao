<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header/header.jsp"></jsp:include>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="admin/query.htm">Admin Page</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="trang-chu.htm">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
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

      <div class="col-lg-3">

       <h1 class="my-4"><font face="Times New Roman" size="10">Admin quản lí</font></h1>
      
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
        <div class="row">
		<c:forEach var="t" items="${tom}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
            <div><a class="close" aria-label="Close"  href="admin/deletesp/${t.masanpham}.htm"><span aria-hidden="true">&times;</span></a> </div>
              <a href="#"><img class="card-img-top" src="${t.hinhanh }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${t.tensanpham }</a>
                </h4>
                <h5>Giá : ${t.giagoc }VNĐ/1KG</h5>
                <p class="card-text">${t.motangan }</p>
              </div>
              <a class="btn btn-primary" href="admin/editsp/${t.masanpham}.htm">Sửa sản phẩm</a>
            </div>
          </div>
		</c:forEach>
		
		<c:forEach var="c" items="${ca}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
            <div><a class="close" aria-label="Close"  href="admin/deletesp/${c.masanpham}.htm"><span aria-hidden="true">&times;</span></a> </div>
              <a href="#"><img class="card-img-top" src="${c.hinhanh }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${c.tensanpham }</a>
                </h4>
                <h5>Giá : ${c.giagoc }VNĐ/1KG</h5>
                <p class="card-text">${c.motangan }</p>
              </div>
                <a class="btn btn-primary" href="admin/editsp/${c.masanpham}.htm">Sửa sản phẩm</a>
            </div>
          </div>
		</c:forEach>
		
		<c:forEach var="cg" items="${cuaghe}">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
            <div><a class="close" aria-label="Close"  href="admin/deletesp/${cg.masanpham}.htm"><span aria-hidden="true">&times;</span></a> </div>
              <a href="#"><img class="card-img-top" src="${cg.hinhanh }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${cg.tensanpham }</a>
                </h4>
                <h5>Giá : ${cg.giagoc }VNĐ/1KG</h5>
                <p class="card-text">${cg.motangan }</p>
              </div>
              <a class="btn btn-primary" href="admin/editsp/${cg.masanpham}.htm">Sửa sản phẩm</a>
            </div>
          </div>
		</c:forEach>
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
 <footer class="py-5 bg-dark">
	<jsp:include page="../footer/footer.jsp"></jsp:include>
</footer>

  <!-- Bootstrap core JavaScript -->
  <script src="shop/vendor/jquery/jquery.min.js"></script>
  <script src="shop/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
