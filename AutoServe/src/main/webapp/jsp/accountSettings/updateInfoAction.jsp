<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

	try{
		
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String password = request.getParameter("password");
		String position = request.getParameter("position");
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		
		if(position.equals("Client")){
			PreparedStatement ps = con.prepareStatement("UPDATE clients SET securityQuestion = '" + securityQuestion + "' WHERE ID = " + userID);
			PreparedStatement ps1 = con.prepareStatement("UPDATE clients SET answer = '" + answer+ "' WHERE ID = " + userID);
			ps.executeUpdate();
			ps1.executeUpdate();
		}
		
		response.sendRedirect("../../accountSettings.jsp?msg=changedInfo");
	}catch(Exception e){
		System.out.println(e);
		e.printStackTrace();
	}

%>