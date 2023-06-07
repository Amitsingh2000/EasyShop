<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login - ESTORE</title>
<%@include file="Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white">
						<h3>Sign In Here</h3>
					</div>
					<div class="card-body">
					<c:set var="msgString" value="${message}" />
					 <c:if test="${not empty msgString}">
					    <div class="alert alert-warning alert-dismissible fade show" role="alert">
						 ${message}
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						    <span aria-hidden="true">&times;</span>
						  </button>
						</div>
					 </c:if>
					<form action="" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input name="username" type="text" class="form-control" id="userName" >
						     <label for="exampleInputPassword1">Password</label>
						    <input type="password" name="password" class="form-control" id="userPassword">
						  </div>
						  <a href="register" class="text-center d-block mb-2">If not register Click Here</a>
						  <div class="container text-center">
						  <input type="submit" class="btn btn-primary border-0" value="Login">
						  <button type="submit" class="btn btn-primary border-0">Reset</button>
						  </div>
					</form>
					</div>
					<div class="card-footer">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Component/common_model.jsp"%>
</body>
</html>