package com.admin.servlet;

import java.io.IOException;

import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/adminlogin")
public class Admin_login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session=req.getSession();
			if("sunny@gmail.com".equals(email) && "sunny@123".equals(password)) {
				session.setAttribute("adminObj",new User());
				session.setAttribute("succMsg", "Admin Login Succesfully");
				resp.sendRedirect("admin/index.jsp");
				
			}
			else {
				session.setAttribute("errorMsg", "Invalid email or password");
				resp.sendRedirect("admin_login.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
