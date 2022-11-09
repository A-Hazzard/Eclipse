<%@ page import = "storePackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Connection con  = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	ResultSet rs = state.executeQuery("SELECT * FROM users WHERE email = '" + email + "' AND mobile = '" + mobile + "' AND securityQuestion = '" + securityQuestion + "' AND answer = '" + answer + "'");

	//checks to see if user exists in table
	while(rs.next()){
		check = 1;
		state.executeUpdate("UPDATE USERS SET password = '" + newPassword+ "' WHERE email = '" + email + "'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
		
	}
	if(check == 0){
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}


} catch(Exception e){
	System.out.println(e);
}
%>
