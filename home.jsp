<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
 <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>

<%
    Date d = new Date();
    
    SimpleDateFormat s = new SimpleDateFormat("dd-MMM-yyyy");
    
    String today=s.format(d);
    %>

<%   
    if(session.getAttribute("name") == null){
        response.sendRedirect("Login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./css/donarhome.css">
    <link rel="stylesheet" href="./css/adminCount.css">
   <script>
	
	var colors=["blue","red","green","yellow","pink","orange","skyblue","gold","violet"];
	var index=0;
	
	function change(){
		var x= document.getElementById("he");
		x.style.color= colors[index];
		index= (index+1)% colors.length; 
	
	}
	setInterval(change,1000);
</script>
</head>
<body>
    <header class="admin">
        <div class="attribute">Home</div>
        <a class="attribute" href="admin/ShowDonars.jsp">ShowDonors</a>
        <a class="attribute" href="admin/ShowRecip.jsp">ShowRecipients</a>
        <a href="logout" class="attribute attribute-logout">Logout</a>
    </header>
    <nav>
    
    
    </nav>
    <div class="column">
    <ul>
        <li><a href="admin/AvaliableBloodGroups.jsp">Avaliable Blood Groups</a></li>
        <li><a href="admin/Bookings.jsp">Requests Blood</a></li>
        <!-- Add more links as needed -->
    </ul>
</div>
<lable style="color:black;font-size:20px;position:absolute ; top: 100px; right:10px";>Today's Date</lable>
		<h3 style="color:indigo;font-size:24px;position:absolute ; top: 100px; right:10px";><%=today %></h3>

    
    <div class="content">
        <h1 id ="he">Total Registered Users</h1>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3307/website", "root", "1234");
                String sql = "SELECT (SELECT COUNT(*) FROM register WHERE name <> 'admin') AS donorCount, " +
               "(SELECT COUNT(*) FROM rsignup) AS recipientCount," 
               
                +"(select count(type)from blood_group where type='A+')AS Acount, "
              +"(select count(type)from blood_group where type='AB+')AS ABcount, "+"(select count(type)from blood_group where type='O+')AS Ocount, "
            +"(select count(type)from blood_group where type='AB-')AS ABNcount ,"+"(select count(type)from blood_group where type='B+')AS Bcount, "
              +"(select count(type)from blood_group where type='B-')AS BNcount, "
               +"(select count(type)from blood_group where type='A-')AS ANcount ";
                Statement st = c.createStatement();
                ResultSet rs = st.executeQuery(sql);

                if (rs.next()) {
                    int donorCount = rs.getInt("donorCount");
                    int recipientCount = rs.getInt("recipientCount");
                    int Acount = rs.getInt("Acount");
                    int ANcount = rs.getInt("ANcount");
                    int Bcount = rs.getInt("Bcount");
                    int BNcount = rs.getInt("BNcount");
                    int ABcount = rs.getInt("ABcount");
                    int ABNcount = rs.getInt("ABNcount");
                    int Ocount = rs.getInt("Ocount");
        %>
                    <div class="box">
                        <h2 class="d">Donors</h2>
                        <p>Total Available Donors : <%= donorCount %></p>
                    </div>
                    <div class="box">
                        <h2>Recipients</h2>
                        <p>Total Available Recipients : <%= recipientCount %></p>
                    </div>
                    <div class="box">
                        <h2>A+ (Blood Group)</h2>
                        <p>Total Available A+ Donars : <%= Acount %></p>
                    </div>
                    <div class="box">
                        <h2>A- (Blood Group)</h2>
                        <p>Total Available A- Donars : <%= ANcount %></p>
                    </div>
                    <div class="box">
                        <h2>B+ (Blood Group)</h2>
                        <p>Total Available B+ Donars : <%= Bcount %></p>
                    </div>
                    <div class="box">
                        <h2>B- (Blood Group)</h2>
                        <p>Total Available B- Donars : <%= BNcount %></p>
                    </div>
                    <div class="box">
                        <h2>AB+ (Blood Group)</h2>
                        <p>Total Available AB+ Donars : <%= ABcount %></p>
                    </div>
                    <div class="box">
                        <h2>AB- (Blood Group)</h2>
                        <p>Total Available AB- Donars : <%= ABNcount %></p>
                    </div>
                    <div class="box">
                        <h2>O+ (Blood Group)</h2>
                        <p>Total Available O+ Donars : <%= Ocount %></p>
                    </div>
        <%
                }
                rs.close();
                st.close();
                c.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
    </div>
</body>
</html>
