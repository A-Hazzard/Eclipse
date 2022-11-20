package Servlets;
public abstract class getInfo{
	
	public static int getInfo(int sessionClientID){
		
		 while(result.next()){
				//fetch the column name by their index from the person table
			    sessionClientID = result.getInt(1);
				String sessionFname = result.getString(2);//colum firstname as an index of 2
				String sessionLname = result.getString(3);
				String sessionEmail = result.getString(4);
				String sessionPhone = result.getString(5);
				String sessionPosition = result.getString(7);
			
				//set attributes to share vairable to another file to access
				session.setAttribute("clientID", sessionClientID);
				session.setAttribute("FirstName",sessionFname);
				session.setAttribute("LastName",sessionLname);
				session.setAttribute("Email",sessionEmail);
				session.setAttribute("Phone",sessionPhone);
				session.setAttribute("Position", sessionPosition);
		 }
		 return sessionClientID;
	      
	}
	
}
