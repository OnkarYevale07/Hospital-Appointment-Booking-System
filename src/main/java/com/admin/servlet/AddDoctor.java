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
import com.entity.Doctor;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String fullName = request.getParameter("fullname").trim();
			String dob = request.getParameter("dob").trim();
			String qualification = request.getParameter("qualification").trim();
			String spec = request.getParameter("spec").trim();
			String email = request.getParameter("email").trim();
			String mobno = request.getParameter("mobno").trim();
			String password = request.getParameter("password").trim();
			
			Doctor d = new Doctor(fullName,dob,qualification, spec, email, mobno, password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = request.getSession();
			
			if(dao.registerDoctor(d)) {
				session.setAttribute("sucMsg", "Doctor Added Successfully...");
				response.sendRedirect("admin/doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "something wrong on server");
				response.sendRedirect("admin/doctor.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
