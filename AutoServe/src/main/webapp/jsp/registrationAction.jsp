<%@ page import="Servlets.ConnectionProvider"%>
<%@ page import = "java.sql.*" %>

<%
	System.out.println("registrationAction.jsp executed");
String firstname = request.getParameter("firstname").trim();
String lastname = request.getParameter("lastname").trim();
String email = request.getParameter("email").trim();
String phone = request.getParameter("phone").trim();
//String position = request.getParameter("position");
String password = request.getParameter("password").trim();
String securityQuestion = request.getParameter("securityQuestion").trim();
String answer = request.getParameter("answer").trim();
try{
	boolean signUp = true;
	//Try to get user info
	
	
	Connection con = ConnectionProvider.getConnection();
	Statement state = con.createStatement();
	
	String sql = "INSERT INTO Clients VALUES(client_ID.nextval,?,?,?,?,?,?,?,'Client')";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, email);
	ps.setString(4, phone);
	ps.setString(5, securityQuestion);
	ps.setString(6, answer);
	ps.setString(7, password);
	
	ps.executeUpdate();
	
	System.out.println("Registered Successfully");
	
	
	//Auto Login
	signUp = false;
	if(signUp == false){
		System.out.println("sign up = false");
		try{
			Connection con2 = ConnectionProvider.getConnection();
			Statement state2 = con2.createStatement();
			ResultSet result2 = state.executeQuery("select * from clients where email = '" + email +"' and password = '"+ password + "'" );
			
			System.out.println("(RegistrationAction.jsp)Clients auto login Logged in(LoginAction.jsp)");
			 int sessionID = 0;
			 
			 boolean loginSuccess = false;
			 while(result2.next()){
					//fetch the column name by their index from the person table
					loginSuccess = true;
				    sessionID = result2.getInt(1);
					String sessionFname = result2.getString(2);//colum firstname as an index of 2
					String sessionLname = result2.getString(3);
					String sessionEmail = result2.getString(4);
					String sessionPhone = result2.getString(5);
					String sessionPosition = result2.getString(7);
				
					//set attributes to share vairable to another file to access
					session.setAttribute("UserID", sessionID);
					session.setAttribute("FirstName",sessionFname);
					session.setAttribute("LastName",sessionLname);
					session.setAttribute("Email",sessionEmail);
					session.setAttribute("Phone",sessionPhone);
					session.setAttribute("Position", sessionPosition);
					 response.sendRedirect("../index.jsp?msg=validLogin");

					
			 }
			 if(loginSuccess == false){
				 	response.sendRedirect("../login.jsp?msg=invalidLogin");
			 		System.out.println("Invalid Login Credentials");
			 }
		 
		 }
		catch(SQLException exp){
			exp.printStackTrace();
			response.sendRedirect("../login.jsp?msg=error");
		}
		  }//End admin logic
	
	

}catch(Exception e){e.printStackTrace();}

%>