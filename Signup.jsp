<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<style>
 
    body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url('');
    background-repeat: no-repeat;
    background-size: cover;
    font-family: Arial, sans-serif;
  }

  #form-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    
    padding: 20px;
    border-radius: 10px;
  }

  input {
    width: 80%;
    padding: 10px;
    margin: 8px 0;
    border: none;
    border-radius: 3px;
   
  }

  p {
    color: white;
    text-align: center;
    font-size: 12px;
  }

  input[type="submit"] {
    background-color: #333;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    width: 50%;
  }
  input[type="submit"]:hover {
    background-color: grey;
  }
</style>
</head>
<body>


<div id="form-container">
  <form action="register" method="post" name="form1" onsubmit="return valid()" enctype="multipart/form-data">
    <p id="ename"></p>
    <input type="text" name="name" >
    <p id="em"></p>
    <input type="email" name="email" >
    <p id="ep"></p>
    <input type="password" name="password" >
    <p id="rp"></p>
    <input type="password" name="rpassword" >
    <input type ="file" name ="file">
     <select name="bloodgroup" required >
            <% 
                // Import necessary packages
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Initialize the database connection (you need to provide your connection details)
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
                    
                    // Execute the SQL query to fetch blood groups
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM blood_group");

                    // Loop through the result set and populate the <select> options
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String groupName = rs.getString("type");
                        out.println("<option value='" + groupName + "'>" + groupName + "</option>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Close database resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </select>
  <center> <input type="submit" value="Register"></center> 
  </form>
</div>

<script>

/* /*  function fname() {
    document.getElementById("ename").innerHTML = "Enter Your Name"; */
   /*  document.getElementById("em").innerHTML = "Enter Your email";
    document.getElementById("ep").innerHTML = "Enter Your password";
    document.getElementById("rp").innerHTML = "Re-Enter password";
} */
 */

function valid(){
	var x= document.form1.password.value;
	var y = document.form1.rpassword.value;
	
	if(x!==y){
		alert("password should be match");
		return false;
	}
	
}
</script>

</body>
</html>

