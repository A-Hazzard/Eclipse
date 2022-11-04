package Servlets;

import java.io.*;
import java.util.TimerTask;

import javax.management.timer.Timer;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out = response.getWriter();
		try {
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			userInfo uInfo = new userInfo(firstname, lastname, email, password);
			
	    	out.println("Gathered information into our java servlet, please wait...");

		} catch (Exception e) {
			out.println("Failed to aceept input");
		}
		
		
		
		
			
	}

}
