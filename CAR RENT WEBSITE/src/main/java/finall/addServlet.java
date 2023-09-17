package finall;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/addServlet"})
@MultipartConfig

public class addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String car_name = request.getParameter("Car_name");
		String Car_brand = request.getParameter("Car_brand");
		String Car_year = request.getParameter("Car_year");
        Part filePart = request.getPart("Car_image");
		String Car_month = request.getParameter("Car_month");
		String Car_day = request.getParameter("Car_day");
		System.out.println(car_name);
		System.out.println(Car_brand);
		System.out.println(Car_year);
		System.out.println(filePart);
		System.out.println(Car_month);
		System.out.println(Car_day);
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Class Driver...");
			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
			Connection connection =
					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
			System.out.println("connected...");
			
            //java.sql.Statement statement = connection.createStatement();
            String insertQuery = "INSERT INTO car_details (car_name, car_brand, car_year, car_image,price_perDay ,price_perMonth ,is_rent ) VALUES (?, ?, ?, ?,?,?,0)";
            // Create prepared statement and set the parameters
            PreparedStatement statement1 = connection.prepareStatement(insertQuery);
			System.out.println("Stored1");
			 if (filePart != null) {
				 InputStream inputStream = filePart.getInputStream();
				 	statement1.setString(1, car_name);
		            statement1.setString(2,Car_brand);
		            statement1.setString(3,Car_year);
	                statement1.setBinaryStream(4, inputStream);
		            statement1.setString(5,Car_month);
		            statement1.setString(6,Car_day);
					System.out.println("Stored2");

		            // Execute the query
		            statement1.executeUpdate();
					System.out.println("Stored ..");
	                System.out.println("Image uploaded successfully.");
					statement1.close();
		            connection.close();
			 }
           
		}
		catch(Exception ex)
		{
			System.out.println("The error is");
			System.out.println(ex.getMessage());

		}
        response.sendRedirect("admin_Home.jsp");


	}

}
