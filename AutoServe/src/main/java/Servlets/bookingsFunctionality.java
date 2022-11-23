package Servlets;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
public class bookingsFunctionality extends ConnectionProvider {
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
	
	
	public String insert(bookingMembers credentials) {
		loadDriver(dbDriver);
		 Connection con = ConnectionProvider.getConnection();
		

		String result = "Data entered successfully. <a href = \"registration.html\">Register again.</a>";
		String clientID = "SELECT ID FROM clients WHERE firstName = '" + credentials.getfirstName() + "'";
		String sql = "INSERT INTO RegistrationQ VALUES(regQ_ID.nextval,"+clientID+",?,?)";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			
			//ps.setString(1, credentials.getfirstName());
			/*ps.setString(2, credentials.getlastName());
			ps.setString(3, credentials.getEmail());
			ps.setString(4, credentials.getPhone());
			ps.setString(5, credentials.getAddress());*/
			ps.setString(1, credentials.getvehicleType());
			ps.setString(2, credentials.getplateNumber());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Data not entered";
		}
		return result;
	}
	
}//end RegisterDao class
