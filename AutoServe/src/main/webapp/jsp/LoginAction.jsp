<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>


<%

		String loginEmail = request.getParameter("email");
		String loginPassword = request.getParameter("password");
	
		System.out.println("Stage 2) LoginAction executed(LoginAction.jsp)\n");
	
	//checks to if user is admin
	 if(loginEmail.contains("@admin")&& loginPassword.equals("admin")){
try{	 Connection con = ConnectionProvider.getConnection();
		 Statement state = con.createStatement(); 
		 ResultSet result = state.executeQuery("select * from employee where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
		 int sessionID = 0;
		 
		 boolean loginSuccess = false;
		 while(result.next()){
				//fetch the column name by their index from the person table
				loginSuccess = true;
			    sessionID = result.getInt(1);
				String sessionFname = result.getString(2);//colum firstname as an index of 2
				String sessionLname = result.getString(3);
				String sessionEmail = result.getString(4);
				String sessionPhone = result.getString(5);
				String sessionPosition = result.getString(7);
			
				//set attributes to share vairable to another file to access
				session.setAttribute("UserID", sessionID);
				session.setAttribute("FirstName",sessionFname);
				session.setAttribute("LastName",sessionLname);
				session.setAttribute("Email",sessionEmail);
				session.setAttribute("Phone",sessionPhone);
				session.setAttribute("Position", sessionPosition);
				
				 response.sendRedirect("../index.jsp?msg=validLogin");
			      System.out.println("Logged in as Winston Fields(ADMIN)(LoginAction.jsp)");
					System.out.println("-------------\nREDIRECTED TO ADMIN PAGE\n-------------");

				
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
	
	
	
	
	
	
		//checks to see if user is staffmember
	 else if(loginEmail.contains("@staff"))
	 {
		 System.out.println("Staff member logged in(LoginAction.jsp)");
		      boolean test = false;
		
			try{
				Connection con = ConnectionProvider.getConnection();
				Statement state = con.createStatement();
				ResultSet result = state.executeQuery("select * from staff where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
				
				System.out.println("Staff member Logged in(LoginAction.jsp)");
				 int sessionID = 0;
				 
				 boolean loginSuccess = false;
				 while(result.next()){
						//fetch the column name by their index from the person table
						loginSuccess = true;
					    sessionID = result.getInt(1);
						String sessionFname = result.getString(2);//colum firstname as an index of 2
						String sessionLname = result.getString(3);
						String sessionEmail = result.getString(4);
						String sessionPhone = result.getString(5);
						String sessionPosition = result.getString(7);
					
						//set attributes to share vairable to another file to access
						session.setAttribute("UserID", sessionID);
						session.setAttribute("FirstName",sessionFname);
						session.setAttribute("LastName",sessionLname);
						session.setAttribute("Email",sessionEmail);
						session.setAttribute("Phone",sessionPhone);
						session.setAttribute("Position", sessionPosition);
						
						 response.sendRedirect("../index.jsp?msg=invalidLogin");
					      System.out.println("Logged in as Winston Fields(ADMIN)(LoginAction.jsp)");
							System.out.println("-------------\nREDIRECTED TO ADMIN PAGE\n-------------");

						
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
	 

		//checks to see if user is staffmember
	 else if(loginEmail.contains("@mechanic"))
	 {
		 System.out.println("Mechanic logged in(LoginAction.jsp)");
		      boolean test = false;
		
			try{
				Connection con = ConnectionProvider.getConnection();
				Statement state = con.createStatement();
				ResultSet result = state.executeQuery("select * from mechanic where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
				
				System.out.println("Mechanic Logged in(LoginAction.jsp)");
				 int sessionID = 0;
				 
				 boolean loginSuccess = false;
				 while(result.next()){
						//fetch the column name by their index from the person table
						loginSuccess = true;
					    sessionID = result.getInt(1);
						String sessionFname = result.getString(2);//colum firstname as an index of 2
						String sessionLname = result.getString(3);
						String sessionEmail = result.getString(4);
						String sessionPhone = result.getString(5);
						String sessionPosition = result.getString(7);
					
						//set attributes to share vairable to another file to access
						session.setAttribute("UserID", sessionID);
						session.setAttribute("FirstName",sessionFname);
						session.setAttribute("LastName",sessionLname);
						session.setAttribute("Email",sessionEmail);
						session.setAttribute("Phone",sessionPhone);
						session.setAttribute("Position", sessionPosition);
						
						 response.sendRedirect("../index.jsp?msg=invalidLogin");
					      System.out.println("Logged in as Winston Fields(ADMIN)(LoginAction.jsp)");
							System.out.println("-------------\nREDIRECTED TO ADMIN PAGE\n-------------");

						
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
	 
	 //any email that doesn't contain @autoserve/@admin....Clients accounts
	  else{
	      boolean test = false;
		try{
			Connection con = ConnectionProvider.getConnection();
			Statement state = con.createStatement();
			ResultSet result = state.executeQuery("select * from clients where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
			
			System.out.println("Client member Logged in(LoginAction.jsp)");
			 
			 int sessionID = 0;
			 
			 boolean loginSuccess = false;
			 while(result.next()){
					//fetch the column name by their index from the person table
					loginSuccess = true;
				    sessionID = result.getInt(1);
					String sessionFname = result.getString(2);//colum firstname as an index of 2
					String sessionLname = result.getString(3);
					String sessionEmail = result.getString(4);
					String sessionPhone = result.getString(5);
					String sessionPosition = result.getString(7);
				
					//set attributes to share vairable to another file to access
					session.setAttribute("UserID", sessionID);
					session.setAttribute("FirstName",sessionFname);
					session.setAttribute("LastName",sessionLname);
					session.setAttribute("Email",sessionEmail);
					session.setAttribute("Phone",sessionPhone);
					session.setAttribute("Position", sessionPosition);
					
					 response.sendRedirect("../index.jsp?msg=invalidLogin");
				      System.out.println("Logged in as Winston Fields(ADMIN)(LoginAction.jsp)");
						System.out.println("-------------\nREDIRECTED TO ADMIN PAGE\n-------------");

					
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
%>