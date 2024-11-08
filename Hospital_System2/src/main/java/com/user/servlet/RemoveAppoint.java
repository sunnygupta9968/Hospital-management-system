package com.user.servlet;

import java.io.IOException;

import com.dao.AppointmentDao;
import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/deleteAppoint")
public class RemoveAppoint extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("userId"));
		AppointmentDao dao=new AppointmentDao(DBConnection.getConn());
		boolean f=dao.removeAppoint(id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("del_succMsg", "Appointment Deleted SuccessFully");
			resp.sendRedirect("book_appointments.jsp");
		}
		else {
			session.setAttribute("del_errorMsg", "Appointment Deleted SuccessFully");
			resp.sendRedirect("book_appointments.jsp");
		}
		
	}
	

}
