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
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO registrationq VALUES("+clientID+",?,?,?,?)");
			
			ps.setString(1,vehicleType);
			ps.setString(2,plateNumber);
			ps.setString(3,issues);
			ps.setString(4,category);

			
			//Will write information to table in database
			ps.executeUpdate();
			System.out.println("(bookingAction.jsp) Form sent");

			response.sendRedirect("../pages/vehicleRegistration.jsp");
		

}catch(NumberFormatException nfe){
    System.out.println("NumberFormat Exception: invalid input string");

}catch(SQLException sqlExp){
	System.out.println(sqlExp);
}
	
    	
	
	
	

%>