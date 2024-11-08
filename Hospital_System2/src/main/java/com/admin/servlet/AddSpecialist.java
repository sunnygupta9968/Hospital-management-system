package com.admin.servlet;

import java.io.IOException;

import com.dao.SpecialistDao;
import com.db.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addspecialist")
public class AddSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String spec_name=req.getParameter("specName");
		SpecialistDao dao=new SpecialistDao(DBConnection.getConn());
		boolean f=dao.addSpeciallist(spec_name);
		HttpSession session=req.getSession();
		if(f) {
			
			session.setAttribute("succMsg" ,"Specialist Added Successfully!");
			resp.sendRedirect("admin/index.jsp");
			
		}else {
			
			session.setAttribute("errorMsg" ,"Some error occured!");
			resp.sendRedirect("admin/index.jsp");
		}
		
	}
	

}
