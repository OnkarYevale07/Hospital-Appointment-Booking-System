<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital Management System</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://img.freepik.com/premium-photo/group-successful-confident-modern-medical-doctors-are-posing-looking-camera-hospital-corridor_283617-1203.jpg?w=2000"
					class="d-block w-100" alt="doctor1" height="500px">
			</div>
			<div class="carousel-item">
				<img
					src="https://thumbs.dreamstime.com/b/close-up-doctor-touching-digital-virtual-screen-analytics-medical-data-technology-concept-188047633.jpg"
					class="d-block w-100" alt="doctor2" height="500px">
			</div>
			<div class="carousel-item">
				<img
					src="https://t3.ftcdn.net/jpg/00/65/70/46/360_F_65704664_tgaIru5RW9htlUvMUyxpuqBEvDGnfqoO.jpg"
					class="d-block w-100" alt="doctor3" height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing slit.
									Voluptetemm inteortu</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing slit.
									Voluptetemm inteortu</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing slit.
									Voluptetemm inteortu</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing slit.
									Voluptetemm inteortu</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<img width="539x" height="360px" alt=""
					src="https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1580196666465-doctor.jpg" />
			</div>
		</div>
	</div>

	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt=""
							src="https://img.etimg.com/thumb/width-1200,height-900,imgsize-291877,resizemode-75,msid-78842463/magazines/panache/being-busy-with-work-helped-motherhood-hospitals-ceo-stay-positive.jpg"
							width="250px" height="300px" />
						<p class="fw-bold fs-5">Shivam Kumar</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt=""
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTa-reiWaSwG2TNEBT3-1BrV5EgTX5DfJamTw&usqp=CAU"
							width="250px" height="300px" />
						<p class="fw-bold fs-5">Dr.Jainesh Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt=""
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZKHZ0PFKn1b8RLf8aztKjHc63QqIdAP-6Net-694GemtFCmvD2soTT6Hj9XAXN7DhS8w&usqp=CAU"
							width="250px" height="300px" />
						<p class="fw-bold fs-5">Dr.Sneha Deshmukh</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt=""
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFPw6X5Ni0axuSuXHW7VF4JQf_r0thv6HWRBwQS8r8PvvISZipynRP5kQiW5QIfCGbseQ&usqp=CAU"
							width="250px" height="300px" />
						<p class="fw-bold fs-5">Dr.Yashwant Patil</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="footer">
		<div class="box-container">

			<div class="box text-center">
				<h1>
					<a class="navbar-brand" href="index.jsp"><i
						class="fa-solid fa-house-medical"></i> MEDI HOME</a>
				</h1>
				<p class="text-center">Medicines cure diseases, but only good
					doctors can cure patients.</p>
				<div class="share">
					<a href="www.facebook.com" target="_blank" class="fa fa-facebook"></a> <a
						href="www.twitter.com" class="fa fa-twitter"></a> <a
						href="www.instagram.com" class="fa fa-instagram"></a> <a
						href="www.linkedin.com" class="fa fa-linkedin"></a>
				</div>
			</div>


			<div class="box">
				<h3>Contact Info</h3>
				<a href="#" class="links"><i class="fa fa-phone"></i>+91
					8698424630</a> <a href="#" class="links"><i class="fa fa-phone"></i>+91
					9158392392</a> <a href="mailto:onkaryevale0@gmail.com" class="links"><i class="fa fa-envelope"></i>Onkaryevale0@gmail.com</a>
				<a href="#" class="links"><i class="fa fa-map-marker"></i>Warananagar,India
					- 416114</a>
			</div>

			<div class="box">
				<h3>Quick Links</h3>
				<a href="index.jsp" class="links"><i class="fa fa-arrow-right"></i>Home</a>
				<a href="user_appointment.jsp" class="links"><i class="fa fa-arrow-right"></i>Book Appointment</a>
				<a href="user_login.jsp" class="links"><i class="fa fa-arrow-right"></i>User Login</a>
				<a href="doctor_login.jsp" class="links"><i class="fa fa-arrow-right"></i>Doctor Login</a>
				<a href="signup.jsp" class="links"><i class="fa fa-arrow-right"></i>Register As User</a>
				<a href="mailto:onkaryevale0@gmail.com" class="links"><i class="fa fa-arrow-right"></i>Help</a>
			</div>

		</div>




	</section>

	<%@include file="component/footer.jsp"%>
</body>
</html>