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
		Statement state1 = con.createStatement();
		
		int valid = 0;
		if(position.equals("Client")){
		
			ResultSet rs = state.executeQuery("UPDATE clients SET securityQuestion = '" + securityQuestion + "' WHERE ID = " + userID + " AND password = '" + password + "'");
			ResultSet rs1 = state1.executeQuery("UPDATE clients SET answer = '" + answer+ "' WHERE ID = " + userID + " AND password = '" + password + "'");
			
			while(rs.next()){
				response.sendRedirect("../../accountSettings.jsp?msg=changedSecurityInfo");

			}
			while(rs1.next()){
				response.sendRedirect("../../accountSettings.jsp?msg=changedSecurityInfo");

			}
		}
		
		
		if(valid == 0){
			response.sendRedirect("../../accountSettings.jsp?msg=invalidSecurityInfo");

		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>