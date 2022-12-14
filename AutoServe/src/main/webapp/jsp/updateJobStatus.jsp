<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>;

<% 


	try{
		System.out.println("(UpdateobStatus.jsp) Form SUBMITTED");
		String status = request.getParameter("status").trim();
		String vehicleType = request.getParameter("vehicleType_input").trim();
		String plateNumber = request.getParameter("plateNum_input").trim();
		String issues = request.getParameter("issues_input").trim();
		String mechanicEmail = request.getParameter("mechanicEmail_input").trim();
		String mechanicFeedback = request.getParameter("mechanicFeedback_input").trim();
		String category = request.getParameter("category_input").trim();
		String invoice = request.getParameter("invoiceLink_input").trim();
		int clientID = Integer.parseInt(request.getParameter("clientID_input").trim());
		

		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		Statement states1 = con.createStatement();
		Statement states2 = con.createStatement();
		Statement states3 = con.createStatement();
		
		String UpdateEngineRepair = "UPDATE engineRepair SET currentStatus = '"+status+"' WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"')"; 
		String UpdateBreaksRepair = "UPDATE breakRepair SET currentStatus = '"+status+"' WHERE(clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"')"; 
		String UpdateClutchRepair = "UPDATE clutchRepair SET currentStatus = '"+status+"' WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"')"; 
		String Updatejobs ="UPDATE jobs SET currentStatus = '"+status+"' WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"')"; 


        ResultSet rs = state.executeQuery(UpdateEngineRepair);
	        ResultSet rs1 = states1.executeQuery(UpdateBreaksRepair);
	        ResultSet rs2 = states2.executeQuery(UpdateClutchRepair);
		
        ResultSet rs3 = states3.executeQuery(Updatejobs);
        
        if(status.equals("Finished")){
        	System.out.println("Finished Job");
        	int fee = Integer.parseInt(request.getParameter("fee"));
        	String completedJobs = "INSERT INTO completedJobs VALUES(?,?,?,?,?,?,?,'Finished',?,?)";
        	String dropActiveJob = "DELETE FROM activeJobs WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"')";
        	String dropPending = "DELETE FROM pendingClients WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issueS = '"+issues+"' AND category = '"+category+"')"; 
        	PreparedStatement delete = con.prepareStatement(dropPending);

        	Statement state2 = con.createStatement();
        	//Drops active jobs table
        	PreparedStatement ps = con.prepareStatement(completedJobs);
        	ps.setInt(1, clientID);
        	ps.setString(2, mechanicEmail);        	
        	ps.setString(3, vehicleType);
        	ps.setString(4, plateNumber);
        	ps.setString(5, issues);
        	ps.setString(6, mechanicFeedback);
        	ps.setString(7, invoice);
        	ps.setString(8, category);

        	ps.setInt(9, fee);

        	PreparedStatement ps2 = con.prepareStatement(dropActiveJob);
    		ps.executeUpdate();
			ps2.executeUpdate();
			delete.executeUpdate();
			
			if(category.equals("Engine")){
	        	System.out.println("Engine Deletion");
	        	String dropEngineRepair = "DELETE FROM engineRepair  WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"')";
	        	PreparedStatement del = con.prepareStatement(dropEngineRepair);

	        	del.executeUpdate();

	        }
			else if(category.equals("Clutch")){
	        	System.out.println("Clutch Deletion");
	        	String dropClutchRepair = "DELETE FROM clutchRepair  WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"')";

	        	PreparedStatement del1 = con.prepareStatement(dropClutchRepair);

	        	del1.executeUpdate();


	        }
			else if(category.equals("Breaks")){
	        	System.out.println("Breaks Deletion");
	        	String dropBreakesRepair = "DELETE FROM breakRepair  WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"')";

	        	PreparedStatement del2 = con.prepareStatement(dropBreakesRepair);

	        	del2.executeUpdate();


	        }
        }
        
        else if(status.equals("Active")){
        	System.out.println("Active Job");
        	String completedJobs2 = "INSERT INTO activeJobs VALUES(?,?,?,?,?,?,'Active')";
        	String dropActiveJob2 = "DELETE FROM pendingClients WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issueS = '"+issues+"' AND category = '"+category+"')"; 

        	PreparedStatement ps1 = con.prepareStatement(completedJobs2);
        	PreparedStatement del = con.prepareStatement(dropActiveJob2);

        	ps1.setInt(1, clientID);
        	ps1.setString(2, mechanicEmail);        	
        	ps1.setString(3, vehicleType);
        	ps1.setString(4, plateNumber);
        	ps1.setString(5, issues);
        	ps1.setString(6, mechanicFeedback);


        
        	ps1.executeUpdate();
        	del.executeUpdate();

        }
        else if(status.equals("Pending")){
    		PreparedStatement pendingClients = con.prepareStatement("INSERT INTO pendingClients VALUES("+clientID+",?,?,?,?, 'Pending')");
    		PreparedStatement activeJobs = con.prepareStatement("DELETE FROM activeJobs WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND mechanicemail = '"+mechanicEmail+"')"); 
    		pendingClients.setString(1,vehicleType);
    		pendingClients.setString(2,plateNumber);
    		pendingClients.setString(3,issues);
    		pendingClients.setString(4,category);
			
			pendingClients.executeUpdate();
			activeJobs.executeUpdate();

			System.out.println("Added Client back to pending table");
        }
        
        response.sendRedirect("../pages/mechanicAssignedJobs.jsp");
	}catch(SQLException exp){
		exp.printStackTrace();
	}
	
%>