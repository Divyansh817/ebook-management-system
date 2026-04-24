package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.deleteBook(cid);
		
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("succMsg", "Book Deleted From Cart Successfully");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("checkout.jsp");
		}
	}

	
	
	
}
