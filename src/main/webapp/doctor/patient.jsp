<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.*"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor : View Patients</title>
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
	<div class="container p-3">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<c:if test="${not empty sucMsg }">
					<p class="text-center text-success fs-3">${sucMsg}</p>
					<c:remove var="sucMsg" scope="session" />
				</c:if>

				<c:if test="${not empty errorMsg}">
					<p class="text-center text-danger fs-3">${errorMsg}</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Patient Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Disease</th>
							<th scope="col">Action</th>
							<th scope="col">Comment<th>
							<th scope="col" class="text-center">Status<th>
						</tr>
					</thead>
					<tbody>
						<%
						Doctor d = (Doctor) session.getAttribute("docObj");
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
						for (Appointment ap : list) {
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							
							<td>
								<%
								if ("Pending".equals(ap.getStatus())) {
								%><a href="comment.jsp?id=<%=ap.getId()%>"
								class="btn btn-success btn-sm">Comment</a> <%
								 } else {
								 %> <a href="#" class="btn btn-success btn-sm disabled">Commented</a>
								  <%
								 }
								 %>

							</td>
							<td><%=ap.getStatus()%>
							<td>
									<%if("Pending".equals(ap.getStatus())){%>
										<a href="#" class="btn btn-sm btn-warning">Pending</a>
										<%}else{%>
										<button class="btn btn-sm btn-success" disabled>Success</button>
									<%}%>
									</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
</html>