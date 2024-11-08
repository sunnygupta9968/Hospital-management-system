package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnection;
import com.entity.appointments;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/bookAppoin")
public class book_appointments extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId=Integer.parseInt(req.getParameter("userid"));
		String fullName=req.getParameter("fullname");
		String gender=req.getParameter("gender");
		int age=Integer.parseInt(req.getParameter("age"));
		String appoindate=req.getParameter("appoint_date");
		String email=req.getParameter("email");
		String mobno=req.getParameter("phno");
		String disease=req.getParameter("diseases");
		int doctorId=Integer.parseInt(req.getParameter("doctor"));
		String address=req.getParameter("address");
		System.out.println(appoindate);
		AppointmentDao dao=new AppointmentDao(DBConnection.getConn());
		appointments a=new appointments(userId,fullName,gender,age,appoindate,email,mobno,disease,doctorId,address);
		boolean f=dao.bookAppoin(a);
		if(f) {
			
			resp.sendRedirect("book_appointments.jsp");
		}
		else {
			
			resp.sendRedirect("index.jsp");
		}
		
	}
	
}
