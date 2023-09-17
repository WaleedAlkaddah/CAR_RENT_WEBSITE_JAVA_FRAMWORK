package finall;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/editServlet"})
public class editServlet extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		System.out.println(id);
        
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Class Driver...");
			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
			Connection connection =
					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
			System.out.println("connected...");
			String insertQuery = "SELECT * FROM mydb.car_details WHERE idcar_details = ?";
            // Create prepared statement and set the parameters
            PreparedStatement statement1 = connection.prepareStatement(insertQuery);
			System.out.println("Checked ..");
			statement1.setString(1, id);
	        ResultSet resultSet = statement1.executeQuery();
	        if (resultSet.next()) {
               
	        	int idcar_details = resultSet.getInt("idcar_details");
                String car_name = resultSet.getString("car_name");
                String car_brand = resultSet.getString("car_brand");
                String car_year = resultSet.getString("car_year");
                Blob car_image_blob = resultSet.getBlob("car_image");
                String price_perDay = resultSet.getString("price_perDay");
                String price_perMonth = resultSet.getString("price_perMonth");
                String car_image = "";
                if (car_image_blob != null) {
                    byte[] imageBytes = car_image_blob.getBytes(1, (int) car_image_blob.length());
                    car_image = Base64.getEncoder().encodeToString(imageBytes);
                }
             else {
                // Handle case when no matching record is found
                response.sendRedirect("error.jsp");
            }
                request.setAttribute("idcar_details", idcar_details);
                request.setAttribute("car_name", car_name);
                request.setAttribute("car_brand", car_brand);
                request.setAttribute("car_year", car_year);
                request.setAttribute("car_image", car_image);
                request.setAttribute("price_perDay", price_perDay);
                request.setAttribute("price_perMonth", price_perMonth);
                //response.getWriter().println("Product found.");
    			System.out.println("Founded");
                request.getRequestDispatcher("edit.jsp").forward(request, response);
	        }
	        else {
                // Handle case where product with the given ID was not found
                response.getWriter().println("Product not found.");
            }
            // Close resources
	        resultSet.close();
	        statement1.close();
	        connection.close();
			
		}
		catch(Exception ex)
		{
			System.out.println("The error is");
			System.out.println(ex.getMessage());

		}


		
			
	}

}
