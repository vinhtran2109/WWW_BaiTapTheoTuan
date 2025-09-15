<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="pageTitle" value="Trang chủ - IUH Bookstore"/>
<jsp:include page="WEB-INF/jspf/header.jspf"/>

<div class="p-5 mb-4 bg-white rounded-3 shadow-sm">
  <div class="container py-5">
    <h1 class="display-5 fw-bold">Chào mừng đến IUH Bookstore</h1>
    <p class="col-md-8 fs-5">Khám phá những tựa sách hay nhất và thêm vào giỏ hàng chỉ với một cú nhấp.</p>
    <a class="btn btn-primary btn-lg" href="danhsach">Mua sắm ngay</a>
  </div>
  </div>

<div class="row g-3">
  <div class="col-md-4">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Sách mới</h5>
        <p class="card-text">Cập nhật những đầu sách mới nhất.</p>
        <a class="btn btn-outline-primary" href="danhsach">Xem danh sách</a>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Giỏ hàng</h5>
        <p class="card-text">Xem và quản lý các sản phẩm đã thêm.</p>
        <a class="btn btn-outline-primary" href="giohang.jsp">Xem giỏ hàng</a>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Hỗ trợ</h5>
        <p class="card-text">Cần trợ giúp? Liên hệ với chúng tôi.</p>
        <a class="btn btn-outline-secondary" href="#">Liên hệ</a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="WEB-INF/jspf/footer.jspf"/>