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
	//String position = request.getParameter("position");
	String password = request.getParameter("password");
	
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	
	String sql = "INSERT INTO Clients VALUES(client_ID.nextval,?,?,?,?,?,'Client')";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, email);
	ps.setString(4, phone);
	ps.setString(5, password);
	
	ps.executeUpdate();
	
	System.out.println("Registered Successfully");
	
	response.sendRedirect("../index.jsp");

}catch(Exception e){e.printStackTrace();}

%>