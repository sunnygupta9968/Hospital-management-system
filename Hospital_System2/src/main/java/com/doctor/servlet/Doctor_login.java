package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.db.DBConnection;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/doctor_login")
public class Doctor_login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			DoctorDao dao=new DoctorDao(DBConnection.getConn());
			Doctor d=dao.login(email, password);
			HttpSession session=req.getSession();
			if(d!=null) {
				session.setAttribute("doctorObj", new Doctor());
				session.setAttribute("succMsg", "Doctor Login Succesfully");
				resp.sendRedirect("doctor/index.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Doctor Login Failed");
				resp.sendRedirect("doctor_login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
