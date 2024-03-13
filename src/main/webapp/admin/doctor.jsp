<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.dao.*"%>
<%@page import="com.db.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Doctor</title>
<%@include file="../component/allcss.jsp"%>
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
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg}">
							<p class="fs-3 text-center text-success">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" onkeyup="validateName()" class="form-control"
									required id="name" /> <span id="nameerr"></span>
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" required />
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" id="qualification" name="qualification" class="form-control" required />
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control" required>
									<option>--select--</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();

									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" class="form-control" required />
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label><input type="tel"
									name="mobno" id="mobno" onkeyup="validateMob()" class="form-control" required /> <span id="moberr"></span>
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" name="password" class="form-control" required />
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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

</div>
</body>
</html>