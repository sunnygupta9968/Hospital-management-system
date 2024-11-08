package com.user.servlet;

import java.io.IOException;

import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname=req.getParameter("fullname");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			User u=new User(fullname,email,password);
			Userdao dao=new Userdao(DBConnection.getConn());
			HttpSession session=req.getSession();
			boolean f=dao.register(u);
			
			if(f) {
				session.setAttribute("successMsg","Registered Successfully!");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("errorMsg","Something went wrong on Server");
				resp.sendRedirect("signup.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
