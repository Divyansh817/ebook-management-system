package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderDAO;
import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();

			int uid = Integer.parseInt(req.getParameter("uid"));

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("zip");
			String paymentType = req.getParameter("paymentType");

			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pin;

//		System.out.println(name + " " + email + " " + phone + " " + fullAddress + " " + paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> cart = dao.getCartByUser(uid);

			if (cart.isEmpty()) {
				session.setAttribute("failedMsg", "Add items in cart.");
				resp.sendRedirect("checkout.jsp");
			} else {
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				Book_Order o = null;

				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();

				for (Cart c : cart) {
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phone);
					o.setFullAddress(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice());
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;

				}

				if (paymentType.equals("noSelect")) {
					session.setAttribute("failedMsg", "Please Choose a Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
