<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="editdon.css">
</head>
<body>

<%  int id = (int)session.getAttribute("did");
   String file = (String)session.getAttribute("file");  
   
   
   
   
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
	   String sql ="select*from register where did ='"+id+"'";
	   Statement st = c.createStatement();
	   ResultSet rs = st.executeQuery(sql);
	   
   
   
   %>
   
   
   <form action="editd" method="post"  enctype="multipart/form-data">

<%while(rs.next()){
	
	
	%>


<input type ="hidden" name="id" value="<%=rs.getString("did") %>">
 Existing Profile: <br>
    <img src="<%= request.getContextPath() %>/images/<%= file %>" alt="Profile Image" width="100">
Edit your Name :<input type ="text" name="name" value="<%=rs.getString("name") %>" placeholder="name">
Edit your Email:<input type ="text" name="email" value="<%=rs.getString("email") %>" placeholder="email">

    
    
    Upload new profile: <input type="file" name="file"><br>
 
<input type="submit" name="update">

<%} %>

        </form>        
</body>
</html>