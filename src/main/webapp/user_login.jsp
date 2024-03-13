<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Login</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backImg{
background-image: url('https://st3.depositphotos.com/2109679/15819/i/450/depositphotos_158197098-stock-photo-empty-bed-gurney-in-hospital.jpg');
height: 115vh;
background-repeat: no-repeat;
width: 100%;
background-size: cover;
background-position: center;
}
*{
margin: 0;
padding: 0;
}
</style>
</head>
<body>
<div class="backImg">
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-3">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<form action="userlogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									type="email" name="email" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input onkeyup="validatePass()"
									type="password" name="password" class="form-control" required><span id="passerr"></span>
							</div>

							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
						<br>Don't have an account? <a href="signup.jsp"
							class="text-decoration-none">create one</a>
					</div>
				</div>
			</div>
		</div>
	</div></div>
		<script type="text/javascript">
		const validatePass  = () =>{
			let pass = document.getElementById("pass").value;
			let regexname = /^[0-9\sA-Za-z\s]*$/;
			if(regexname.test(pass) && pass.length < 6)
				{

				pass = document.getElementById("pass");
				pass.style.border = "3px solid red";
				document.getElementById("passerr").innerText = "password is too weak";
					console.log(pass);
					
				}
			else
				{
				pass = document.getElementById("pass");
				pass.style.border = "3px solid green";
				document.getElementById("passerr").innerText = "";
				}
	}
		</script>
</body>
</html>