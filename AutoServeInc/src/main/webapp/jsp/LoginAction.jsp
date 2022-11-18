<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>



<%
	String Email = request.getParameter("email");
	String password = request.getParameter("password");
	System.out.println("hi");
 if("admin@gmail.com".equals(Email)&& "admin".equals(password)){
      session.setAttribute("email",Email);
      //redirects admin to jobs page
      response.sendRedirect("jobsPages.html");
  }
  else{
      boolean test = false;

	try{
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery("select * from person where email = '" + Email +"' and password = '"+ password + "'" );
		
	
		while(result.next()){
		   	test = true;
		   	
		    String fname=result.getString(1);
			String lname=result.getString(2);
			String email = result.getString(4);
			String phone = result.getString(5);
		
			session.setAttribute("FirstName",fname);
			session.setAttribute("LastName",lname);
			session.setAttribute("Fmail",email);
			session.setAttribute("Phone",phone);
			//redirects client to home page
		    response.sendRedirect("index.jsp");
		}
	if(test == false) response.sendRedirect("index.html");
	
	}//end try block
	catch(Exception e){ System.out.print(e); }
  
  }
%>