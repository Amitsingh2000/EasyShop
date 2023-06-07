<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<script type="text/javascript" src="JS/script.js"></script>

<style type="text/css">
.card
{
	padding-top: 15px;
}
</style>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row mt-3 mx-2">
		
		<!-- show Products -->
		<div class="col-md-12">
			<div class="row mt-3">
				<div class="col-md-12">
					<div class="card-columns">
						<c:if test="${productList !='0'}">
							<c:forEach items="${productList}" var="products">
							<div class="card product-card">
							 	<div class="container text-center">
							 		<img src="Img/products/${products.productPhoto}" style="max-height:250px; max-width:100%; width:auto" class="card-img-top" alt="...">
							 	</div>
							  <div class="card-body text-center">
							    <h5 class="card-title">${products.productName}</h5>
							    <p class="card-text"> ${products.productDescription}</p>
							    <c:choose>
							   		<c:when test="${products.stockQuantity > 0}">
							    		<button onclick="add_to_cart('${products.productId}','${products.productName}',${products.productPrice})" class="btn btn-primary custom-bg">Add to Cart</button>
							     	</c:when>
							    	<c:otherwise>
            							<button class="btn btn-secondary" disabled>Out of Stock</button>
									</c:otherwise>
							    </c:choose>
							    <button class="btn btn-success">&#8377 ${products.productPrice}/-</button>
							  </div>
							</div>
					</c:forEach>
					<c:if test="${empty productList}">
						<h2>No products found</h2>
					</c:if>
						
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>	
	
	<%@include file="Component/common_model.jsp"%>

</body>
</html>