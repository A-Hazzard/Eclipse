package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class bookingServlet
 */
@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		System.out.print("started");
		try {	
			String firstName = request.getParameter("firstName");
			/*String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");*/
			String vehicleType = request.getParameter("selectVehicleType");
			String plateNumber = request.getParameter("plateNumber");

			
			bookingMembers credentials = new bookingMembers(firstName,/* lastName, email, phone, address,*/ vehicleType, plateNumber);
			
			out.println("Gathered information into our java servlet, please wait...");
	    	bookingsFunctionality bookings = new bookingsFunctionality();
			String result = bookings.insert(credentials);
			System.out.println(result);
	    	
		} catch (Exception e) {
			System.out.println("Failed to aceept input");
		}
		
	}

}
