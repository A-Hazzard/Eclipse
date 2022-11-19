package Servlets;

public class adminUserInfo {
	protected String firstname, lastname, email, phone, position, password;
	
	public adminUserInfo(String _fname, String _lname, String _email, String _phone, String _position, String _pwd) {
		this.firstname = _fname;
		this.lastname = _lname;
		this.email = _email;
		this.phone = _phone;
		this.password = _pwd;
		this.position = _position;
	}
	
	public String getFirstName() {return this.firstname;}
	
	public String getLastName() {return this.lastname;}
	
	public String getEmail() {return this.email;}
	
	public String getPhone() {return this.phone;}
	
	public String getPosition() {return this.position;}
	
	public String getPassword() {return this.password;}

}
