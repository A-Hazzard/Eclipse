<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%

	try{
		
		
		String currentPassword = request.getParameter("currentPassword").trim();
		String newPassword = request.getParameter("newPassword").trim();
		String position = request.getParameter("position");
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		System.out.println(currentPassword + " " + newPassword + " " + position + " " + userID);
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		int test = 0;
		if(position.equals("Client")){
			ResultSet rs = state.executeQuery("UPDATE clients SET password = '" + newPassword + "' WHERE (password = '" + currentPassword + "' AND ID = " + userID + ")");
			
				while(rs.next()){
					test = 1;
					response.sendRedirect("../../accountSettings.jsp?msg=changedPassword");

				}
		
			

		}
	
		if(test == 0){
			response.sendRedirect("../../accountSettings.jsp?msg=invalidInfo");

		}
		
	}catch(Exception e){
		System.out.println(e);
		e.printStackTrace();
	}

%>