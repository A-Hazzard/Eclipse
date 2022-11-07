package Servlets;

public class userInfo {
	protected String firstname, lastname, email, phone, password, position;
	
	public userInfo(String _fname, String _lname, String _email, String _phone, String _pwd, String _position) {
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
	
	public String getPassword() {return this.password;}
	
	public String getPosition() {return this.position;}
}
