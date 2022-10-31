package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ArithmaticServlet
 */
@WebServlet("/ArithmaticServlet")
public class ArithmaticServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num1 = Integer.parseInt(request.getParameter("num1"));//concerts string into int
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int sum = addition(num1, num2);
		//Logs the value of sum for debugging
		System.out.println("LOGGING VALUES:\n" + num1 + " + " + num2 + " = " + sum);
		
		//Respond to the value of sum back to the user
		PrintWriter out = response.getWriter();
		out.print("Answer:\n" + num1 + " + " + num2 + " = " + sum);

		request.setAttribute("sum", sum);
		RequestDispatcher rd = request.getRequestDispatcher("sq");
		rd.forward(request, response);
	
	}

	protected int addition(int num1, int num2) {
		return num1 + num2;
	}
}//end main class
