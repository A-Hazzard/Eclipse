<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String mobile = request.getParameter ("mobile");
String securityQuestion = request.getParameter("securityQeustion");
String answer = request.getParameter ("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	ResultSet result = state.executeQuery("select * from users where email = '" + email + "' and mobile = '" + mobile + "' and securityQuestion = '" + securityQuestion + "'and answer = '" + answer + "'");
	while(result.next())
	{
		check = 1;
		state.executeUpdate("update users set password = '" + newPassword + "' where email = '"+ email +"'");
		response.sendRedirect ("forgotPassword.jsp?msg=done");
	}
	if (check == 0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}	
catch (Exception exp){
	System.out.print(exp);
}
%>