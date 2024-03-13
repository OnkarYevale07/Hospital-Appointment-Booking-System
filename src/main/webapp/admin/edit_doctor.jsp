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
<title>Admin : Edit Doctor</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">


			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty sucMsg}">
							<p class="fs-3 text-center text-success">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao = new DoctorDao(DBConnect.getConn());
						Doctor d = dao.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									name="fullname" class="form-control" required value="<%=d.getFullName() %>" />
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									name="dob" class="form-control" required value="<%=d.getDob() %>" />
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
									type="text" name="qualification" class="form-control" required value="<%=d.getQualification() %>" />
							</div>

							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									class="form-control" required>
									<option> <%=d.getSpecialist() %></option>

									<%
									SpecialistDao dao1 = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao1.getAllSpecialist();

									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName() %></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" class="form-control" required value="<%=d.getEmail() %>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									name="mobno" class="form-control" required value="<%=d.getMobNo() %>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input type="password"
									name="password" class="form-control" required value="<%=d.getPassword() %>" />
							</div>
							<input type="hidden" name="id" value="<%=d.getId() %>" />

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>