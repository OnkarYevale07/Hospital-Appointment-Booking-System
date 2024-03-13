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
<title>Doctor : Edit Profile</title>
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
	<c:if test="${empty docObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>



	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 ">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required />
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required />
							</div>
							<input type="hidden" value="${docObj.id }" name="uid" />
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
				<c:if test="${not empty sucMsgd }">
						<p class="text-center text-success fs-3">${sucMsgd}</p>
						<c:remove var="sucMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd}">
						<p class="text-center text-danger fs-3">${errorMsgd}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../doctUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" class="form-control" value="${docObj.fullName }" required />
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" value="${docObj.dob }" required />
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" value="${docObj.qualification }" required />
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control" required>
									<option>${docObj.specialist }</option>

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
									name="email" class="form-control" value="${docObj.email }" readonly required />
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" class="form-control" value="${docObj.mobNo }" required />
							</div>
							
							<input type="hidden" name="id" value="${docObj.id }">

							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div></div>
</body>
</html>