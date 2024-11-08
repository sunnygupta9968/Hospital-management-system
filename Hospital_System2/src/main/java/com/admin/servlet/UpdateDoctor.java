package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnection;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullName=req.getParameter("fullName");		
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("spec");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String password=req.getParameter("password");
		
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		DoctorDao dao=new DoctorDao(DBConnection.getConn());
		
		Doctor d=new Doctor(id,fullName,qualification,specialist, email, mobno,password);
		
		boolean f=dao.updateDoctor(d);
		if(f) {
			resp.sendRedirect("admin/edit_doctor.jsp");
		}
		else {
			resp.sendRedirect("admin/doctor.jsp");
		}
		
	}
	
}
