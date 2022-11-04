<%@ page import = "storePackage.ConnectionProvider" %>
<%@ page import = "java.sql.* " %>

<%

String email= request.getParameter("email");
String password = request.getParameter("password");
if("email".equals(email) && "admin".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
} else {
	int k = 0;


	try{
		
		Connection con  = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		ResultSet rs = state.executeQuery("SELECT * FROM users WHERE EMAIL = '" + email + "' AND password = '" + password + "' ");
		
		//checks to see if user exists in table
		while(rs.next()){
			k = 1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
			
		}
		if(k == 0){
			response.sendRedirect("login.jsp?msg=notexist");
		}
	
	} catch(Exception e){
		System.out.println(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}
}
%>
