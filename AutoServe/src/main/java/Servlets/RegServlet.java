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
			//Try to get user info
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			//String position = request.getParameter("position");
			String password = request.getParameter("password");
			

			//put user info into a class to process
			userInfo credentials = new userInfo(firstname, lastname, email, phone, password);
			
	    	out.println("Gathered information into our java servlet, please wait...");
	    	
	    	RegisterFunctionality registration = new RegisterFunctionality();
			String result = registration.insert(credentials);
			response.getWriter().print(result);
	    	
		} catch (Exception e) {
			out.println("Failed to aceept input");
		}
		

			
	}

}
