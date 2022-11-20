package Servlets;

public class bookingMembers {
	protected String firstName, lastName, email, phone, address, vehicleType, plateNumber;
	
	bookingMembers(String firstName,String lastName, String email, String phone, String address, String vehicleType, String plateNumber) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.vehicleType = vehicleType;
		this.plateNumber = plateNumber;
	
	}
	
	public String getfirstName() {return this.firstName;}
	
	public String getlastName() {return this.lastName;}
	
	public String getEmail() {return this.email;}
	
	public String getPhone() {return this.phone;}
	
	public String getAddress() {return this.address;}
	
	public String getvehicleType() {return this.vehicleType;}
	
	public String getplateNumber() {return this.plateNumber;}



}
