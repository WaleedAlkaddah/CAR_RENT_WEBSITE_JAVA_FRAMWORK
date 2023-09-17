<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.List" %>
<%@ page import="finall.adminServlet" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<style>
    .car-image {
        width: 150px;
        height: auto;
    }
     /* Styling for header */
    header {
      background-color: #333;
      color: #fff;
      padding: 10px;
    }
    
</style>
<head>
    <%
        String email = "";
        String password = "";

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("email")) {
                    email = URLDecoder.decode(cookie.getValue(), "UTF-8");
                } else if (cookie.getName().equals("password")) {
                    password = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
    %>
   

 <title>Car List</title>
<header>
    <h1>Car List Form</h1>
    <p>Email: <%= email %></p>
    <p>Password: <%= password %></p>
 </header>
</head>
<body>
<h1>Car List</h1>
  <table>
    <tr>
	  <th>Brand</th>
      <th>Year</th>
      <th>Image</th>
    </tr>
    <% 
            try {
    			System.out.println("connected...");
    			Class.forName("com.mysql.jdbc.Driver");
    			String sourceURL = "jdbc:mysql://localhost:3006/mydb";			
    			Connection connection =
    					DriverManager.getConnection(sourceURL,"root","Waleedroot0951");
    			System.out.println("connected...");
    			Statement statement = connection.createStatement();                
                // Prepare and execute the SQL query
                String query =  "SELECT * FROM mydb.car_details where is_rent=0";
                ResultSet resultSet = statement.executeQuery(query);
                ////List<String[]> data = new ArrayList<>();

                // Iterate over the result set and generate table rows dynamically
                while (resultSet.next()) {
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
         			 System.out.println(idcar_details);
         			 System.out.println(car_name);
         			 System.out.println(car_brand);
         			 System.out.println(car_year);
         			 System.out.println(car_image);
         			 System.out.println(price_perDay);
         			 System.out.println(price_perMonth);
         			 %>
                     <tr>
                         <td><%= car_brand %></td>
                         <td><%= car_year %></td>
                         <td><img class="car-image" src="data:image/jpeg;base64, <%= car_image %>" alt="Car Image"></td>
                         <td><a href="detailsServlet?id=<%=idcar_details%>">Details</a></td>
                     </tr>
                     <%

                }

                // Close the database resources
                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
  </table>





</body>
</html>