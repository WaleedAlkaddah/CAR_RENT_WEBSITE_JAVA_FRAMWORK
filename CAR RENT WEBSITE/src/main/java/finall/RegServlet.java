package finall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RegServlet"})
public class RegServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String First_name = request.getParameter("First_Name");
		String Last_name = request.getParameter("Last_Name");
		String Email = request.getParameter("Email");
		String Password = request.getParameter("password");
		System.out.println(First_name);
		System.out.println(Last_name);
		System.out.println(Email);
		System.out.println(Password);
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Class Driver...");
			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
			Connection connection =
					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
			System.out.println("connected...");
			
            //java.sql.Statement statement = connection.createStatement();
            String insertQuery = "INSERT INTO customer (customer_firstName, customer_LastName, customer_email, customer_password) VALUES (?, ?, ?, ?)";
            // Create prepared statement and set the parameters
            PreparedStatement statement1 = connection.prepareStatement(insertQuery);
			System.out.println("Stored1");

            statement1.setString(1, First_name);
            statement1.setString(2,Last_name);
            statement1.setString(3,Email);
            statement1.setString(4,Password);
			System.out.println("Stored2");

            // Execute the query
            statement1.executeUpdate();
			System.out.println("Stored ..");
			statement1.close();
            connection.close();
            
            
            response.sendRedirect("login.jsp");

		}
		catch(Exception ex)
		{
			System.out.println("The error is");
			System.out.println(ex.getMessage());

		}


	}
}
