package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String phno = req.getParameter("phno");
			String check = req.getParameter("check");

			HttpSession session = req.getSession();
// 	To check if we are successfully retrieving data 
//	System.out.println(name+" " + email + " " + phno + " " + password + " " +check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhno(phno);

			if (check != null) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f1 = dao.checkUser(email);
				if (f1) {
					boolean f = dao.userRegister(us);
					if (f) {
						// System.out.println("User Register Success...");
						session.setAttribute("successMsg", "Registration Successful..");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.println("Something went wrong...");
						session.setAttribute("failedMsg", "Something went wrong...");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failedMsg", "User already exists");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Please Check Agree to Terms & Condition.");
				session.setAttribute("failedMsg", "Please check Terms & Condition.");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.getWriter().println("An error occurred while processing your request.");
			return;
		}
	}

}
