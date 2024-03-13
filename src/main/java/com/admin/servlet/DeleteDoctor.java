package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id").trim());
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.deleteDoctor(id)) {
			session.setAttribute("sucMsg", "Doctor Delete Successfully...");
			response.sendRedirect("admin/view_doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "something wrong on server");
			response.sendRedirect("admin/view_doctor.jsp");
		}
	}

}
