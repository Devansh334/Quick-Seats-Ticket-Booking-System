<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
    String name = (String)session.getAttribute("user_name");
    String email = (String)session.getAttribute("user_email");
    
    if(name == null) {
        // If name is null, redirect the user to login
        response.sendRedirect("user.html");
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

        .booking-form {
            margin: 20px auto;
            width: 60%;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .booking-form label {
            display: block;
            text-align: left;
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .booking-form input[type="text"],
        .booking-form input[type="date"],
        .booking-form select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .booking-form input[type="submit"] {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 14px 0;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .booking-form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        
        .booking-form table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .booking-form th, .booking-form td {
            padding: 10px;
            text-align: left;
        }
        
        .booking-form th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="Logout">Log Out</a>
        <a href="userhome.jsp">Home</a>
    </div>

    <!-- Display the agency name -->
    <h1 class="agency-name">Welcome to Profile Page</h1>
    <p>Hello , <%= name %></p>

    <!-- Booking Form -->
    <div class="booking-form">
        <h2>Book a Bus</h2>
        <form action="mybus.jsp" method="post">
            <table>
                <tr>
                    <th><label for="from">From:</label></th>
                    <td><input type="text" id="from" name="from" placeholder="Enter departure city" required></td>
                </tr>
                <tr>
                    <th><label for="to">To:</label></th>
                    <td><input type="text" id="to" name="to" placeholder="Enter destination city" required></td>
                </tr>
                <tr>
                    <th><label for="date">Date:</label></th>
                    <td><input type="date" id="date" name="date" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Search Buses"></td>
                </tr>
            </table>
        </form>
    </div>
    
    
</body>
</html>
