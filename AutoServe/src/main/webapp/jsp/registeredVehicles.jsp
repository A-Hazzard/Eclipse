<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%



		int clientID = Integer.parseInt(request.getParameter("userID_input").trim());
		String staffEmail = request.getParameter("staffEmail_input").trim();
		String mechEmail = request.getParameter("mechEmail").trim();
		String vehicleType = request.getParameter("selectVehicleType").trim();
		String plateNumber = request.getParameter("plateNumber").trim();
		
		System.out.println("(registeredVehicles.jsp)Info entered in registered vechile table:\nClient ID: " + clientID + "\nvehicleType " + vehicleType + "\nPlate number" + plateNumber + "\nMechanic Email: " + mechEmail);
		
	try{	
		Connection con = ConnectionProvider.getConnection();
			String sql = "INSERT INTO registered_vehicles VALUES(regID.nextval,?,?,?,?,?)";
			PreparedStatement ps;
			ps = con.prepareStatement(sql);
				ps.setInt(1, clientID);
				ps.setString(2, vehicleType);
				ps.setString(3, plateNumber);
				ps.setString(4, staffEmail);
				ps.setString(5, mechEmail);
			//Will write information to table in database
			ps.executeUpdate();
			System.out.println("(registeredVehicle.jsp) Form sent");

			response.sendRedirect("../pages/jobApplications.jsp");
			String msg = "(registeredVehicles.jsp) Data entered successfully. <a href = \"registration.html\">Register again.</a>";

		} catch (SQLException e) {
			e.printStackTrace();
		}

	
    	
	
	
	

%>