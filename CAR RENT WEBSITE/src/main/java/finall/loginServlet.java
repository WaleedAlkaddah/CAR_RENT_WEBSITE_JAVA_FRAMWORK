package finall;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			PrintWriter out = response.getWriter();
			String Email = request.getParameter("Email");
			String Password = request.getParameter("password");
			System.out.println(Email);
			System.out.println(Password);
			
			if (Email.equals("admin") && Password.equals("admin"))
			{
	            response.sendRedirect("admin_Home.jsp");

			}
			else {
				
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} 
	        boolean isValid = validatee(Email, Password);
	        
	        
	        if (isValid) {
	        	// Store the username in a cookie
	            Cookie emailCookie = new Cookie("email", Email);
	            Cookie passwordCookie = new Cookie("password", Password);
	            emailCookie.setMaxAge(86400); // Set the cookie's expiration time (in seconds)
	            response.addCookie(emailCookie);
	            passwordCookie.setMaxAge(86400); // Set the cookie's expiration time (in seconds)
	            response.addCookie(passwordCookie);
	            
	            response.sendRedirect("car_list.jsp");
	        } else {
	        	
	            response.sendRedirect("login.jsp?error=1");
	        }

			}
			
		}
		private boolean validatee(String email, String password) {
			System.out.println("validatee ...");
			
	        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3006/mydb","root","Waleedroot0951");
	             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customer WHERE customer_email = ? AND customer_password = ?")) {
				System.out.println("Connected ...");

	        	 stmt.setString(1, email);
			     stmt.setString(2, password);

	            try (ResultSet rs = stmt.executeQuery()) {
	            	boolean x = rs.next(); // Return true if a row is found, indicating valid credentials
	            	rs.close();
	    			stmt.close();
	    			return x;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

}
