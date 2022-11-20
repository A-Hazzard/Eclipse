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
		String clientID = "SELECT ID FROM clients WHERE firstName = '" + firstName + "'";
		String sql = "INSERT INTO registrationQ VALUES(regQ_ID.nextval,?,?,?,?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, credentials.getfirstName());
			ps.setString(2, credentials.getlastName());
			ps.setString(3, credentials.getEmail());
			ps.setString(4, credentials.getPhone());
			ps.setString(5, credentials.getAddress());
			ps.setString(5, credentials.getvehicleType());
			ps.setString(6, credentials.getplateNumber());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
}//end RegisterDao class
