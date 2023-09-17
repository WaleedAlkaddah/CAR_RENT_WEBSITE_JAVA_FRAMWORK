package finall;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.Statement;

@WebServlet(urlPatterns = {"/adminServlet"})
public class adminServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("connected...");
        List<String[]> data = new ArrayList<>();
		PrintWriter out = response.getWriter();

        try {
        	        	
			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
			Connection connection =
					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
			System.out.println("connected...");
			Statement statement = connection.createStatement();
            String sql = "SELECT * FROM mydb.car_details";
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String idcar_details = resultSet.getString("idcar_details");
                String car_name = resultSet.getString("car_name");
                String car_brand = resultSet.getString("car_brand");
                String car_year = resultSet.getString("car_year");
                String car_image = resultSet.getString("car_image");
                String price_perDay = resultSet.getString("price_perDay");
                String price_perMonth = resultSet.getString("price_perMonth");
                String[] rowData = {idcar_details, car_name, car_brand, car_year, car_image, price_perDay, price_perMonth};
                data.add(rowData);
                System.out.print(data); 
            }
            resultSet.close();
            statement.close();
            connection.close();
            System.out.print(data);

            // Set the data as a request attribute
            request.setAttribute("data", data);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_Home.jsp");
            dispatcher.forward(request, response);
            } catch (SQLException e) {
            e.printStackTrace();
        }
        
      
		
	}

	
}
