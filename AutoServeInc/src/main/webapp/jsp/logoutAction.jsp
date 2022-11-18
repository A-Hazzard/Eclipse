<%
try{
	
	Object sessionFname = session.getAttribute("FirstName");
	Object sessionLname = session.getAttribute("LastName");

	System.out.println("logged out of user: " + sessionFname + " " + sessionLname);
	session.invalidate();
	response.sendRedirect("../index.jsp");
}catch(Exception e){
	System.out.println("Error logging out");
}
%>