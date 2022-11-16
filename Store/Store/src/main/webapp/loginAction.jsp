<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

if ("admin@gmail.com".equals(email) && "admin".equals(password)){
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
}
else 
{
	int k = 0;
	
try {
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	ResultSet result = state.executeQuery("select * from users where email ='" + email + "' and password = '" + password + "'");
			
	//checks to see if user exists in table. If yes then load home.jsp, if not load login.jsp
	while(result.next())
	{
		k = 1;
		session.setAttribute("email",email);
		response.sendRedirect("home.jsp");
	}
	if( k == 0)
		response.sendRedirect("login.jsp?msg=notexist");
}	
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	}
}
%>