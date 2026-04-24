package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("uname");
            String email = req.getParameter("uemail");
            String phno = req.getParameter("uphone");
            String password = req.getParameter("upass");

            HttpSession session = req.getSession(false); // Don't create new session automatically
            User user = (session != null) ? (User) session.getAttribute("userobj") : null;

            if (user == null) {
                // User is not logged in or session expired
                session = req.getSession(true);
                session.setAttribute("failedMsg", "Please login to update your profile");
                resp.sendRedirect("login.jsp");
                return;
            }
            
            if(!user.getPassword().equals(password)) {
            	session.setAttribute("failedMsg", "Incorrect password. Please try again.");
            	resp.sendRedirect("edit_profile.jsp");
            	return;
            }

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f = dao.updateProfile(name, email, phno, password);

            if (f) {
                user.setName(name);
                user.setPhno(phno);
                session.setAttribute("userobj", user);

                session.setAttribute("succMsg", "Profile Updated Successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong");
            }

            resp.sendRedirect("edit_profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
