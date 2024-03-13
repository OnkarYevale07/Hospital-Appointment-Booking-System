<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.dao.*" %>
<%@page import="com.db.*" %>
<%@page import="com.entity.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor : Home</title>
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
	<p class="text-center fs-2 mt-2">Doctor Dashboard</p>
	
	<% 
	Doctor d = (Doctor)session.getAttribute("docObj");
	DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<a href="patient.jsp" class="text-success"><i class="fas fa-calendar-check fa-3x"></i></a><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointmentByDoctorId(d.getId()) %>
						</p>
					</div>
				</div>
			</div>
		</div>

	</div></div>
</body>
</html>