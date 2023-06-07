<%@page import="com.easyshop.app.model.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>This is Admin Panel</title>
<%@include file="../Component/Common_CSS_JS.jsp"%>
<style type="text/css">
.action
{
	width: 200px;
}
</style>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>

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
			<div class="col-md-4">
				<div class="card"  data-toggle="modal" data-target="#viewUsersModel">
					<div class="card-body text-center">
					<div class="container">
							<img style="max-width:100px" class="img-fluid rounded-circle" alt="" src="Img/man.png">
						</div>
						<h2>${usersList.size()}</h2>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">		
				<div class="card"  data-toggle="modal" data-target="#viewCategoryModel">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:100px" class="img-fluid " alt="" src="Img/menu.png">
						</div>
						<h2>${categoryList.size()}</h2>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#viewProductModel"">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:100px" class="img-fluid " alt="" src="Img/box.png">
						</div>
						<h2>${productList.size()}</h2>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col md-6">
				<div class="card" data-toggle="modal" data-target="#addCategoryModel">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:100px" class="img-fluid " alt="" src="Img/interace.png">
						</div>
						<p class="mt-1">Click Here To Add Category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col md-6">
				<div class="card" data-toggle="modal" data-target="#addProductModel">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:100px" class="img-fluid " alt="" src="Img/new-product.png">
						</div>
						<p class="mt-1">Click Here To Add Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Add Category modal -->	
		<!-- Modal -->
		<div class="modal fade" id="addCategoryModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <form action="adminDashboard/addCategory" method="Post">
		       	<div class="form-group">
		       		<input type="text" class="form-control" name="categoryTitle" placeholder="Enter Category Title" required>
		       	</div>
				<div class="form-group">
					<textarea class="form-control" name="categoryDescription" style="height:100px" placeholder="Enter Category Description" required></textarea>
				</div>
				<div class="container text-center">
					<button class="btn btn-outline-success">Add Category</button>
					<button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
				</div>		       
		       </form>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- End Category modal -->
	
	<!-- Add Product modal -->	
		<!-- Modal -->
		<div class="modal fade" id="addProductModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      <form action="adminDashboard/addProduct" method="post" enctype="multipart/form-data">
				<div class="form-group">
		       		<input type="text" class="form-control" name="productName" placeholder="Enter Product Name" required>
		       	</div>
		       	<div class="form-group">
					<textarea class="form-control" name="productDescription" style="height:100px" placeholder="Enter Category Description" required></textarea>
		       	</div>
		       	<div class="form-group">
		       		<input type="number" class="form-control" name="productPrice" placeholder="Enter Product Price" required>
		       	</div>
		       	<div class="form-group">
		       		<input type="number" class="form-control" name="stockQuantity" placeholder="Enter Product Quantity" required>
		       	</div>
		       	<div class="form-group">
			       	<select class="form-control" name="productCategory.categoryId" >
						 <option value="null" selected>Select Category</option>
						 <c:forEach items="${categoryList}" var="category">
						 	<option value="${category.categoryId}">${category.categoryTitle}</option>	
						 </c:forEach>
					</select>	
		       	</div>
		       	<div class="form-group">
		       		<label for="productPhoto">Select Photo of Product  </label>
		       		<input type="file" id="productPhoto" name="productImg" required>

		       	</div>
				<div class="container text-center">
					<input type="submit" class="btn btn-outline-success" value="Add Product">
					<button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
				</div>		       
		       </form>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- End Product modal -->
	
	
	<!-- Start View Category -->
	<div class="modal fade" id="viewCategoryModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">View Category</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       		<table class='table text-center'>
								<thead class='thead-light'>
								<tr>
									<th> Category Id </th>
									<th> Category Name </th>
									<th> Category Description </th>
									<th> Action </th>
								</tr>
								</thead>
						 
						 <c:forEach items="${categoryList}" var="category">
						 	<tr>
								<td>${category.categoryId}</td>
								<td>${category.categoryTitle}</td>
								<td>${category.categoryDescription}</td>
								<td class="action"><a href="adminDashboard/viewCategory?categoryId=${category.categoryId}" class='btn btn-danger'>Edit</a> &nbsp; <a href="adminDashboard/deleteCategory?categoryId=${category.categoryId}" class='btn btn-danger'>Remove</a></td>
							</tr>
						 </c:forEach>
						</table>
				</div> 
		    
		    </div>
		  </div>
		</div>
	<!-- End View Category -->
	
	<!-- Start View Products -->
	<div class="modal fade" id="viewProductModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">View Product</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       <c:if test="${productList !='0'}">
						<table class='table text-center'>
								<thead class='thead-light'>
								<tr>
									<th> Product Id </th>
									<th> Product Name </th>
									<th> Product Description </th>
									<th> Product Price </th>
									<th> Action </th>
								</tr>
								</thead>
						 
						 <c:forEach items="${productList}" var="products">
						 	<tr>
								<td>${products.productId}</td>
								<td>${products.productName}</td>
								<td>${products.productDescription}</td>
								<td>${products.productPrice}</td>
								<td class="action"><a  class='btn btn-danger ' href="adminDashboard/viewProduct?productId=${products.productId}">Edit</a> &nbsp;<a  class='btn btn-danger' href="adminDashboard/deleteProduct?productId=${products.productId}">Remove</a> </td>
							</tr>
						 </c:forEach>
						</table>
					<c:if test="${empty productList}">
						<h2>No products found</h2>
					</c:if>
				</c:if>
		      </div>
		    </div>
		  </div>
		</div>
	<!-- End View Products -->
	
	<!-- Start View Users -->
	<div class="modal fade" id="viewUsersModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">View Users</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		       		<table class='table text-center'>
								<thead class='thead-light'>
								<tr>
									<th> User Id </th>
									<th> User Name </th>
									<th> User Email </th>
									<th> User Phone </th>
									<th> User Role </th>
									<th> Action </th>
								</tr>
								</thead>
						 
						 <c:forEach items="${usersList}" var="user">
						 	<tr>
								<td>${user.userId}</td>
								<td>${user.userName}</td>
								<td>${user.userEmail}</td>
								<td>${user.userPhone}</td>
								<td>${user.userRole}</td>
								<td><a href="adminDashboard/deleteUser?userId=${user.userId}" class='btn btn-danger'>Remove</a></td>
							</tr>
						 </c:forEach>
						</table>
				</div> 
		    
		    </div>
		  </div>
		</div>
	<!-- End View Category -->
	
	<%@include file="../Component/common_model.jsp"%>
	
</body>
</html>