<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            max-width: 800px;
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
            width: calc(100% - 24px);
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
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
            font-size: 16px;
            font-weight: bold;
        }
        
        td {
            font-size: 14px;
        }
        
        .book-now {
            text-align: center;
        }
        
        .book-now a {
            display: inline-block;
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .book-now a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="Logout">Log Out</a>
        <a href="userhome.jsp">Home</a>
    </div>
    
    <% 
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    String date = request.getParameter("date");
    
   
    %>
    
    <!-- Display the agency name -->
    <h1 class="agency-name">All Available Buses Are</h1>
    
    <div class="content">
        <table>
            <tr>
                <th>S No.</th>
                <th>Travel Agency</th>
                <th>Bus Type</th>
                <th>Seats Left</th>
                <th>City From</th>
                <th>Departure Date</th>
                <th>Departure Time</th>
                <th>Departure Day</th>
                <th>City To</th>
                <th>Arrival Date</th>
                <th>Arrival Time</th>
                <th>Arrival Day</th>
                <th>Ticket Price</th>
                <th>Book Now</th>
            </tr>
            
            <% 
            try {
                int i = 0;
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
                Statement smt = cn.createStatement();
                ResultSet rs = smt.executeQuery("select * from Bus where city_from= '"+from+"' and  city_to= '"+to+"' and dep_date='"+date+"' and total_seats>0");
                
                
                while (rs.next()) { 
                    
                    int id = rs.getInt("id");
                    %>
                    <tr>
                        <td><%= ++i %></td>
                        <td><%= rs.getString("agency_name") %></td>
                        <td><%= rs.getString("Bus_type") %></td>
                        <td><%= rs.getString("total_seats") %></td>
                        <td><%= rs.getString("city_from") %></td>
                        <td><%= rs.getString("dep_date") %></td>
                        <td><%= rs.getString("dep_time") %></td>
                        <td><%= rs.getString("dep_day") %></td>
                        <td><%= rs.getString("city_to") %></td>
                        <td><%= rs.getString("arr_date") %></td>
                        <td><%= rs.getString("arr_time") %></td>
                        <td><%= rs.getString("arr_day") %></td>
                        <td><%= "Rs."+rs.getString("rate") %></td>
                        <td class="book-now"><a href="book.jsp?id=<%=id%>&rate=<%=rs.getString("rate")%>&seats=<%= rs.getString("total_seats") %>">Book Now</a></td>
                    </tr>
                    <% 
                }
                rs.close();
                cn.close();
            } catch(Exception e) { 
                %>
                <tr>
                    <td colspan="14">
                        <div class="error-message">
       
                            <p>Something went wrong! Please try again.</p>
                           <%
                                response.sendRedirect("userhome.jsp");
                            %>
                        </div>
                    </td>
                </tr>
                <% 
            } 
            %>
        </table>
    </div>
</body>
</html>
