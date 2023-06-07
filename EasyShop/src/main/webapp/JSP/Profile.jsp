<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile</title>
<%@include file="Component/Common_CSS_JS.jsp"%>

</head>
<body>
<%@include file="Component/navbar.jsp"%>
<div class="container-fluid">
	<div class="row mt-2">
		<div class="col-md-5 offset-md-3">
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
						<img style="max-width:70px" class="img-fluid" src="Img/User.png" alt="" >
					</div>
					<h2 class="text-center my-2">Your Profile</h2>
					<form method="post" action="/updateUser">
						<div class="form-group mt-4 row">
							<label for="userId" class="col-sm-3 ml-3 col-form-label">User Id</label>
						    <input type="text" class="form-control col-8" name="userId" id="userId" autocomplete="off"  value ="${user.userId}" readonly>
						</div>
						<div class="form-group mt-4 row">
							<label class="col-sm-3 ml-3 col-form-label">UserName</label>
						    <input type="text" class="form-control col-8" name="userName" id="userName" autocomplete="off"  value ="${user.userName}"placeholder="User Name">
						</div>
						<div class="form-group mt-4 row">
							<label class="col-sm-3 ml-3 col-form-label">Email Id</label>
						    <input type="email" class="form-control col-8" name="userEmail" id="userEmail" autocomplete="off" value ="${user.userEmail}" placeholder="Email ID" required>
						</div>
						<div class="form-group mt-4 row">
							<label class="col-sm-3 ml-3 col-form-label">Password</label>
						    <input type="password" class="form-control col-8" name="userPassword" id="userPassword" autocomplete="off" value ="${user.userPassword}" placeholder="Password" required>
						</div>
						<div class="form-group mt-4 row">
							<label class="col-sm-3 ml-3 col-form-label">Mobile No</label>
						    <input type="number" class="form-control col-8" name="userPhone" id="userPhone" autocomplete="off" value ="${user.userPhone}" placeholder="Phone No.">
						</div>
						
						<div class="form-group mt-4 row">
						   <label class="col-sm-3 ml-3 col-form-label">Address</label>
						   <textarea style="height:100px" class="form-control col-8" autocomplete="off" name="userAddress" value ="${user.userAddress}" placeholder="Enter Your Address">${user.userAddress}</textarea>
						</div>
						<div class="container text-center">
							<input type="submit" class="btn btn-outline-success" value="Update Profile">
							<a class="btn btn-outline-warning" href="/Home">Home</a>
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