<%@ page import = "storepackage.ConnectionProvider"%>
<%@ page import = "java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter ("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

try{
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement prepared = con.prepareStatement ("insert into products values (?,?,?,?,?)");
	prepared.setString(1, id);
	prepared.setString(2, name);
	prepared.setString(3, category);
	prepared.setString(4, price);
	prepared.setString(5, active);
	
	prepared.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}catch (Exception exp){
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>