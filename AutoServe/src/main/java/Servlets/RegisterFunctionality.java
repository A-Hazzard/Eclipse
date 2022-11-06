package Servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterFunctionality {
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
	
	public String insert(userInfo credentials) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully.";
		String sql = "INSERT INTO users VALUES(ID.nextval,?,?,?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, credentials.getFirstName());
			ps.setString(2, credentials.getLastName());
			ps.setString(3, credentials.getEmail());
			ps.setString(4, credentials.getPassword());
		
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
}//end RegisterDao class
