<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EasyShop | Category</title>
<%@include file="../Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row mt-2">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body px-3">
					<h2 class="text-center my-2 fw-bold">Update Category</h2>
					<form method="post" action="/adminDashboard/updateCategory">
						<div class="form-group mt-4">
						    <input type="text" class="form-control" name="categoryId" id="categoryId" autocomplete="off" value="${category.categoryId}" readonly>
						</div>
						<div class="form-group">
						    <input type="text" class="form-control" name="categoryTitle" id="categoryTitle" autocomplete="off" placeholder="Title" value="${category.categoryTitle}" required>
						</div>
						<div class="form-group">
						    <input type="text" class="form-control" name="categoryDescription" id="categoryDescription" autocomplete="off" value="${category.categoryDescription}" placeholder="Description" required>
						</div>
						<div class="container text-center">
							<input type="submit" class="btn btn-outline-success" value="Update">
							<a class="btn btn-outline-danger" href="/adminDashboard">Back</a>
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