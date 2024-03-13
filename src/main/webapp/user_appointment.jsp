
<%
response.setHeader("cache-control", "no-cache");
response.setHeader("cache-control", "no-store");
response.setHeader("pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.*"%>
<%@page import="com.db.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : User Appointments</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

input::webkit-outer-spin-button, input:: webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.backImg {
	background-image:
		url('https://st3.depositphotos.com/2109679/15819/i/450/depositphotos_158197098-stock-photo-empty-bed-gurney-in-hospital.jpg');
	height: 115vh;
	background-repeat: no-repeat;
	width: 100%;
	background-size: cover;
	background-position: center;
}

* {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<div class="backImg">
		<%@include file="component/navbar.jsp"%>

		<div class="container-fluid p-5 pt-1">
			<p class="text-center fs-2 text-white"></p>
		</div>
		<div class="container p-3">
			<div class="row">
				<div class="col-md-6 p-5">
					<img alt="" src="img/doctor101.png" height="400px">
				</div>
				<div class="col-md-6">
					<div class="card paint-card">
						<div class="card-body">
							<p class="text-center fs-3">User Appointment</p>
							<c:if test="${not empty sucMsg }">
								<p class="text-center text-success fs-4">${sucMsg}</p>
								<c:remove var="sucMsg" scope="session" />
							</c:if>
							<c:if test="${not empty errorMsg}">
								<p class="text-center text-danger fs-4">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>

							<form class="row g-3" action="addAppointment" method="post">
								<input type="hidden" name="userid" value="${userObj.id}" />
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Patient
										Name</label> <input type="text" class="form-control"
										onkeyup="validateName()" id="name" name="fullname" required />
									<span id="nameerr"></span>
								</div>

								<div class="col-md-6">
									<label>Gender</label> <select class="form-control"
										name="gender" required>
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Age</label> <input
										type="number" class="form-control" name="age" required />
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Appointment
										Date</label> <input type="date" class="form-control"
										name="appoint_date" required />
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> <input
										type="email" class="form-control" name="email" required />
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Phone No</label> <input
										type="tel" onkeyup="validateMob()" id="mobno" maxlength="10"
										class="form-control" name="phno" required /> <span
										id="moberr"></span>
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Diseases</label> <input
										type="text" class="form-control" name="diseases" required />
								</div>

								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Doctor</label> <select
										class="form-control" name="doct" required>
										<option value="">--select--</option>
										<%
										DoctorDao dao = new DoctorDao(DBConnect.getConn());
										List<Doctor> list = dao.getAllDoctor();
										for (Doctor d : list) {
										%>
										<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpecialist()%>)
										</option>
										<%
										}
										%>
									</select>
								</div>
								<div class="col-md-12">
									<label>Full Address</label>
									<textarea name="address" class="form-control" rows="3" cols=""
										required></textarea>
								</div>
								<c:if test="${empty userObj}">
									<a href="user_login.jsp"
										class="col-md-6 offset-md-3 btn btn-success">Submit</a>
								</c:if>
								<c:if test="${not empty userObj}">
									<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>

	<script> 
	const validateName  = () =>{
				let name = document.getElementById("name").value;
				let regexname = /^[A-Za-z\s]*$/;
				if(regexname.test(name))
					{
						console.log(name);
						name = document.getElementById("name");
						name.style.border = "3px solid green";
						document.getElementById("nameerr").innerText = "";
					}
				else
					{
					name = document.getElementById("name");
					name.style.border = "3px solid red";
					document.getElementById("nameerr").innerText = "⚠️Please Enter Valid Credentials";
					}
	}
		
	const validateMob  = () =>{
		let mobno = document.getElementById("mobno").value;
		let regexname =  /^[0-9]*$/;
		if(regexname.test(mobno) && mobno.length <= 10)
			{
				console.log(mobno);
				mobno = document.getElementById("mobno");
				mobno.style.border = "3px solid green";
				document.getElementById("moberr").innerText = "";
			}
		else
			{
			mobno = document.getElementById("mobno");
			mobno.style.border = "3px solid red";
			document.getElementById("moberr").innerText = "⚠️Please Enter Valid Credentials";
			}
}
	</script>
</body>
</html>