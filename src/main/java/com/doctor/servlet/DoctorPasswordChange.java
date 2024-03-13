package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/doctChangePassword")
public class DoctorPasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid").trim());
		String oldPassword = request.getParameter("oldPassword").trim();
		String newPassword = request.getParameter("newPassword").trim();
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("sucMsg", "Password Change Successfully...");
				response.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsg", "Something wrong on server");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
			
			
		}else {
			
			session.setAttribute("errorMsg", "Old Password Incorrect!");
			response.sendRedirect("doctor/edit_profile.jsp");
			
		}
	}

}
