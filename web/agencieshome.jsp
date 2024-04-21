<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
    String name = (String)session.getAttribute("name");
    String email = (String)session.getAttribute("email");
    
    if(name.equals(null)) {
        // If name is null, redirect the user to login
        response.sendRedirect("agencies.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agencies Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('Images/Bg.png');
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .agency-name {
            font-size: 24px;
            font-weight: bold;
            color: #007bff; /* Blue color */
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
            background-color: #3498db;
            color: black;
        }

        .content {
            padding: 20px;
            text-align: center;
            font-family: Georgia;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        td:first-child {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="Logout">Log Out</a>
        <a href="showbus.jsp">Schedule</a>
        <a href="addbus.jsp">Add Bus</a>
        <a href="agencieshome.jsp">Home</a>
    </div>

    <!-- Display the agency name -->
    <h1>Welcome to Profile Page</h1>
    <p class="agency-name">Welcome, <%= name %></p>
    
    <%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
        Statement smt = cn.createStatement();
        ResultSet rs = smt.executeQuery("select * from Agencies where email = '"+email+"' and status = true");
    %>
    <table>
        <tbody>
            <% 
            // Assuming there's only one agency with the given name
            if (rs.next()) {
            session.setAttribute("agency_name", rs.getString("agency_name"));
            session.setAttribute("agency_email", rs.getString("email"));
            
            %>
                <tr>
                    <td>Name:</td>
                    <td><%= rs.getString("name") %></td>
                </tr>
                <tr>
                    <td>Business Name:</td>
                    <td><%= rs.getString("agency_name") %></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><%= rs.getString("mob_no") %></td>
                </tr>
                <tr>
                    <td>Email Id:</td>
                    <td><%= rs.getString("email") %></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><%= rs.getString("address") %></td>
                </tr>
                <tr>
                    <td>GST No.:</td>
                    <td><%= rs.getString("GST_no") %></td>
                </tr>
            <% 
            } else {
            %>
                <tr>
                    <td colspan="2">No profile found for <%= name %></td>
                </tr>
            <% 
            }
            %>
        </tbody>
    </table>
    <% 
        cn.close();
    }
    catch(Exception e){
        out.print("<script>alert('Something Went Wrong! Please Try Again')</script>");
        RequestDispatcher rd = request.getRequestDispatcher("admin.html");
        rd.forward(request, response);
    }
    %>
    
    <!-- Content -->
    <div class="content" >
        <h2>Adding and Deleting Buses</h2>
        <p>As an agency, you have the capability to manage your fleet of buses. Here are some functionalities:</p>
        
        <strong style="color:green;">Add Bus:</strong> You can add new buses to your fleet by providing necessary details such as bus number, capacity, route, etc.<br>
        <strong style="color:red;">Delete Bus:</strong>Once you added a bus it will be automatically deleted after departure. Bus Can't be deleted manually if added once. <br>
        <strong style="color:#3498db;">More Information:</strong> For more details on managing your buses and other administrative tasks, please refer to our user manual or contact our support team.<br>
       
    </div>
</body>
</html>
