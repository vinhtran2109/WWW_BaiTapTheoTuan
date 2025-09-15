<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="pageTitle" value="Thanh toán - IUH Bookstore"/>
<jsp:include page="WEB-INF/jspf/header.jspf"/>

<h2 class="mb-3">Thanh toán</h2>
<form class="row g-3" action="processCheckout" method="post" novalidate>
  <div class="col-md-6">
    <label class="form-label">Họ và tên</label>
    <input class="form-control" type="text" name="fullname" required>
    <div class="invalid-feedback">Vui lòng nhập họ và tên</div>
  </div>
  <div class="col-md-6">
    <label class="form-label">Địa chỉ giao hàng</label>
    <input class="form-control" type="text" name="address" required>
    <div class="invalid-feedback">Vui lòng nhập địa chỉ</div>
  </div>
  <div class="col-md-4">
    <label class="form-label">Tổng tiền</label>
    <input class="form-control" type="text" name="total" readonly value="${sessionScope.cart.total}">
  </div>
  <div class="col-12">
    <label class="form-label d-block">Phương thức thanh toán</label>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="payment" id="pay1" value="Paypal" checked>
      <label class="form-check-label" for="pay1">Paypal</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="payment" id="pay2" value="ATM Debit">
      <label class="form-check-label" for="pay2">ATM Debit</label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="radio" name="payment" id="pay3" value="Visa/Master card">
      <label class="form-check-label" for="pay3">Visa/Master card</label>
    </div>
  </div>
  <div class="col-12 d-flex gap-2">
    <button class="btn btn-primary" type="submit">Lưu</button>
    <button class="btn btn-outline-secondary" type="reset">Hủy</button>
  </div>
</form>

<script>
  (() => {
    'use strict'
    const forms = document.querySelectorAll('form')
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  })()
</script>

<jsp:include page="WEB-INF/jspf/footer.jspf"/>
