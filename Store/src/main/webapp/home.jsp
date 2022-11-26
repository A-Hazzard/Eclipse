<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<% 
String message = request.getParameter("msg");
if("added".equals(message))
{
%>
<h3 class="alert">Product added successfully! </h3>
<%} %>

<%
if("exist".equals(message))
{
%>
<h3 class="alert"> Product already exist in your cart! Quantity increased!</h3>
<%} %>

<%
if("invalid".equals(message))
{
%>
<h3 class = "alert"> Something went wrong! Try Again!</h3>
<%} %>

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
	try{
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery("select * from products where active = 'Yes'");
		
		while(result.next()){
%>
          <tr>
            <td name = "id"><%=result.getString(1)%></td>
            <td><%=result.getString(2)%></td>
            <td><%=result.getString(3)%></td>
            <td><i class="fa fa-inr"><%=result.getString(4) %> </i></td>
            <td><a href="addToCartAction.jsp?=<%=result.getString(1)%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
		}
	}catch(Exception exp)
	{
		System.out.print(exp);
	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>