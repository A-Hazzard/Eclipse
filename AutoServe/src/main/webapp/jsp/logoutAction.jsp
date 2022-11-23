<%
try{
	
	Object sessionFname = session.getAttribute("FirstName");
	Object sessionLname = session.getAttribute("LastName");
	String firstName = String.valueOf(sessionFname);
	int firstNameLength= firstName.length();
	System.out.println("Length of first name :" + firstNameLength);
	System.out.println("logged out of user: " + sessionFname + " " + sessionLname + "\n--------------------");
	session.invalidate();
	response.sendRedirect("../index.jsp");
}catch(Exception e){
	System.out.println("Error logging out");
}
%>