<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row mt-2">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body px-3">
					<c:set var="msgString" value="${message}" />
					 <c:if test="${not empty msgString}">
					    <div class="alert alert-warning alert-dismissible fade show" role="alert">
						 ${message}
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
					 </c:if>
					<div class="container text-center">
						<img style="max-width:70px" class="img-fluid" src="Img/reg_logo.png" alt="" >
					</div>
					<h2 class="text-center my-2">Sign up Here</h2>
					<form method="post" action="/registerUser">
						<div class="form-group mt-4">
						    <input type="text" class="form-control" name="userName" id="userName" autocomplete="off" placeholder="User Name">
						</div>
						<div class="form-group">
						    <input type="text" class="form-control" name="userEmail" id="userEmail" autocomplete="off" placeholder="Email ID" required>
						</div>
						<div class="form-group">
						    <input type="password" class="form-control" name="userPassword" id="userPassword" autocomplete="off" placeholder="Password" required>
						</div>
						<div class="form-group">
						    <input type="number" class="form-control" name="userPhone" id="userPhone" autocomplete="off" placeholder="Phone No.">
						</div>
						
						<div class="form-group">
						   <textarea style="height:100px" class="form-control" autocomplete="off" name="userAddress" placeholder="Enter Your Address"></textarea>
						</div>
						<div class="container text-center">
							<input type="submit" class="btn btn-outline-success" value="Register Here">
							<button class="btn btn-outline-warning">Reset</button>
						</div>									
					</form>
				</div>
			</div>
		</div>
	</div> 
	</div>
	<%@include file="Component/common_model.jsp"%>
</body>
</html>