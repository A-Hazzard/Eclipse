<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%



		int clientID = Integer.parseInt(request.getParameter("userID_input").trim());
		int staffID = Integer.parseInt(request.getParameter("staffID_input").trim());
		int mechID = Integer.parseInt(request.getParameter("mechID").trim());
		String vehicleType = request.getParameter("selectVehicleType");
		String plateNumber = request.getParameter("plateNumber");
		
		System.out.println("(registeredVehicles.jsp)Info entered in registered vechile table:\nClient ID: " + clientID + "\nvehicleType " + vehicleType + "\nPlate number" + plateNumber + "\nMechanic ID: " + mechID);
		
		String msg = "(registeredVehicles.jsp) Data entered successfully. <a href = \"registration.html\">Register again.</a>";
	try{	
		Connection con = ConnectionProvider.getConnection();
			String sql = "INSERT INTO registered_vehicles VALUES(reg_ID.nextval,?,?,?,?,?)";
			PreparedStatement ps;
			ps = con.prepareStatement(sql);
				ps.setInt(1, clientID);
				ps.setString(2, vehicleType);
				ps.setString(3, plateNumber);
				ps.setInt(4, staffID);
				ps.setInt(5, mechID);
			//Will write information to table in database
			ps.executeUpdate();
			System.out.println("(registeredVehicle.jsp) Form sent");

			response.sendRedirect("../index.jsp");
		
		} catch (SQLException e) {
			e.printStackTrace();
		}

	
    	
	
	
	

%>