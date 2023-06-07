<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container">
		 <a class="navbar-brand" href="/Home">
		 	<h3 class="fw-bold">EasyShop</h3>
		 </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="/Home">Home </a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	         Category
	        </a>
	        <div class="dropdown-menu">
	        	<a href="/getProductByCategory?categoryId=0" class="dropdown-item" aria-current="true">ALL Products</a>
	          <c:forEach items="${categoryList}" var="category">
			   <a href="/getProductByCategory?categoryId=${category.categoryId}" class="dropdown-item">${category.categoryTitle}</a>
			</c:forEach>
	        </div>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="/contactUs">Contact Us </a>
	      </li>
	    </ul>
	    <ul class="navbar-nav ml-auto"> 
	    	
	    	<li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#cart" href="#"><i class="bi bi-cart2 fa-lg mr-1"></i><span class="cart-items">(0)</span></a></li>
	    	
	    	<c:choose>
				<c:when test="${user.userRole == null}">
	    			<li class="nav-item active"><a class="nav-link" href="/login">Sign In</a></li>
	    		 </c:when>
			   <c:otherwise>
			  	<div class="dropdown show">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" >${user.userName} &nbsp; <i class="bi bi-person-circle fa-lg me-auto"></i></a>
			  	<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			  	<a class="dropdown-item" href="${user.userRole == 'ADMIN' ? '/adminDashboard' : '/userDashboard'}"> Dashboard</a>
			    <a class="dropdown-item" href="viewProfile">My Profile</a>
			    <c:if test="${user.userRole == 'USER'}">
			    <a class="dropdown-item" href="/myOrders?userId=${user.userId}">My Orders</a>
			    <a class="dropdown-item" href="/checkout">My Cart</a>
			    </c:if>
			    <hr class="dropdown-divider">
			    <a class="dropdown-item" href="/logout">Sign Out</a>
			  	</div>
			  	
			   	</div>
			   </c:otherwise>
			</c:choose>
         	
	    </ul>
	  </div>
	</div>
</nav>