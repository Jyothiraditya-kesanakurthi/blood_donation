<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View User Details</title>
<link rel="stylesheet"  type="text/css" href="css/donview.css">
</head>
<body>

<%
   // Retrieve the id from the session
   int id = (int) session.getAttribute("did");
     String file = (String)session.getAttribute("file");



   // Initialize a Connection and Statement
   Connection connection = null;
   Statement statement = null;
   ResultSet resultSet = null;
   
   try {
      // Load the JDBC driver
      Class.forName("com.mysql.cj.jdbc.Driver");
      
      // Establish the connection to the database
      connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
      
      // Create the SQL query
      String sql = "SELECT * FROM register WHERE did=" + id;
      
      // Create a statement and execute the query
      statement = connection.createStatement();
      resultSet = statement.executeQuery(sql);
 %>
<div class="container">
<table>
    <thead>
        <tr>
            <th>NAME</th>
            <th>EMAIL</th>
            <th>IMAGE</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("name") %></td>
            <td><%= resultSet.getString("email") %></td>
            <td><img src="<%= request.getContextPath() %>/images/<%= file %>" alt="User Image"></td>
        </tr>
       
   
   
   
   
    <%
    }
    resultSet.close();
    statement.close();
    connection.close();
    %>
    
    
<%
} catch (Exception e) {
    e.printStackTrace();
}
%>
</tbody>
</table>
</div>
</body>
</html>
