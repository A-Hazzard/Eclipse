package Servlets;
import java.sql.*;
import java.sql.DriverManager;


public class ConnectionProvider {
	public static Connection getConnection() {
		
	try {
		//Driver used for oracle database
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//Information is to be changed according to yours
		String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String connectionName = "autoserve";
		String connectionPassword = "autoserveinc";
		
		//Enters information to connect to database
		Connection con = DriverManager.getConnection(url, connectionName, connectionPassword);
		System.out.println("connected to " + connectionName);
		return con;
	}
	catch(Exception exp) {
		System.out.print(exp);
		return null;
	}
	
	}
}
