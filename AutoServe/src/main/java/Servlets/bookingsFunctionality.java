package Servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class bookingsFunctionality {
	private String dbUrl = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
	private String dbUname = "autoserve";
	private String dbPassword = "autoserveinc";
	private String dbDriver = "oracle.jdbc.driver.OracleDriver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//end loadDriver method
	
	public Connection getConnection() {
	    Connection con = null;
		try {
			 con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
        return con;
	}//end getConnection method
	
	public String insert(bookingMembers credentials) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully. <a href = \"registration.html\">Register again.</a>";
		String sql = "INSERT INTO Booking VALUES(?,?,?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, credentials.getName());
			ps.setString(2, credentials.getEmail());
			ps.setString(3, credentials.getPhone());
			ps.setString(4, credentials.getAddress());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
}//end RegisterDao class
