<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="Giỏ hàng - IUH Bookstore"/>
<jsp:include page="WEB-INF/jspf/header.jspf"/>

<h2 class="mb-3">Giỏ hàng của bạn</h2>
<c:if test="${empty sessionScope.cart or empty sessionScope.cart.items}">
  <div class="alert alert-info">Giỏ hàng đang trống.</div>
  <a class="btn btn-primary" href="danhsach">Tiếp tục mua sắm</a>
</c:if>

<c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.items}">
  <div class="table-responsive">
    <table class="table table-striped align-middle">
      <thead>
        <tr>
          <th>ID</th>
          <th>Sản phẩm</th>
          <th>Giá</th>
          <th>Số lượng</th>
          <th>Tạm tính</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${sessionScope.cart.items}">
          <tr>
            <td>${item.product.id}</td>
            <td>${item.product.model}</td>
            <td>${item.product.price}</td>
            <td>
              <form class="d-flex gap-2" action="<c:url value='/cart'/>" method="post">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="productId" value="${item.product.id}" />
                <input class="form-control" style="width:90px" type="number" name="quantity" value="${item.quantity}" min="1" />
                <button class="btn btn-outline-primary" type="submit">Cập nhật</button>
              </form>
            </td>
            <td>${item.subtotal}</td>
            <td>
              <form action="<c:url value='/cart'/>" method="post">
                <input type="hidden" name="action" value="remove" />
                <input type="hidden" name="productId" value="${item.product.id}" />
                <button class="btn btn-outline-danger" type="submit">Xóa</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4" class="text-end fw-bold">Tổng cộng:</td>
          <td colspan="2" class="fw-bold">${sessionScope.cart.total}</td>
        </tr>
      </tfoot>
    </table>
  </div>

  <div class="d-flex justify-content-between mt-3">
    <a class="btn btn-outline-secondary" href="danhsach">Tiếp tục mua sắm</a>
    <a class="btn btn-primary" href="thanhtoan.jsp">Thanh toán</a>
  </div>
</c:if>

<jsp:include page="WEB-INF/jspf/footer.jspf"/>
