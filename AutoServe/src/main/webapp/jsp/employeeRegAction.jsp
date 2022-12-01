<%@ page import="Servlets.ConnectionProvider"%>
<%@ page import = "java.sql.*" %>

<%
	System.out.println("registrationAction.jsp executed");
try{
	//Try to get user info
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String position = request.getParameter("position");
	String password = request.getParameter("password");
	
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	
	String empployeeSql_statement = "INSERT INTO employee VALUES(employeeID.nextval,?,?,?,?,?,?)";
	PreparedStatement employee_ps = con.prepareStatement(empployeeSql_statement);
	
	employee_ps.setString(1, firstname);
	employee_ps.setString(2, lastname);
	employee_ps.setString(3, email);
	employee_ps.setString(4, phone);
	employee_ps.setString(5, password);
	employee_ps.setString(6, position);
	
	employee_ps.executeUpdate();
	
	System.out.println("Employee Table Populated Successfully");
	
	if(position.equals("Staff")){
		String staff_statement = "INSERT INTO Staff VALUES(staff_ID.nextval,?,?,?,?,?)";
		PreparedStatement staff_ps = con.prepareStatement(staff_statement);
		
		staff_ps.setString(1, firstname);
		staff_ps.setString(2, lastname);
		staff_ps.setString(3, email);
		staff_ps.setString(4, phone);
		staff_ps.setString(5, password);
		
		
		staff_ps.executeUpdate();
		System.out.println("Staff Table Populated Successfully");

	}
	else if(position.equals("Mechanic")){
		String mechanicstaff_statement = "INSERT INTO Mechanic VALUES(mechanic_ID.nextval,?,?,?,?,?)";
		PreparedStatement mechanicstaff_ps = con.prepareStatement(mechanicstaff_statement);
		
		mechanicstaff_ps.setString(1, firstname);
		mechanicstaff_ps.setString(2, lastname);
		mechanicstaff_ps.setString(3, email);
		mechanicstaff_ps.setString(4, phone);
		mechanicstaff_ps.setString(5, password);

		
		mechanicstaff_ps.executeUpdate();
		System.out.println("Mechanic Table Populated Successfully");

	}
	
	
	response.sendRedirect("../index.jsp");

}catch(Exception e){e.printStackTrace();}

%>