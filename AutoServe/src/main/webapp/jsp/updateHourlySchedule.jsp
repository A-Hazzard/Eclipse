<%@ page import = "Servlets.ConnectionProvider"%>
<%@ page import = "java.sql.*" %>

<% 


	Connection con = ConnectionProvider.getConnection();
try{
	int workHours = Integer.parseInt(request.getParameter("workHours_input").trim());
	int lunchHours = Integer.parseInt(request.getParameter("lunchHours_input").trim());
	int meetingsHours = Integer.parseInt(request.getParameter("meetingsHours_input").trim());

	if(workHours != 0){
		Statement state = con.createStatement();

		ResultSet rs = state.executeQuery("UPDATE hourly_schedule SET work = " + workHours);

	}
	if(lunchHours!= 0){
		Statement state1 = con.createStatement();

		ResultSet rs2 = state1.executeQuery("UPDATE hourly_schedule SET lunch = " + lunchHours);

	}
	if(meetingsHours!= 0){
		Statement state2 = con.createStatement();

		ResultSet rs2 = state2.executeQuery("UPDATE hourly_schedule SET meetings = " + meetingsHours);

	}
	
	response.sendRedirect("../admin/admin.jsp?msg=validNumber");

}catch(Exception exp){
	response.sendRedirect("../admin/admin.jsp?msg=invalidNumber");

}
%>