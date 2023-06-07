<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center mb-5">Your Cart</h2>
						<div class="cart-body"></div>
					</div>
				</div>	 
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h2>Enter Your Details For Order</h2>
						<form>
						<div class="mb-3">
						  <label for="email" class="form-label">Email address</label>
						  <input type="text" class="form-control" id="email" value="${user.userEmail}" placeholder="name@example.com">
						</div>
						<div class="mb-3">
						  <label for="name" class="form-label">User Name</label>
						  <input type="text" class="form-control" id="name"  value="${user.userName}" placeholder="Enter Your Name">
						</div>
						<div class="mb-3">
						  <label for="mobile" class="form-label">Mobile No</label>
						  <input type="number" class="form-control" id="mobile"  value="${user.userPhone}" placeholder="Enter Your Name">
						</div>
						<div class="mb-3">
						  <label for="address" class="form-label">Your Shippingg Address</label>
						  <textarea class="form-control" id="address" rows="3" placeholder="Enter Your Address"> ${user.userAddress}</textarea>
						</div>
						<div class="mb-3">
						    <input type="hidden" id="userId" value="${user.userId}">
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success" onclick="checkout()" >Order Now</button>
							<a class="btn btn-outline-primary" href="/Home">Continue To Shopping</a>
						</div>
						</form>
					</div>
					
				</div>	
			</div>
		</div>
	</div>
	<%@include file="../Component/common_model.jsp"%>
	</body>
</html>