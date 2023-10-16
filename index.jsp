<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    
    <%
    Date d = new Date();
    
    SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
    String today = s.format(d);
    		
    
    
    %>
    
    <%if(session.getAttribute("name")==null){
    response.sendRedirect("login.jsp");
    }%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href="css/donarhome.css">
<link rel="stylesheet" href="css/ReciHome.css">
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
 <header>
 <% String file = (String)session.getAttribute("file");
  %>
 
    <div class="attribute">Home</div>
    <a href="settings.jsp" class="attribute">Settings</a>
    
    
    
 <a href="logout" class="attribute attribute-logout">Logout</a>
   <div class="profile-picture"> <img src="<%= request.getContextPath() %>/images/<%= file %>"alt="Profile Picture" ></div>
    
  </header>
  
<div class="column">
        <ul>
            <li><a href="ShowRequests.jsp">RequestBlood</a></li>
            <li><a href="page2.html">Link to Page 2</a></li>
            <!-- Add more links as needed -->
        </ul>
    </div>
 
		<h3>  Welcome! <%= session.getAttribute("name")%></h3>
		<lable style="color:black;font-size:20px;position:absolute ; top: 100px; right:10px";>Today's Date</lable>
		<h3 style="color:blue;font-size:24px;position:absolute ; top: 100px; right:10px";><%=today %></h3>
	
	<h3> </h3>
	
</body>
</html>

					<%--  	</a></li>
			<%= session.getAttribute("name") %></a></li>
					<a href="logout">Logout</a> --%>