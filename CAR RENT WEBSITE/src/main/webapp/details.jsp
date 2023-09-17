<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.URLDecoder" %>
    
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
     /* Styling for login form */
    .login-form {
      max-width: 300px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
    }
    
    .login-form label {
      display: block;
      margin-bottom: 10px;
    }
    
    .login-form input[type="text"],
    .login-form input[type="password"] {
      width: 100%;
      padding: 5px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }
    
    .login-form input[type="submit"] {
      background-color: #333;
      color: #fff;
      padding: 10px 15px;
      border: none;
      cursor: pointer;
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
<meta charset="ISO-8859-1">
<title>Deatails</title>
<header>
<p>Email: <%= email %></p>
 <p>Password: <%= password %></p>

</header>
</head>
<body>
<h1>Car Details:</h1>
 <div class="login-form">
 <form action="RentServlet " method="post" >
    <p>ID: <%= request.getAttribute("idcar_details") %></p>
    <p>Car Name: <%= request.getAttribute("car_name") %></p>
    <p>Car Brand: <%= request.getAttribute("car_brand") %></p>   
    <p>Car Year: <%= request.getAttribute("car_year") %></p>    
    <p >Car Image:</p>
    <img class="car-image" src="data:image/jpeg;base64, <%= request.getAttribute("car_image") %>" alt="Car Image">
    <p>Price Per Day: <%= request.getAttribute("price_perDay") %></p>
    <p>Price Per Month: <%= request.getAttribute("price_perMonth") %></p>
    <input type="hidden" name="idcar_details" value="<%= request.getAttribute("idcar_details") %>">
     <input type="submit" value="Rent" />
</form>
</div>
 


</body>
</html>