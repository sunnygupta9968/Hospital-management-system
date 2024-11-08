package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/removeDoctor")
public class DeleteDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		DoctorDao dao=new DoctorDao(DBConnection.getConn());
		HttpSession session=req.getSession();
		boolean f=dao.removeDoctor(id);
		if(f) {
			session.setAttribute("delSucc", "Doctor Removed Successfully");
			resp.sendRedirect("admin/doctor.jsp");
		}
		else {
			session.setAttribute("delFail", "Something went wrong");
			resp.sendRedirect("admin/doctor.jsp");
		}
		
		
		
	}
	
}
