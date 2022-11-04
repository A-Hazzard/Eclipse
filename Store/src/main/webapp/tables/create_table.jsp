<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import = "storePackage.ConnectionProvider" %>
	<%@ page import = "java.sql.* "%>
	
	<% 
	try{
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		String query = "CREATE TABLE users(name VARCHAR(150), email VARCHAR(250) PRIMARY KEY, mobile NUMBER, secuirtyQuestion VARCHAR(550), answer VARCHAR(550), password VARCHAR(25), address VARCHAR(250), city VARCHAR(250), state VARCHAR(250), country VARCHAR(250) )";
		System.out.print(query);
		state.execute(query);
		
		System.out.print("Table created");
		con.close();
		
	} catch(Exception exp){
		System.out.print(exp);
	}
	%>
</body>
</html>