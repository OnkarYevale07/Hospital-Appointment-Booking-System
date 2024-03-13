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
<title>Admin : All Users</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
#display{
align-item: center;
margin-left: 20rem;
}
.backImg{
background-image: url('https://st3.depositphotos.com/2109679/15819/i/450/depositphotos_158197098-stock-photo-empty-bed-gurney-in-hospital.jpg');
height: 100vh;
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
	<div class="col-md-7 mt-3" id="display">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">User Id</th>
							<th scope="col">User Name</th>
							<th scope="col">Email</th>
						</tr>
					</thead>
					<tbody>
						<%
						UserDao dao2 = new UserDao(DBConnect.getConn());
						List<User> list = dao2.getAllUsers();
						
						for (User u : list) {
							
						%>

						<tr>
							<th><%=u.getId() %></th>
							<th><%=u.getFullName() %></th>
							<td><%=u.getEmail() %></td>
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