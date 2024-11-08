package com.admin.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.SpecialistDao;
import com.db.DBConnection;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/adddoctor")
public class AddDoctor extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fullName=req.getParameter("fullName");
		String qualification=req.getParameter("qualification");
		String specialist=req.getParameter("spec");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String password=req.getParameter("password");
		
		DoctorDao dao=new DoctorDao(DBConnection.getConn());
		Doctor d=new Doctor(fullName,qualification,specialist, email, mobno,password);
	
		
		boolean f=dao.registerDoctor(d);
		HttpSession session=req.getSession();
		if(f) {
			System.out.println("success");
			session.setAttribute("succMsg" ,"Doctor Added Successfully!");
			resp.sendRedirect("admin/doctor.jsp");
			
			
		}else {
			System.out.println("Failed");
			session.setAttribute("errorMsg" ,"Some error occured!");
			resp.sendRedirect("admin/doctor.jsp");
		}
		
	}
	
}
