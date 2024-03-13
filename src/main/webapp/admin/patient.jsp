<%@page import="javax.sound.sampled.ReverbType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Patients</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
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
		<%@include file="navbar.jsp"%>
		<div class="col-md-12 mt-3">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Patient Details</p>
					<%boolean flag = false; %>
					<form class="form-inline mr-3 col-md-3">
						<div class="form-group mb-2">
									<label for="inputEmail4" class="form-label">Search By Date
									</label> <input type="date" class="form-control"
										name="sdate" required />
										
							
						</div>
						<button type="submit" class="btn btn-success mb-2">Check With Date</button>
						<a href="patient.jsp" class="btn btn-primary mb-2">Check All Records</a>
					</form>

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
								<th scope="col">Doctor Name</th>
								<th scope="col">Address</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						String sdate = request.getParameter("sdate");
						
							if(sdate == null || flag == true){
							List<Appointment> list = dao.getAllAppointment();
							for (Appointment ap : list) {
								Doctor d = dao2.getDoctorById(ap.getDoctorId());
							%>

							<tr>
								<th><%=ap.getFullName()%></th>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppoinDate()%></td>
								<td><%=ap.getEmail()%></td>
								<td><%=ap.getPhNo()%></td>
								<td><%=ap.getDiseases()%></td>
								<td><%=d.getFullName()%></td>
								<td><%=ap.getAddress()%></td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%> <a href="#"
									class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %>
									<button class="btn btn-sm btn-success" disabled>Completed</button>
									<%
									}
									%>
								</td>
							</tr>
							<%
							}
							%><%
							}else{
								List<Appointment> list = dao.getAllAppointmentByDate(sdate);
							for (Appointment ap : list) {
								Doctor d = dao2.getDoctorById(ap.getDoctorId());
							%>

							<tr>
								<th><%=ap.getFullName()%></th>
								<td><%=ap.getGender()%></td>
								<td><%=ap.getAge()%></td>
								<td><%=ap.getAppoinDate()%></td>
								<td><%=ap.getEmail()%></td>
								<td><%=ap.getPhNo()%></td>
								<td><%=ap.getDiseases()%></td>
								<td><%=d.getFullName()%></td>
								<td><%=ap.getAddress()%></td>
								<td>
									<%
									if ("Pending".equals(ap.getStatus())) {
									%> <a href="#"
									class="btn btn-sm btn-warning">Pending</a> <%
 } else {
 %>
									<button class="btn btn-sm btn-success" disabled>Completed</button>
									<%
									}
									%>
								</td>
							</tr>
							<%
							}}
							%>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>