<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="Chi tiết sách - IUH Bookstore"/>
<jsp:include page="WEB-INF/jspf/header.jspf"/>

<c:if test="${not empty product}">
  <div class="row g-4">
    <div class="col-md-5">
      <img class="img-fluid rounded shadow-sm book-detail" src="<c:url value='/images/${product.imgURL}'/>" alt="${product.model}"/>
    </div>
    <div class="col-md-7">
      <h2 class="mb-3">${product.model}</h2>
      <p class="text-muted">Mã: ${product.id}</p>
      <p>${product.description}</p>
      <div class="d-flex align-items-center gap-3 mb-3">
        <span class="fs-4 fw-bold text-primary">${product.price} VND</span>
        <small class="text-muted">Còn lại: ${product.quantity}</small>
      </div>
      <form class="d-flex gap-2" action="cart" method="post">
        <input type="hidden" name="action" value="add" />
        <input type="hidden" name="id" value="${product.id}" />
        <button class="btn btn-primary" type="submit">Thêm vào giỏ</button>
        <a class="btn btn-outline-secondary" href="<c:url value='/danhsach'/>">Quay lại danh sách</a>
      </form>
    </div>
  </div>
</c:if>

<jsp:include page="WEB-INF/jspf/footer.jspf"/>
