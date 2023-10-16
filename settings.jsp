<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> settings</title>
<link rel ="stylesheet" href="css/donarhome.css">
<link rel="stylesheet" href="css/settings.css">
</head>
<body>
<header>
<% String file = (String)session.getAttribute("file");%>

     <a href="index.jsp" class="attribute">Home</a>
    <a href="#" class="attribute-link.selected ">Settings</a>
 <a href="logout" class="attribute attribute-logout">Logout</a>
  <div class="profile-picture"> <img src="<%= request.getContextPath() %>/images/<%= file %>"alt="Profile Picture" ></div>
    
  </header>
  
  
  
  <div class="button-container">
  <button class="button-edit"> <a href="editdon.jsp">Edit</a></button>
  
  <button class="button-view"> <a href="viewdon.jsp">View</a></button>
  
   <form action="deletedon" method="post">
   <button class="button-delete"  name="delete">Delete</button>
</form> 

</div>
  

</body>
</html>