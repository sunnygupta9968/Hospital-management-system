package com.user.servlet;
import com.dao.*;
import java.io.IOException;

import com.db.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/userLogin")
public class User_login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		HttpSession session=req.getSession();
		Userdao dao=new Userdao(DBConnection.getConn());
		User user=dao.login(email, password);
		
		if(user!=null) {
			session.setAttribute("userObj", user);
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("errorMsg","Invalid email or password");
			resp.sendRedirect("user_login.jsp");
		}
	
	}
	
}
