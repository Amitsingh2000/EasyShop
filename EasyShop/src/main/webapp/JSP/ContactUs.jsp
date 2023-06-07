<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<%@include file="Component/Common_CSS_JS.jsp"%>
</head>
<body>
	<%@include file="Component/navbar.jsp"%>
	<img src="Img/ContactUs.jpg" class="img-fluid "  alt="Responsive image">
	<div class="container">
		<h1 class="h1-responsive font-weight-bold text-center my-4">Contact us</h1>
		
		<div class="row mt-5">
			<p class="text-center w-responsive mx-auto mb-5">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
        a matter of hours to help you.</p>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15448185.6020287!2d53.55272445!3d19.0404351!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be7c90e40b80a1d%3A0x5c5be849fc866410!2sE-Store!5e0!3m2!1sen!2sin!4v1681879952666!5m2!1sen!2sin" width="500" height="420" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>					</div>
				</div>	 
			</div>
			<div class="col-md-6">
				<div class="card mb-5">
					<div class="card-body">
						<form action="" >
						<div class="mb-3">
						  <label for="email" class="form-label">Email address</label>
						  <input type="email" class="form-control" id="email"  placeholder="name@example.com">
						</div>
						<div class="mb-3">
						  <label for="name" class="form-label">Full Name</label>
						  <input type="text" class="form-control" id="name" placeholder="Enter Your Name">
						</div>
						<div class="mb-3">
						  <label for="subject" class="form-label">Subject</label>
						  <input type="text" class="form-control" id="subject" placeholder="Enter Subject">
						</div>
						<div class="mb-3">
						  <label for="message" class="form-label">Your Message</label>
						  <textarea class="form-control" id="message" rows="3" placeholder="Enter Your Message"></textarea>
						</div>
						<div class="container text-center">
						<button class="btn btn-primary">Submit</button>
						</div>
						</form>
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>