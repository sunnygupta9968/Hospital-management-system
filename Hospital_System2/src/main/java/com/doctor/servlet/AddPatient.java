package com.doctor.servlet;

import java.io.IOException;

import com.dao.DoctorDao;
import com.dao.PatientDao;
import com.db.DBConnection;
import com.entity.Doctor;
import com.entity.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addPatient")
public class AddPatient extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fullName=req.getParameter("fullName");		
		int age=Integer.parseInt(req.getParameter("age"));
		String department=req.getParameter("department");
		String doctor=req.getParameter("doctor");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		
		
		PatientDao dao=new PatientDao(DBConnection.getConn());
		Patient p=new Patient(fullName,age,department,doctor, email, mobno);
	
		boolean f=dao.addPatients(p);
		HttpSession session=req.getSession();
		if(f) {
			System.out.println("success");
			session.setAttribute("succMsg" ,"Patient Added Successfully!");
			resp.sendRedirect("doctor/patiens.jsp");
			
			
		}else {
			System.out.println("Failed");
			session.setAttribute("errorMsg" ,"Some error occured!");
			resp.sendRedirect("doctor/patients.jsp");
		}
		
	}
	

}
