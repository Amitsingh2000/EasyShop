<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>E-Store | My Orders</title>
	<%@include file="../Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>
	
	<div class="container">
		<div class="row-md-6  mt-2 mb-3">
			<div class="card text-center">
			  <div class="card-body ">
			  <form>
			  		<h2 class="mb-3">User Details</h2>
					<div class="row">
						<div class="mb-2 col-6">
						  <label for="email" class="form-group">User Id</label> &nbsp;
						  <input type="text" class="form-group" id="email" value=" ${user.userId}" disabled>
						</div>
						<div class="mb-3 col-6">
						  <label for="email" class="form-group">User Name</label> &nbsp;
						  <input type="text" class="form-group" id="email" value=" ${user.userName}" disabled>
						</div>	
					</div>	
					<div class="row">
						<div class="mb-3 col-6">
						  <label for="email" class="form-group">User Email</label> &nbsp;
						  <input type="text" class="form-group" id="email" value=" ${user.userEmail}" disabled>
						</div>
						<div class="mb-3 col-6">
						  <label for="email" class="form-group">Mobile No</label> &nbsp;
						  <input type="text" class="form-group" id="email" value=" ${user.userPhone}" disabled>
						</div>	
					</div>	
						
			</form>
			  </div>
			</div>
		</div>
		<h2 class="text-center mb-3">My Orders</h2>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Products</th>
      <th scope="col">Quantity</th>
      <th scope="col">Category</th>
      <th scope="col">Amount</th>
      <th scope="col">Status</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${orderList}" var="order">
      <tr>
        <td>${order.orderId}</td>
        <td>
          <c:forEach items="${order.orderProducts}" var="orderProduct">
            <span>${orderProduct.product.productName}</span><br/>
           
          </c:forEach>
        </td>
        <td>
          <c:forEach items="${order.orderProducts}" var="orderProduct">
            <span>${orderProduct.quantity}</span><br/>
            
          </c:forEach>
        </td>
        <td>
          <c:forEach items="${order.orderProducts}" var="orderProduct">
            <span>${orderProduct.product.productCategory.categoryTitle}</span><br/>
           
          </c:forEach>
        </td>
        <td class="align-bottom text-center">${order.orderAmount}</td>
        <td>${order.orderStatus}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>

	</div>
	<%@include file="../Component/common_model.jsp"%>

</body>
</html>