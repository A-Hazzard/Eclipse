<%@ page import = "storepackage.ConnectionProvider" %>
<%@ page import = "java.sql.*" %>

<% 
	String email = session.getAttribute("email").toString();
	String product_id = request.getParameter("id");
	int quantity = 1;
	int product_price = 0;
	int product_total = 0;
	int cart_total = 0;
	
	boolean test = false;
	
	try{
		Connection con = ConnectionProvider.getConnection();
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery("SELECT * FROM PRODUCT WHERE id = '" + product_id +"'");
		
		while(result.next()){
			product_price = result.getInt(4);
			product_total = product_price;
		}
		
		ResultSet result2 = state.executeQuery("SELECT * FROM products WHERE product_id = '" + product_id + "' AND email = '" + email + "' AND address is NULL");
		
		while(result2.next()){
			product_price = result.getInt(5);
			cart_total = cart_total + product_total;
			quantity = result.getInt(3);
			quantity += 1;
			test = true;
		}
		
		if (test == true){
			state.executeUpdate("UPDATE cart SET total = '" + cart_total + "', quantity = '" + quantity + "' WHERE product_id = '" + product_id + "' AND email = '" + email + "' AND address is NULL");
			response.sendRedirect("home.jsp?msgexist");
		}
		
		else if(test == false){
			PreparedStatement prepared = con.prepareStatement("INSERT INTO CART(email, product_id, quantity, price,total) VALUE(?,?,?,?,?)");
			prepared.setString(1, email);
			prepared.setString(2, product_id);
			prepared.setInt(3, quantity);
			prepared.setInt(4, product_price);
			prepared.setInt(5, product_total);
	
		}
	}catch(SQLException exp){
		System.out.println("There was problem executing the query: ERROR:" + exp);
		response.sendRedirect("home.jsp?msg=invalid");
	}

%>
