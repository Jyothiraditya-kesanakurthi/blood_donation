<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipient Signup</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  
  .signup-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    width: 400px;
  }
  
  .signup-container h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #007bff;
  }
  
  .form-group {
    margin-bottom: 15px;
  }
  
  .form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  .form-group input[type="text"],
  .form-group input[type="email"],
  .form-group input[type="password"],
  .form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .form-group input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  .form-group input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>
<script type="text/javascript">
  function valid() {
    var x = document.form1.password.value;
    var y = document.form1.rpassword.value;
    
    if (x !== y) {
      alert("Password and Confirm Password must be the same");
      return false;
    }
  }
</script>
</head>
<body>
  <div class="signup-container">
    <h1>Recipient Signup</h1>
    <form method="post" action="rsignup" onsubmit="return valid()" name="form1" enctype="multipart/form-data">
      <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" name="name" id="name" placeholder="Full Name">
      </div>
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" name="email" id="email" placeholder="Email Address">
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Enter password">
      </div>
      <div class="form-group">
        <label for="rpassword">Confirm Password</label>
        <input type="password" name="rpassword" id="rpassword" placeholder="Confirm password">
      </div>
      <div class="form-group">
        <label for="file">Profile Picture</label>
        <input type="file" name="file" id="file">
      </div>
      <div class="form-group">
        <input type="submit" value="Sign Up">
      </div>
    </form>
  </div>
</body>
</html>
