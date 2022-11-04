package Servlets;

public class userInfo {
	protected String firstname, lastname, email, password;
	
	public userInfo(String fname, String lname, String _email, String pwd) {
		this.firstname = fname;
		this.lastname = lname;
		this.email = _email;
		this.password = pwd;
	}
	
	public String getFirstName() {return this.firstname;}
	
	public String getLastName() {return this.lastname;}
	
	public String getEmail() {return this.email;}
	
	public String getPassword() {return this.password;}
}
