package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullName = request.getParameter("fullname").trim();
			String email = request.getParameter("email").trim();
			String password = request.getParameter("password").trim();
			
			
			User u = new User(fullName, email, password);
			
			UserDao dao = new UserDao(DBConnect.getConn());
	
			HttpSession session = request.getSession();
			
			boolean f = dao.userRegister(u);
			
			if(f) {
				session.setAttribute("sucMsg", "Register Successfully...");
				response.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("errorMsg", "Something wrong on server");
				response.sendRedirect("signup.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
