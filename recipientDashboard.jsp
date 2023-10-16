<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    
    <%
    Date d = new Date();
    
    SimpleDateFormat s = new SimpleDateFormat("dd-MM-yyyy");
    
    String today=s.format(d);
    %>
    <% if (session.getAttribute("name")==null){
    response.sendRedirect("Login.jsp");
    }%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="css/donarhome.css">
<link rel="stylesheet" href="css/ReciHome.css">

</head>
<body>
<header class="reci">
<% String file = (String)session.getAttribute("file");%>

  <div class="attribute">Home</div>
    <a href="recipient/rSettings.jsp" class="attribute">Settings</a>
    
    
    
 <a href="logout" class="attribute attribute-logout">Logout</a>
  <div class="profile-picture"> <img src="<%= request.getContextPath() %>/images/<%= file %>"alt="Profile Picture" ></div>



</header>




<div class="column">
        <ul>
            <li><a href="recipient/AvaliableDonars.jsp">Avalialable Donars</a></li>
            <li><a href="recipient/Myrequests.jsp">My Requests</a></li>
            <!-- Add more links as needed -->
        </ul>
    </div>
<h3> Welcome!<%=session.getAttribute("name") %> </h3>
<lable style="color:black;font-size:20px;position:absolute ; top: 100px; right:10px";>Today's Date</lable>
		<h3 style="color:green;font-size:24px;position:absolute ; top: 100px; right:10px";><%=today %></h3>






























</body>
</html>