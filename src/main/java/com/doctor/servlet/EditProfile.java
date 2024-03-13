package com.doctor.servlet;

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

@WebServlet("/doctUpdateProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String fullName = request.getParameter("fullname").trim();
			String dob = request.getParameter("dob").trim();
			String qualification = request.getParameter("qualification").trim();
			String spec = request.getParameter("spec").trim();
			String email = request.getParameter("email").trim();
			String mobno = request.getParameter("mobno").trim();
			
			
			int id = Integer.parseInt(request.getParameter("id").trim());
			
			Doctor d = new Doctor(id,fullName,dob,qualification, spec, email, mobno, "");
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			HttpSession session = request.getSession();
			
			if(dao.editDoctorProfile(d)) {
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("sucMsgd", "Doctor Update Successfully...");
				session.setAttribute("docObj", updateDoctor);
				
				response.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsgd", "something wrong on server");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
