<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if (email.equals("admin@gmail.com") && password.equals("admin")){
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
}
else 
{
	boolean loginSuccess = false;
	
try {
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	ResultSet result = state.executeQuery("select * from users where email ='" + email + "' and password = '" + password + "'");
			
	//checloginSuccesss to see if user exists in table. If yes then load home.jsp, if not load login.jsp
	while(result.next())
	{
		loginSuccess = true;
		session.setAttribute("email",email);
		response.sendRedirect("home.jsp");
	}
	if(loginSuccess == false)
		response.sendRedirect("login.jsp?msg=notexist");
}	
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>