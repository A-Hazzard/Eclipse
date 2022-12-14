<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter ("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try{
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	ResultSet result = state.executeQuery("select * from clients where email = '" + email + "' and securityQuestion = '" + securityQuestion + "' and answer = '" + answer + "'");
	while(result.next())
	{
		check = 1;
		state.executeUpdate("update clients set password = '" + newPassword + "' where email = '"+ email +"'");
		response.sendRedirect ("login.jsp?msg=validInfo");
	}
	if (check == 0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalidInfo");
	}
}	
catch (Exception exp){
	System.out.print(exp);
}
%>