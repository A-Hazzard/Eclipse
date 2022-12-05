<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%	
	String vehicleType = request.getParameter("vehicleType_input").trim();
	String plateNumber = request.getParameter("plateNum_input").trim();
	String issues = request.getParameter("issues_input").trim();
	String category = request.getParameter("category_input").trim();
	int clientID = Integer.parseInt(request.getParameter("clientID_input").trim());
	String dropTable = "DELETE FROM registrationq WHERE (clientID = '"+clientID+"' AND vehicleType = '" +vehicleType+"' AND platenumber = '"+plateNumber+"' AND issues = '"+issues+"' AND category = '"+category+"')";
	
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement ps = con.prepareStatement(dropTable);
	
	ps.executeUpdate();
	response.sendRedirect("../pages/clientPendingJobs.jsp");
%>