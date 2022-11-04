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
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverUrl = "jdbc:oracle:thin:@localhost:1521:xe", oraclDriver = "oracle.jdbc.driver.OracleDriver";
		String sqlUserName = "sys as sysdba";
		String sqlUserPwd = "password";
		PrintWriter out = response.getWriter();
			try{
			//load oracle driver
			Class.forName(oraclDriver);
			//load connect to oracle database
			Connection con = DriverManager.getConnection(driverUrl, sqlUserName, sqlUserPwd);
			
			//GET USER INPUT
			String userName = request.getParameter("userName"); //gets the user name
			String pwd = request.getParameter("pwd");//gets the password
			
			//Create sql statement to chec if username and password matches in the database
			String sqlStatement = "SELECT name FROM testLogin WHERE name = ? AND pwd = ?";
			PreparedStatement ps = con.prepareStatement(sqlStatement);
			
			ps.setString(1, userName);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();//execute sql statement
			
			//checks if there was valid data
			if(rs.next()) {
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}//else throw and error
			else {
				out.println("<font color = red size = 13>Invalid user name or paassword<br />");
				out.println("<a href = login.jsp>Try again...<br />");
			}
			
			
			
		} catch(ClassNotFoundException err) {
			//error check if we failed to load the oracle driver
			err.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}//End dopost method

}//end main class
