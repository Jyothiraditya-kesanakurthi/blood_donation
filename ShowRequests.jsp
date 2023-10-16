<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/donarhome.css">
    <link rel="stylesheet" href="css/ReciHome.css">
    <link rel="stylesheet" href="css/ShowUsers.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
      
    
</head>
<body>
    <header>
        <% String file = (String)session.getAttribute("file"); %>
        <% 
           Integer id = (Integer)session.getAttribute("did");
           
        %>
        <% 
Integer irid = (Integer)session.getAttribute("rid"); // Assuming you store rid in the session
System.out.println("rid: " + irid); // Add this line for debugging
%>
        
        <div class="attribute">Home</div>
        <a href="settings.jsp" class="attribute">Settings</a>
        <a href="logout" class="attribute attribute-logout">Logout</a>
        <div class="profile-picture">
            <img src="<%= request.getContextPath() %>/images/<%= file %>" alt="Profile Picture">
        </div>
    </header>


    <div class="column" id="menu">
    <ul>
            <li><a href="#">RequestBlood</a></li>
            <li><a href="page2.html">Link to Page 2</a></li>
            <!-- Add more links as needed -->
        </ul>
    </div>
   

  

   
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
        String sql = "SELECT r.name, r.email, r.file ,rb.message,rb.blood_type,rb.id " +
                "FROM request_blood rb " +
                "INNER JOIN rsignup r ON rb.rid = r.rid " +
                "WHERE rb.did = "+id; 


        Statement st = c.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            // Process and display data from the result set
            String name = rs.getString("name");
            String email = rs.getString("email");
            String imagePath = rs.getString("file");
            String m = rs.getString("message");
            String b = rs.getString("blood_type");
            int sid =rs.getInt("id");
    %>
            <div class="profile-card">
                <img src="<%= request.getContextPath() %>/images/<%= imagePath %>" alt="Profile Image" class="profile-image">
                <div class="profile-details">
                    <div class="profile-name"><%= name %></div>
                    <div class="profile-email"><%= email %></div>
                 <div class="profile-msg"> message :<%= m %></div>
                    <div class="profile-email">BloodRequired:<%= b %></div>
                    
                     <form method="post" action="Reqstatus">
        <select name="rstatus">
                    <option value="accepted">Approve Request</option>
                    <option value="rejected">Reject Request</option>
  
                    
                </select>
                <input type="hidden" name="sid" value="<%=sid %>">
             <button type="submit" class="delete-button"> Send response</button>
            </form>
                </div>
            </div>
    <%
        }
        rs.close();
        st.close();
        c.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
