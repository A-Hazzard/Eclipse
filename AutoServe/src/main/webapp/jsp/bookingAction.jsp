<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

	
	System.out.println("(bookingAction.jsp) Form sent");
		int clientID = request.getParameter("clientID");
		String firstName = request.getParameter("firstName");
		String vehicleType = request.getParameter("selectVehicleType");
		String plateNumber = request.getParameter("plateNumber");
		
		System.out.println("Info entered:\n" + vehicleType + ",\n" + plateNumber);
		
		String msg = "Data entered successfully. <a href = \"registration.html\">Register again.</a>";
		Connection con = ConnectionProvider.getConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO RegistrationQ VALUES(regQ_ID.nextval,"+clientID+",?,?)");
			
			ps.setString(1,vehicleType);
			ps.setString(2,plateNumber);
			
			//Will write information to table in database
			ps.executeUpdate();
			
			response.sendRedirect("../index.jsp");
		
		
    	
	
	
	

%>