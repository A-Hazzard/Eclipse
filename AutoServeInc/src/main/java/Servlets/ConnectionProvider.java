package Servlets;
import java.sql.*;

public class ConnectionProvider {
	public static Connection getConnection() {
		
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1","autoserve", "autoserveinc");
		return con;
	}
	catch(Exception exp) {
		System.out.print(exp);
		return null;
	}
	
	}
}
