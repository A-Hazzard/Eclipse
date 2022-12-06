<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%


		Connection con = ConnectionProvider.getConnection();

		int clientID = Integer.parseInt(request.getParameter("userID_input").trim());
		String staffEmail = request.getParameter("staffEmail_input").trim();
		String mechEmail = request.getParameter("mechEmail").trim();
		String vehicleType = request.getParameter("selectVehicleType").trim();
		String plateNumber = request.getParameter("plateNumber").trim();
		String issues = request.getParameter("issues_input").trim();
		String category = request.getParameter("category_input").trim();
		
		System.out.println("(registeredVehicles.jsp)Info entered in registered vechile table:\nClient ID: " + clientID + "\nvehicleType " + vehicleType + "\nPlate number" + plateNumber + "\nMechanic Email: " + mechEmail);
		
	try{	
			String sql = "INSERT INTO registered_vehicles VALUES(regID.nextval,?,?,?,?,?,?,?)";
			String sql1 = "INSERT INTO jobs VALUES(?,?,?,?,?,?,?,'Pending')";

			PreparedStatement ps;
			PreparedStatement ps1;
			ps = con.prepareStatement(sql);
				ps.setInt(1, clientID);
				ps.setString(2, vehicleType);
				ps.setString(3, plateNumber);
				ps.setString(4, issues);
				ps.setString(5, staffEmail);
				ps.setString(6, mechEmail);
				ps.setString(7, category);
			//Will write information to table in database
			
			ps.executeUpdate();
			ps1 = con.prepareStatement(sql1);
				ps1.setInt(1, clientID);
				ps1.setString(2, mechEmail);
				ps1.setString(3, staffEmail);
				ps1.setString(4, vehicleType);
				ps1.setString(5, plateNumber);
				ps1.setString(6, issues);
				ps1.setString(7, category);
			ps1.executeUpdate();


			
			System.out.println("(jobsAction.jsp) Form sent");

			String msg = "(jobsAction.jsp) Data entered successfully. <a href = \"registration.html\">Register again.</a>";

			if(category.equals("Engine")){
				System.out.println("Engine table");
				String sql2 = "INSERT INTO engineRepair VALUES(?,?,?,?,?,?,'Pending')";
				PreparedStatement ps2;
				ps2 = con.prepareStatement(sql2);
					ps2.setInt(1, clientID);
					ps2.setString(2, mechEmail);
					ps2.setString(3, staffEmail);
					ps2.setString(4, vehicleType);
					ps2.setString(5, plateNumber);
					ps2.setString(6, issues);
			

				//Will write information to table in database
				ps2.executeUpdate();
				System.out.println("(jobsAction.jsp) Form sent");

				String msg2 = "(jobsAction.jsp) Data entered successfully.";

			}
			else if(category.equals("Breaks")){
				System.out.println("Engine table");
				String sql2 = "INSERT INTO breakRepair VALUES(?,?,?,?,?,?,'Pending')";
				PreparedStatement ps2;
				ps2 = con.prepareStatement(sql2);
					ps2.setInt(1, clientID);
					ps2.setString(2, mechEmail);
					ps2.setString(3, staffEmail);
					ps2.setString(4, vehicleType);
					ps2.setString(5, plateNumber);
					ps2.setString(6, issues);
			

				//Will write information to table in database
				ps2.executeUpdate();
				System.out.println("(jobsAction.jsp) Form sent");

				String msg2 = "(jobsAction.jsp) Data entered successfully.";

			}
			else if(category.equals("Clutch")){
				System.out.println("Clutch table");
				String sql2 = "INSERT INTO clutchRepair VALUES(?,?,?,?,?,?,'Pending')";
				PreparedStatement ps2;
				ps2 = con.prepareStatement(sql2);
					ps2.setInt(1, clientID);
					ps2.setString(2, mechEmail);
					ps2.setString(3, staffEmail);
					ps2.setString(4, vehicleType);
					ps2.setString(5, plateNumber);
					ps2.setString(6, issues);
			

				//Will write information to table in database
				ps2.executeUpdate();
				System.out.println("(jobsAction.jsp) Form sent");

				String msg2 = "(jobsAction.jsp) Data entered successfully.";

			}
			
			response.sendRedirect("../pages/jobApplications.jsp");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	
    	
	
	
	

%>