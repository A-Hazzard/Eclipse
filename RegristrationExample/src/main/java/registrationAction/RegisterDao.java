package registrationAction;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {
	private String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbUname = "sys as sysdba";
	private String dbPassword = "password";
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
	
	public String insert(Member member) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Data entered successfully.";
		String sql = "INSERT INTO member VALUES(?,?,?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getUname());
			ps.setString(2, member.getPassword());
			ps.setString(3, member.getEmail());
			ps.setString(4, member.getPhone());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
}//end RegisterDao class
