<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Form</title>
  <style>
    /* Reset default margin and padding */
    * {
      margin: 0;
      padding: 0;
    }
    
    /* Styling for header */
    header {
      background-color: #333;
      color: #fff;
      padding: 10px;
    }
    
    /* Styling for footer */
    footer {
      background-color: #333;
      color: #fff;
      padding: 10px;
      position: fixed;
      bottom: 0;
      width: 100%;
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
</head>
<body>
  <header>
    <h1>Login Form</h1>
  </header>
  <br>
  <br>
  <br>
  <br>
  <br>
  <div class="login-form">
  
    <form action = "loginServlet" method = "post">
      <label for="username"> Email: </label>
      <input type="text" id="Email" name="Email" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
      
      <input type="submit" value="Login">
    </form>
        
    <% 
        String error = request.getParameter("error");
        if (error != null && error.equals("1")) {
            out.println("<p style='color: red;'>Invalid username or password.</p>");
        }
    %>
  </div>
  
  <footer>
    <p>&copy; 2023 Your Company. All rights reserved.</p>
  </footer>
</body>
</html>
