<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="Danh sách sách - IUH Bookstore"/>
<jsp:include page="WEB-INF/jspf/header.jspf"/>

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2 class="m-0">Danh sách sách</h2>
  <form class="d-flex" method="get" action="danhsach">
    <input class="form-control me-2" type="text" name="search" placeholder="Tìm kiếm sách" value="${param.search}" />
    <button class="btn btn-outline-light" type="submit">Tìm</button>
  </form>
  </div>

<div class="row g-3">
  <c:forEach var="book" items="${books}">
    <div class="col-6 col-md-4 col-lg-3">
      <div class="card h-100 shadow-sm">
        <c:choose>
          <c:when test="${not empty book.imgURL}">
            <img class="card-img-top book-thumb" src="<c:url value='/images/${book.imgURL}'/>" alt="${book.model}"/>
          </c:when>
<%--          <c:otherwise>--%>
<%--            <img class="card-img-top" src="<c:url value='/images/cleancode.svg'/>" alt="${book.model}"/>--%>
<%--          </c:otherwise>--%>
        </c:choose>
        <div class="card-body d-flex flex-column">
          <h6 class="card-title">${book.model}</h6>
          <div class="mt-auto">
            <div class="d-flex justify-content-between align-items-center">
              <span class="fw-bold text-primary">${book.price}</span>
              <small class="text-muted">SL: ${book.quantity}</small>
            </div>
            <div class="d-grid gap-2 mt-2">
              <a class="btn btn-sm btn-outline-primary" href="<c:url value='/chitietsach'><c:param name='id' value='${book.id}'/></c:url>">Xem chi tiết</a>
              <form action="<c:url value='/cart'/>" method="post">
                <input type="hidden" name="action" value="add" />
                <input type="hidden" name="id" value="${book.id}" />
                <button class="btn btn-sm btn-primary" type="submit">Thêm vào giỏ</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>

<div class="text-end mt-3">
  <a class="btn btn-outline-secondary" href="giohang.jsp">Giỏ hàng (${sessionScope.cart != null ? sessionScope.cart.items.size() : 0})</a>
</div>

<jsp:include page="WEB-INF/jspf/footer.jspf"/>
