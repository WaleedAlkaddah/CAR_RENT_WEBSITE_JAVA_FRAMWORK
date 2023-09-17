<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="finall.adminServlet" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Data Table</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
    <style>
    .car-image {
        width: 150px;
        height: auto;
    }
</style>
</head>
<body>
    <h1>Data Table</h1>
     <button onclick="window.location.href='admin_Add.html'">Add New Car</button>
     <br>
     <br>
     



<form action="editServlet" method="post">
    <input type="text" name="id" placeholder="Enter ID">
<br>
    <input type="submit" value="Submit" />

</form>

<br>
<br>

<form action="deleteServlet" method="Post">
    <input type="text" name="id" placeholder="Enter ID for Delete">
<br>
    <input type="submit" value="Submit" />

</form>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Year</th>
            <th>Image</th>
            <th>Price Per Day</th>
            <th>Price Per Month</th>
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
                String query =  "SELECT * FROM mydb.car_details";
                ResultSet resultSet = statement.executeQuery(query);
                List<String[]> data = new ArrayList<>();

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
                         <td><%= idcar_details %></td>
                         <td><%= car_name %></td>
                         <td><%= car_brand %></td>
                         <td><%= car_year %></td>
                         <td><img class="car-image" src="data:image/jpeg;base64, <%= car_image %>" alt="Car Image"></td>
                         <td><%= price_perDay %></td>
                         <td><%= price_perMonth %></td>
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