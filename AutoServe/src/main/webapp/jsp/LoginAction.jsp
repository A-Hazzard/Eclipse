<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>


<%

		String loginEmail = request.getParameter("email");
		String loginPassword = request.getParameter("password");
	
		System.out.println("Stage 2) LoginAction executed\n");
		
	//if admin logs in, redirect to jobsPage	
	 if(loginEmail.equals("winston.fields@admin.autoserve.com")&& loginPassword.equals("winstonfields")){
		 Connection con = ConnectionProvider.getConnection();
			Statement state = con.createStatement(); 
		 ResultSet getFirstName = state.executeQuery("select * from person where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
		 
		 while(getFirstName.next()){
			 String sessionFname = getFirstName.getString(2);
			 
			 session.setAttribute("firstName", sessionFname);
			 session.setAttribute("email",loginEmail);
		 }
		 
	      
	      //redirects admin to jobs page
	      response.sendRedirect("../admin/admin.jsp");
	      System.out.println("Logged in as Winston Fields(ADMIN)");
	  }
	  else{
	      boolean test = false;
	
		try{
			Connection con = ConnectionProvider.getConnection();
			Statement state = con.createStatement();
			ResultSet result = state.executeQuery("select * from person where email = '" + loginEmail +"' and password = '"+ loginPassword + "'" );
			
		
			while(result.next()){
			   	test = true;
			   	
			   	//fetch the column name by their index from the person table
			    String sessionFname = result.getString(2);//colum firstname as an index of 2
				String sessionLname = result.getString(3);
				String sessionEmail = result.getString(4);
				String sessionPhone = result.getString(5);
			
				//set attributes to share vairable to another file to access
				session.setAttribute("FirstName",sessionFname);
				session.setAttribute("LastName",sessionLname);
				session.setAttribute("Fmail",sessionEmail);
				session.setAttribute("Phone",sessionPhone);
				
				//redirects client to home page
			    response.sendRedirect("../index.jsp");
			}
		if(test == false) response.sendRedirect("../index.jsp");
		
		}//end try block
		catch(SQLException sqlExp){
			System.out.println("Problem executing SQL Query");
		}
	  
	  }
%>