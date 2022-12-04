<%@ page import = "Servlets.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>;

<% 


	try{
		
		String status = request.getParameter("status").trim();
		int clientID = Integer.parseInt(request.getParameter("clientID_input").trim());
		
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		String UpdateEngineRepair = "UPDATE engineRepair SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'";
		String Updatejobs ="UPDATE jobs SET currentStatus = '"+status+"' WHERE clientID = '"+clientID+"'"; 

        ResultSet rs = state.executeQuery(UpdateEngineRepair);
        rs = state.executeQuery(Updatejobs);
        
        response.sendRedirect("../pages/mechanicAssignedJobs.jsp");
	}catch(SQLException exp){
		exp.printStackTrace();
	}
	
%>