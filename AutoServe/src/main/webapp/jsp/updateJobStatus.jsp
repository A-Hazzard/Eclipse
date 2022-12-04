<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>;

<% 


	try{
		System.out.println("(UpdateobStatus.jsp) Form SUBMITTED");
		String status = request.getParameter("status").trim();
		int clientID = Integer.parseInt(request.getParameter("clientID_input").trim());
		
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		String UpdateEngineRepair = "UPDATE engineRepair SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'";
		String UpdateBreaksRepair = "UPDATE breakRepair SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'";
		String UpdateClutchRepair = "UPDATE clutchRepair SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'";
		String Updatejobs ="UPDATE jobs SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'"; 

        ResultSet rs = state.executeQuery(UpdateEngineRepair);
        rs = state.executeQuery(UpdateBreaksRepair);
        rs = state.executeQuery(UpdateClutchRepair);
        rs = state.executeQuery(Updatejobs);
        
        response.sendRedirect("../pages/mechanicAssignedJobs.jsp");
	}catch(SQLException exp){
		exp.printStackTrace();
	}
	
%>