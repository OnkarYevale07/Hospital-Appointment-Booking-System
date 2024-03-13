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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
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
			
			int id = Integer.parseInt(request.getParameter("id").trim());
			
			Doctor d = new Doctor(id,fullName,dob,qualification, spec, email, mobno, password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = request.getSession();
			
			if(dao.updateDoctor(d)) {
				session.setAttribute("sucMsg", "Doctor Update Successfully...");
				response.sendRedirect("admin/view_doctor.jsp");
			}else {
				session.setAttribute("errorMsg", "something wrong on server");
				response.sendRedirect("admin/view_doctor.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
