<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register Form</title>
  <style>
    /* Reset default margin and padding */
    * {
      margin: 0;
      padding: 0;
    }
    
    /* Styling for header */
    header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        background-color: #f1f1f1;
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
  width: 400px; /* Set the desired width */
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  position: relative;
  z-index: 1;
}
    .login-form label {
      display: white;
        color: white; /* Set label text color to white */
      
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
     .logo {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
      }

      .logo img {
        height: 100px; /* Adjust the height as per your logo's dimensions */
      }
  </style>
  
  <style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

.slideshow-container {
  width: 100%; /* Adjust the width as needed */
  height: 300px; /* Adjust the height as needed */
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
</head>
<body>
  <header>
  <form>
  <select id="language" name="language">
    <option value="English">English</option>
    <option value="Arabic">Arabic</option>
  </select>
    <button type="submit">Submit</button>
  
</form>

<% 
  String selectedLanguage = request.getParameter("language"); 
  if (selectedLanguage != null && !selectedLanguage.isEmpty()) { 
    out.println("Selected language: " + selectedLanguage); 
    // You can replace the out.println statement with your desired logic to handle the selected language 
  } 
%>

  <img src="images/favicon.png" alt="Logo">
   <img src="images/user.png" alt="Icon" onclick="window.location.href='login.jsp'" width="50" height="24">
  

</header>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/4.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/5.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/5.jpg" style="width:100%">
</div>

</div>

  <div class="login-form">
    <form action="RegServlet" method="post" >
      <label for="First_Name">First Name:</label>
      <input type="text" name="First_Name" required>
      
       <label for="Last_Name">Last Name:</label>
      <input type="text"  name="Last_Name" required>
      
      <label for="Email">Email:</label>
      <input type="text" name="Email" required>
      
      <label for="password">Password:</label>
      <input type="password"  name="password" required>
      
      <input type="submit" value="Register">
    </form>

    
  </div>
  <div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

    <script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
  



</body>
<footer>
    <p>&copy; 2023 Your Company. All rights reserved.</p>
    <p>Contact us: info@yourcompany.com</p>
    <p>Phone: +1 (123) 456-7890</p>
    <p>Follow us on social media:</p>
    <ul>
        <li><a href="https://www.facebook.com/yourcompany">Facebook</a></li>
        <li><a href="https://www.twitter.com/yourcompany">Twitter</a></li>
        <li><a href="https://www.instagram.com/yourcompany">Instagram</a></li>
        <li><a href="https://www.linkedin.com/company/yourcompany">LinkedIn</a></li>
    </ul>
</footer>
<style>
    footer {
        background-color: #f5f5f5;
        padding: 20px;
        text-align: center;
        font-size: 14px;
        color: #333;
    }
    
    footer p {
        margin: 10px 0;
    }
    
    footer ul {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }
    
    footer ul li {
        display: inline-block;
        margin: 0 5px;
    }
    
    footer ul li a {
        text-decoration: none;
        color: #666;
    }
</style>
</html>
