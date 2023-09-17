<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .car-image {
        width: 150px;
        height: auto;
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



<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
 <h1>Car Details:</h1>
 <div class="login-form">
    <p>ID: <%= request.getAttribute("idcar_details") %></p>
    <p>Car Name: <%= request.getAttribute("car_name") %></p>
    <p>Car Brand: <%= request.getAttribute("car_brand") %></p>   
    <p>Car Year: <%= request.getAttribute("car_year") %></p>    
    <p >Car Image:</p>
    <img class="car-image" src="data:image/jpeg;base64, <%= request.getAttribute("car_image") %>" alt="Car Image">
    <p>Price Per Day: <%= request.getAttribute("price_perDay") %></p>
    <p>Price Per Month: <%= request.getAttribute("price_perMonth") %></p>
    
</div>
    <h2>Modify Car:</h2>
    <div class = "login-form">
    <form action="updateServlet" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="idcar_details" value="<%= request.getAttribute("idcar_details") %>" />
        
        <label>Car Name:</label>
        <input type="text" name="car_name" value="<%= request.getAttribute("car_name") %>" />
        
          <label>Car Brand:</label>
        <input type="text" name="car_brand" value="<%= request.getAttribute("car_brand") %>" />
        
          <label>Car Year:</label>
        <input type="text" name="car_year" value="<%= request.getAttribute("car_year") %>" />
        
        <label >Car image:</label>
      <input type="file" name="car_image" accept="image/*" />
       <br />
        
          <label>Price Per Day:</label>
        <input type="text" name="price_perDay" value="<%= request.getAttribute("price_perDay") %>" />
        
         <label>Price Per Month:</label>
        <input type="text" name="price_perMonth" value="<%= request.getAttribute("price_perMonth") %>" />

        <input type="submit" value="Update" />
    </form>
    </div>
</body>
</html>