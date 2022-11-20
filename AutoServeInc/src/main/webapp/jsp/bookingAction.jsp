<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

	
	System.out.println("(bookingAction.jsp) Form sent");
		
		String firstName = request.getParameter("firstName");
		String vehicleType = request.getParameter("selectVehicleType");
		String plateNumber = request.getParameter("plateNumber");
		
		System.out.println("Info entered:\n" + vehicleType + ",\n" + plateNumber);
		
		String msg = "Data entered successfully. <a href = \"registration.html\">Register again.</a>";
		Connection con = ConnectionProvider.getConnection();

		Statement state = con.createStatement(); 

		ResultSet result = state.executeQuery("SELECT * FROM clients WHERE firstName = '" + firstName + "'");

		String sessionClientID = "";
		while(result.next()){
		    sessionClientID = result.getString(2);//colum firstname as an index of 2
		    session.setAttribute("clientID",sessionClientID);

		}
		System.out.println(firstName + " ID: " + sessionClientID);

			
			PreparedStatement ps = con.prepareStatement("INSERT INTO RegistrationQ VALUES(regQ_ID.nextval,"+11+",?,?)");
			
			ps.setString(1,vehicleType);
			ps.setString(2,plateNumber);
			
			//Will write information to table in database
			ps.executeUpdate();
			
			response.sendRedirect("../index.jsp");
		
		
    	
	
	
	

%>