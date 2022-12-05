<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%	
	int clientID = Integer.parseInt(request.getParameter("clientID").trim());
	String dropTable = "DELETE FROM registrationq WHERE clientID = '"+clientID+"'";
	
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement ps = con.prepareStatement(dropTable);
	
	ps.executeUpdate();
%>