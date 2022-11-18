<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<%
	try{
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		String query0 ="create table user1(name varchar(150), email varchar(250) primary key , mobile number, securityQuestion varchar(550), answer varchar(550), password varchar(25), address varchar(250), city varchar(250),State varchar(250),country varchar(250))";
		String query1 ="create table products(id number, name varchar(250), catagory varchar(250), price number, active varchar(25))";

		
		System.out.print(query0);
		System.out.print(query1);
		
		//state.execute(query0);
		state.execute(query1);
		
		System.out.print("table created");
		
	}
	catch(Exception exp){
		System.out.print(exp);
		
	}




%>

