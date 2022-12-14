<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%	
	String vehicleType = request.getParameter("vehicleType_input").trim();
	String plateNumber = request.getParameter("plateNum_input").trim();
	String issues = request.getParameter("issues_input").trim();
	String category = request.getParameter("category_input").trim();
	String status = request.getParameter("status_input").trim();
	int clientID = Integer.parseInt(request.getParameter("clientID_input").trim());
	
	//QUERIES
	String dropPendingTable = "DELETE FROM pendingClients WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issues = '"+issues+"' AND category = '"+category+"' AND status = '"+status+"')";
	String dropRegVehicleTable = "DELETE FROM registered_vehicles WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issues = '"+issues+"' AND category = '"+category+"' AND status = '"+status+"')";
	String dropJobsTable = "DELETE FROM jobs WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"' AND currentstatus ='"+status+"')";
	String dropRegistrationQTable = "DELETE FROM registrationq WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issues = '"+issues+"' AND category = '"+category+"' AND status ='"+status+"')";
	
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement ps = con.prepareStatement(dropPendingTable);
	PreparedStatement ps1 = con.prepareStatement(dropJobsTable);
	PreparedStatement ps2 = con.prepareStatement(dropRegistrationQTable);
	PreparedStatement ps3 = con.prepareStatement(dropRegVehicleTable);
	
	ps.executeUpdate();
	ps1.executeUpdate();
	ps2.executeUpdate();
	ps3.executeUpdate();
	
	if(category.equals("Breaks")){
		String dropCategoryTable = "DELETE FROM breakrepair WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"' AND currentStatus ='"+status+"')";
		PreparedStatement ps4 = con.prepareStatement(dropCategoryTable);
		ps4.executeUpdate();

	}
	else if(category.equals("Engine")){
		String dropCategoryTable = "DELETE FROM enginerepair WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"' AND currentStatus ='"+status+"')";
		PreparedStatement ps5 = con.prepareStatement(dropCategoryTable);
		ps5.executeUpdate();

	}
	else if(category.equals("Clutch")){
		String dropCategoryTable = "DELETE FROM clutchrepair WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issue = '"+issues+"' AND category = '"+category+"' AND currentStatus ='"+status+"')";
		PreparedStatement ps6 = con.prepareStatement(dropCategoryTable);
		ps6.executeUpdate();

	}
	response.sendRedirect("../pages/clientPendingJobs.jsp");
%>