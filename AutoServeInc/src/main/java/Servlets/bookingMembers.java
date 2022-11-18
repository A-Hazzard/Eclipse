package Servlets;

public class bookingMembers {
	protected String name, email, phone, address;
	
	bookingMembers(String name, String email, String phone, String address) {
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
	
	}
	
	public String getName() {return this.name;}
	
	public String getEmail() {return this.email;}
	
	public String getPhone() {return this.phone;}
	
	public String getAddress() {return this.address;}

}
