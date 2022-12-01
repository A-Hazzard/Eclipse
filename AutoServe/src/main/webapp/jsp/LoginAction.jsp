<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>


<%

		String loginEmail = request.getParameter("email");
		String loginPassword = request.getParameter("password");
	
		System.out.println("Stage 2) LoginAction executed(LoginAction.jsp)\n");
		
	//checks to if user is admin
	 if(loginEmail.contains("@admin")&& loginPassword.equals("admin")){
		 Connection con = ConnectionProvider.getConnection();
			Statement state = con.createStatement(); 
		 ResultSet result = state.executeQuery("select * from employee where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
		 int sessionID = 0;
		 while(result.next()){
				//fetch the column name by their index from the person table
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
		 }
		 System.out.println("Your ID = " + sessionID);
	      
	      //redirects admin to jobs page
	      response.sendRedirect("../index.jsp");
	      System.out.println("Logged in as Winston Fields(ADMIN)(LoginAction.jsp)");
			System.out.println("-------------\nREDIRECTED TO ADMIN PAGE\n-------------");

	  }
	
	
	
	
	
	
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
				 while(result.next()){
						//fetch the column name by their index from the person table
					    			   	test = true;

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
						
						//redirects client to home page
					    response.sendRedirect("../index.jsp");
				 }
				 
					
				 System.out.println("Your ID = " + sessionID);

			if(test == false) {
				System.out.println("Incorrect username or password(LoginAction.jsp)");
				response.sendRedirect("../index.jsp");
				}//end if
			}//end try
			catch(SQLException sqlExp){
				System.out.println("Problem executing SQL Query(LoginAction.jsp)");
			}
	 }//end else if
	 

		//checks to see if user is staffmember
	 else if(loginEmail.contains("@mechanic"))
	 {
		 System.out.println("Staff member logged in(LoginAction.jsp)");
		      boolean test = false;
		
			try{
				Connection con = ConnectionProvider.getConnection();
				Statement state = con.createStatement();
				ResultSet result = state.executeQuery("select * from mechanic where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
				
				System.out.println("Mechanic Logged in(LoginAction.jsp)");
				 int sessionID = 0;
				 while(result.next()){
						//fetch the column name by their index from the person table
					    			   	test = true;

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
						
						//redirects client to home page
					    response.sendRedirect("../index.jsp");
				 }
				 
					
				 System.out.println("Your ID = " + sessionID);

			if(test == false) {
				System.out.println("Incorrect username or password(LoginAction.jsp)");
				response.sendRedirect("../index.jsp");
				}//end if
			}//end try
			catch(SQLException sqlExp){
				System.out.println("Problem executing SQL Query(LoginAction.jsp)");
			}
	 }//end else if
	 
	 //any email that doesn't contain @autoserve/@admin....Clients accounts
	  else{
	      boolean test = false;
		try{
			Connection con = ConnectionProvider.getConnection();
			Statement state = con.createStatement();
			ResultSet result = state.executeQuery("select * from clients where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
			
			System.out.println("Client member Logged in(LoginAction.jsp)");
			 
			 int sessionID = 0;
			 while(result.next()){
					//fetch the column name by their index from the person table
				    test = true;

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
					
					//redirects client to home page
				    response.sendRedirect("../index.jsp");
			 }
			 
			 System.out.println("Your ID = " + sessionID);

		if(test == false) {
			System.out.println("Incorrect username or password(LoginAction.jsp)");
			response.sendRedirect("../index.jsp");
		}
		
		}//end try block
		catch(SQLException sqlExp){
			System.out.println("Problem executing SQL Query(LoginAction.jsp)");
		}
	  
	  }
%>