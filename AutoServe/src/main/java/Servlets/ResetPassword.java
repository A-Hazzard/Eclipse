package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String SQLuserName = "autoserve";
		String SQLuserPwd = "autoserveinc";
		PrintWriter out = response.getWriter();
	try {
		
		String email = request.getParameter("email");			
		String pwd = request.getParameter("password");		//Logs the user info for debugging
		System.out.println("\nEmail: " + email);
		
		//load oracle jdbc driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//get connection to sql database
		Connection con = DriverManager.getConnection(jdbcURL, SQLuserName, SQLuserPwd);
		System.out.println("Connection established......");
		
		String sqlStatement = "UPDATE users SET password = ? WHERE email = ?";
		
		PreparedStatement ps = con.prepareStatement(sqlStatement);
		ps.setString(1, pwd);//likewise for the password
		ps.setString(2, email);//set's the first question mark in the sql statement to the user email
		
		ResultSet rs = ps.executeQuery();
		
		//checks if there is a record
		if(rs.next()) {
			RequestDispatcher rd = request.getRequestDispatcher("passwordRest.jsp");
			rd.forward(request, response);
		}
		else
			out.println("<font color = red size = 18>Email Not Found!!<br/>");
			out.println("<a href = login.jsp>TRY AGAIN!!</a>");
		
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	} catch(SQLException e) {
		e.printStackTrace();
	}
		
		
		
	}

}
