<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<%@include file="../Component/Common_CSS_JS.jsp"%>
<style type="text/css">
.Admin
{
	margin-left: 300px;
}
.card
{
	height: 250px;
}
a:hover
{
	text-decoration: none;
}
.custom-icon
{
	font-size: 80px;
}
</style>
</head>
<body>
<%@include file="../Component/navbar.jsp"%>
		<!-- Main -->
	<div class="container Admin">
			<c:set var="msgString" value="${message}" />
					 <c:if test="${not empty msgString}">
					    <div class="alert alert-warning alert-dismissible fade show" role="alert">
						 ${message}
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
					 </c:if>
		<div class="row mt-3">
			<div class="col-md-5">
				<div class="card" >
				<a href="/viewProfile">
					<div class="card-body text-center">
					<div class="container">
							<img style="max-width:100px" class="img-fluid rounded-circle" alt="" src="Img/man.png">
						</div>
						<h2 class="text-uppercase text-muted mt-3">View Profile</h2>
					</div>
				</a>
				</div>				

			</div>
			<div class="col-md-5">		
				<div class="card">
				<a href="/checkout">
					<div class="card-body text-center">
						<div class="container">
							<i class="bi bi-bag custom-icon"></i>
						</div>
						<h2 class="text-uppercase text-muted mt-3">My Cart</h2>
					</div>
				</a>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-5">
			<a href="/myOrders?userId=${user.userId}">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:100px" class="img-fluid " alt="" src="Img/interace.png">
						</div>
						<h1 class="text-uppercase text-muted mt-3">My Orders</h1>
					</div>
				</div>
			</a>
			</div>
			<div class="col-md-5">
				<div class="card" >
					<div class="card-body text-center">
						<div class="container">
							<i class="bi bi-gear custom-icon"></i>
						</div>
						<h1 class="text-uppercase text-muted mt-3">Setting</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../Component/common_model.jsp"%>
</body>
</html>