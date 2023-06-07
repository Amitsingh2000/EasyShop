<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EasyShop | Product</title>
<%@include file="../Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="../Component/navbar.jsp"%>
	<div class="container mt-2">
		<div class="row mt-2">
		      <div class="col-md-6 offset-md-3">
		      	<div class="card">
		      		<div class="card-body px-3">
						<h2 class="text-center my-2 fw-bold">Update Product</h2>
					
						<form action="updateProduct" method="post" enctype="multipart/form-data">
							<div class="form-group">
					       		<input type="text" class="form-control mt-4" name="productId" value="${product.productId}"  readonly required>
					       	</div>
					       	<div class="form-group">
					       		<input type="text" class="form-control mt-4" name="productName" value="${product.productName}"  required>
					       	</div>
					       	<div class="form-group">
								<input type="text" class="form-control" name="productDescription" style="height:100px" value="${product.productDescription}" required>
					       	</div>
					       	<div class="form-group">
					       		<input type="number" class="form-control" name="productPrice" value="${product.productPrice}" required>
					       	</div>
					       	<div class="form-group">
					       		<input type="number" class="form-control" name="stockQuantity" value="${product.stockQuantity}" required>
					       	</div>
					       	<div class="form-group">
						       	<select class="form-control" name="productCategory.categoryId" >
									 <option value="${product.productCategory.categoryId}" selected>${product.productCategory.categoryTitle}</option>
									 <c:forEach items="${categoryList}" var="category">
									 	<option value="${category.categoryId}">${category.categoryTitle}</option>	
									 </c:forEach>
								</select>	
					       	</div>
					       	<div class="form-group">
					       		<label for="productPhoto"></label>
					       		<input type="file" id="productPhoto"  name="productImg" >
			
					       	</div>
							<div class="container text-center">
								<input type="submit" class="btn btn-outline-success" value="Update Product">
								<a type="button" class="btn btn-outline-primary" href="/adminDashboard">Back</a>
							</div>		       
						</form>
		      </div>
		      </div>
		      </div>
		    </div>
	
	</div>

</body>
</html>