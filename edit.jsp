<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import=" java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@page import="jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

String u = request.getParameter("u");
Integer id = Integer.parseInt(u);




Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
String sql = "SELECT * FROM register where did='"+id+"'"; // Use the int variable directly

Statement statement = c.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
%>
	
	
	
<form action="update" method="post">

<%while(resultSet.next()){
	
	%>


<input type ="hidden" name="id" value="<%=resultSet.getString("did") %>">
Edit your Name :<input type ="text" name="name" value="<%=resultSet.getString("name") %>" placeholder="name">
Edit your Email:<input type ="text" name="email" value="<%=resultSet.getString("email") %>" placeholder="email">

<input type="submit" name="update">

<%} %>


</form>

<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }

  header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
  }

  form {
    max-width: 400px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
  }

  input[type="submit"] {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #555;
  }
</style>






</body>
</html>