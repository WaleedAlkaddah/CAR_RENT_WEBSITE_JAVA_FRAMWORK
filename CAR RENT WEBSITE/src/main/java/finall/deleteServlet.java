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


@WebServlet(urlPatterns = {"/deleteServlet"})
public class deleteServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String car_id = request.getParameter("id");
		System.out.println(car_id);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Class Driver...");
			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
			Connection connection =
					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
			System.out.println("connected...");
			String insertQuery = "Delete from car_details where idcar_details = ?";
			PreparedStatement statement1 = connection.prepareStatement(insertQuery);
			System.out.println("Check ..");
		 	statement1.setString(1, car_id);
			System.out.println("Stored 1");
            statement1.executeUpdate();
            statement1.close();
            connection.close();

			
		}catch(Exception ex)
		{
			System.out.println("The error is");
			System.out.println(ex.getMessage());

		}
        response.sendRedirect("admin_Home.jsp");


		
	}

}
