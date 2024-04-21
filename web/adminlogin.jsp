<%-- 
    Document   : adminlogin
    Created on : 28-Jan-2024 , 11:37:01 am
    Author     : DEVANSH GOYAL
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Images/Bg.png');
            margin: 0;
            padding: 0;
        }
        
        .navbar {
            background-color: #333;
            overflow: hidden;
        }
        
        .navbar a {
            float: right;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        img {
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="navbar">
    <a href="index.html">Logout</a>
    <a href="showvalid.jsp">Show Verified Agencies</a>
    <a href="adminlogin.jsp">Home</a>                                                   
</div>

<%
int i=0;
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
Statement smt = cn.createStatement();
ResultSet rs = smt.executeQuery("select * from Agencies where status = false");
%>
<table border="2" >
    <tr>
        <th>S no.</th>
        <th>Name</th>
        <th>Business Name</th>
        <th>Mobile no</th>
        <th>Email</th>
        <th>Address</th>
        <th>GST no</th>
        <th>Verify</th>
        <th>Delete</th>
    </tr>
<%
while(rs.next()){
int id=rs.getInt("id");
String email=rs.getString("email");
String name=rs.getString("agency_name");
%>     
<tr>
    <td><%= ++i%></td>
    <td><%= rs.getString("name")%></td>
    <td><%= rs.getString("agency_name")%></td>
    <td><%= rs.getString("mob_no")%></td>
    <td><%= rs.getString("email")%></td>
    <td><%= rs.getString("address")%></td>
    <td><%= rs.getString("GST_no")%></td>
    <td><a href="Verify?email='<%=email%>'"><img height="15%" width="15%" src="Images/tick.png" alt="verify"></a></td>
    <td><a href="Delete?email='<%=email%>'"><img height="8%" width="8%" src="Images/cross.png" alt="delete"></a></td>
</tr>
<%
}
cn.close();
}

catch(Exception e){
    out.print("<script>alert('Something Wen't Wrong! Please Try Again')</script>");
    RequestDispatcher rd = request.getRequestDispatcher("admin.html");
    rd.forward(request, response);
}
%> 
</table>

</body>
</html>
