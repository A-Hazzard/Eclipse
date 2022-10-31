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



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		
				try{
		// TODO Auto-generated method stub
	    PrintWriter out = response.getWriter();
	    response.setContentType("text/html");

		//Load JDBC driver
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", "password123");
		Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe", "sys as sysdba", "password");
		
			//Information provided by the User
			String uname = request.getParameter("userName");
			String upass = request.getParameter("userPassword");

			//check to see if the information provided exists in the database
			PreparedStatement ps = con.prepareStatement(
				"SELECT userName FROM login WHERE userName = ? AND userPassword = ?");
				ps.setString(1, uname);
				ps.setString(2, upass);
				ResultSet rs = ps.executeQuery();

				//if login successful the user routed to login.jsp or if not an error.jsp
				if(rs.next()){
					RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
					rd.forward(request, response);
				}
				else{
					out.println("<font color = red size = 20> Incorrect Username or Password!! <br>");
					out.print("<a href = login.jsp> TRY AGAIN </a>");
				}

			} catch (ClassNotFoundException exp){
				exp.printStackTrace();
			} catch (SQLException e){
				//TODO Auto-generated catch block
				e.printStackTrace();
			}


	}

}
