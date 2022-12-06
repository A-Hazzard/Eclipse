<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%


try{
		int clientID = Integer.parseInt(request.getParameter("userID_input").trim());
		String firstName = request.getParameter("firstName").trim();
		String vehicleType = request.getParameter("selectVehicleType").trim();
		String plateNumber = request.getParameter("plateNumber").trim();
		String issues = request.getParameter("issues").trim();
		String category = request.getParameter("category").trim();
		
		System.out.println("Info entered:\n" + vehicleType + ",\n" + plateNumber);
		
		String msg = "Data entered successfully. <a href = \"registration.html\">Register again.</a>";
		Connection con = ConnectionProvider.getConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO registrationq VALUES("+clientID+",?,?,?,?, 'Pending')");
			PreparedStatement ps2 = con.prepareStatement("INSERT INTO pendingClients VALUES("+clientID+",?,?,?,?, 'Pending')");

			ps.setString(1,vehicleType);
			ps.setString(2,plateNumber);
			ps.setString(3,issues);
			ps.setString(4,category);
			
			ps2.setString(1,vehicleType);
			ps2.setString(2,plateNumber);
			ps2.setString(3,issues);
			ps2.setString(4,category);

			
			//Will write information to table in database
			ps.executeUpdate();
			ps2.executeUpdate();
			System.out.println("(bookingAction.jsp) Form sent");

			response.sendRedirect("../pages/clientPendingJobs.jsp");
		

}catch(NumberFormatException nfe){
    System.out.println("NumberFormat Exception: invalid input string");

}catch(SQLException sqlExp){
	System.out.println(sqlExp);
}
	
    	
	
	
	

%>