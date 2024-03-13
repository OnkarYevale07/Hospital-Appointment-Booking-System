package com.user.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userid").trim());
		String fullname = request.getParameter("fullname").trim();
		String gender = request.getParameter("gender").trim();
		String age = request.getParameter("age").trim();
		String appoint_date = request.getParameter("appoint_date").trim();
		String email = request.getParameter("email").trim();
		String phno = request.getParameter("phno").trim();
		String diseases = request.getParameter("diseases").trim();
		int doctor_id = Integer.parseInt(request.getParameter("doct").trim());
		String address = request.getParameter("address").trim();
		
		Appointment ap = new Appointment(userId,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id, address,"Pending");
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.addAppointment(ap)) {
//			//		smtp properties
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", true);
			properties.put("mail.smtp.starttls.enable", true);
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			
			final String userName = "onkaryevale1";
			final String password = "efpdgwhjjlzejpfq";
			
//			Session
			Session session1 = Session.getInstance(properties, new Authenticator() {

				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(userName, password);
				}
				
			});
			
			try {
				Message message = new MimeMessage(session1);
				message.setRecipient(Message.RecipientType.TO,new InternetAddress(email));
				message.setFrom(new InternetAddress("onkaryevale1@gmail.com"));
				message.setSubject("Appointment Book");
				message.setText("Your Appointment Book Successfully...\n"
						+ ""
						+ "Dear [Patient's Name],\r\n"
						+ "\r\n"
						+ "Your appointment at [Your Clinic Name] is set for [Appointment Date] at [Appointment Time] with [Provider's Name]. Arriving early will help streamline your visit. Questions or rescheduling? Call [Your Clinic Phone Number]. We're here to assist you and ensure a smooth healthcare experience.\r\n"
						+ "\r\n"
						+ "Warm regards,\r\n"
						+ "[Your Name]\r\n"
						+ "[Your Clinic Name]");
				Transport.send(message);
				System.out.println("Email sent Successfully...");
				
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("Email sent Successfully...");
			}
			session.setAttribute("sucMsg", "Appointment Successfully...");
			response.sendRedirect("user_appointment.jsp");
			
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("user_appointment.jsp");
		}
		
	}

}
