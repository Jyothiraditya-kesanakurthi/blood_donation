<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
  }

  .login-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .login-form {
    background-color: white;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin: 10px;
  }

  h3 {
    text-align: center;
    color: #333;
  }

  .login-form label {
    font-size: 12px;
    color: #666;
    padding-left: 3px;
  }

  .login-form input {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
  }

  .login-form input[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    width: 100%;
  }

  .login-form input[type="submit"]:hover {
    background-color: #0056b3;
  }

  /* Style the second form */
  .recipient-login-form {
    background-color: white;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    width: 300px;
    margin: 10px;
    display: none; /* Initially hidden */
  }

  .recipient-login-form h3 {
    text-align: center;
    color: #333;
  }

  .recipient-login-form label {
    font-size: 12px;
    color: #666;
    padding-left: 3px;
  }

  .recipient-login-form input {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
  }

  .recipient-login-form input[type="submit"] {
    background-color: #E91E63;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    width: 100%;
  }

  .recipient-login-form input[type="submit"]:hover {
    background-color: #C2185B;
  }
</style>
</head>
<body>

<div class="login-container">
    <div class="login-form">
        <form action="signin" method="post">
            <h3>Sign in</h3>
            <label>Email</label>
            <input type="email" name="email" />
            <label>Password</label>
            <input type="password" name="password" />
            <input type="submit" value="Login">
              <a href="forgot.jsp">Forgot Password?</a>
        </form>
    </div>

    <div class="recipient-login-form">
        <form action="rlogin" method="post">
            <h3>Recipient Sign in</h3>
            <label>Email</label>
            <input type="email" name="email" />
            <label>Password</label>
            <input type="password" name="password" />
            <input type="submit" value="Login">
            <a href="forgot.jsp">Forgot Password?</a>
              
        </form>
      
    </div>
</div>

<!-- Add buttons to switch between forms -->
<button id="signInButton">Sign In</button>
<button id="recipientSignInButton">Recipient Sign In</button>

<script>
  // JavaScript to switch between forms
  const loginForm = document.querySelector('.login-form');
  const recipientLoginForm = document.querySelector('.recipient-login-form');

  // Function to show the "Sign in" form
  function showSignInForm() {
    loginForm.style.display = 'block';
    recipientLoginForm.style.display = 'none';
  }

  // Function to show the "Recipient Sign in" form
  function showRecipientSignInForm() {
    loginForm.style.display = 'none';
    recipientLoginForm.style.display = 'block';
  }

  // Call the functions to initially show the "Sign in" form
  showSignInForm();

  // Add event listeners to the buttons to switch between forms
  const signInButton = document.getElementById('signInButton');
  const recipientSignInButton = document.getElementById('recipientSignInButton');

  signInButton.addEventListener('click', showSignInForm);
  recipientSignInButton.addEventListener('click', showRecipientSignInForm);
</script>
</body>
</html>
