<%-- 
    Document   : Ticket.jsp
    Created on : 21-Apr-2024, 12:09:41 am
    Author     : DEVANSH GOYAL
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>E-Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        th {
            text-align: left;
            background-color: #f2f2f2;
        }
   .input-container {
            text-align: center;
            
        }
        input[type="submit"] {
            
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div style="text-align: right; padding: 10px;">
        <a href="ticket.jsp" download><img src="Images/dwn.png" height="3%" width="3%"></a>
    </div>
    <%
    String user_email = (String) session.getAttribute("user_email");
    String user_name = (String) session.getAttribute("user_name");
    String bus_id = (String) session.getAttribute("bus_id");
     String amt = (String)session.getAttribute("amt");
    int id = Integer.parseInt(bus_id);
    int ts = (int) session.getAttribute("ts");
    int seats = (int) session.getAttribute("avai_seats");
    String bc=" ";
    String bt=" ";
    String dc=" ";
    List<String> l = new ArrayList<String>();
    int i=1;
    String seattt =" ";
    while(i<=seats){
            String str="S"+ts;
            ts--;
            seattt=seattt+" "+str;
            l.add(str);
            i++;
        }
    
    
    //out.print(user_email+" : "+user_name+" : "+id+" : "+seats);
    %>
    <div class="container">
        <h1>E-Ticket</h1>
        <table>
            <tr>
                <th>Traveler Name</th>
                <td><%= user_name %></td>
            </tr>
            <tr>
                <th>Email ID</th>
                <td><%= user_email %></td>
            </tr>
            <tr>
                <th>Seats Booked</th>
                <td><%= seats %></td>
            </tr>
            <tr>
                <th>Ticket Status</th>
                <td>Confirmed</td>
            </tr>
            <tr>
                <th>Seats Allotment</th>
                <td>
                    <% for(String s : l) { %>
                        <%= s + " " %>
                    <% } %>
                </td>
            </tr>
            <tr>
                <th> Amount Paid</th>
                <td>Rs. <%=amt%></td>
            </tr>
        </table>
        <table>
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Booking","root","Dev_123goyal");
                Statement smt = cn.createStatement();
                ResultSet rs = smt.executeQuery("select * from Bus where id = " + id);
                if(rs.next()) {
            %>
                    <tr><th>Travel Agency Name</th><td><%= rs.getString("agency_name") %></td></tr>
                    <tr><th>Bus Number</th><td><%= rs.getString("Bus_no") %></td></tr>
                    <tr><th>Bus Type</th><td><%= rs.getString("Bus_type") %></td></tr>
                    <tr><th>Driver Name</th><td><%= rs.getString("Driver_name") %></td></tr>
                    <tr><th>Driver Contact</th><td><%= rs.getString("Driver_contact") %></td></tr>
                    <tr><th>Boarding City</th><td><%= rs.getString("city_from") %></td></tr>
                    <%
                    bc=rs.getString("city_from");
                    dc= rs.getString("Driver_contact");
                    String dep = rs.getString("dep_day") + " " + rs.getString("dep_date") + " " + rs.getString("dep_time");
                    bt=dep;
                    %>
                    <tr><th>Departure Details</th><td><%= dep %></td></tr>
                    <tr><th>Destination City</th><td><%= rs.getString("city_to") %></td></tr>
                    <%
                    String arr = rs.getString("arr_day") + " " + rs.getString("arr_date") + " " + rs.getString("arr_time");
                    %>
                    <tr><th>Arrival Details</th><td><%= arr %></td></tr>
                </table>
                <%
                    
                }
                cn.close();
            } catch(Exception e) {
                out.println("<p>Oops Payment Failed! Please try again.</p>");
                response.sendRedirect("userhome.jsp");
            }
            %>
            <%
            HttpSession hs = request.getSession(true);
            hs.setAttribute("bc", bc);
            hs.setAttribute("bt", bt);
            hs.setAttribute("dc", dc);
            hs.setAttribute("seattt", seattt);
            %>
            
        <div class="input-container">
            <form action="Done">
                <input type ="submit" value="okay" onclick="showAlert()">
            <form>
        </div>
    </div>
    <script>
        function showAlert() {
            alert("Thank you for booking your ticket! Ticket Message has been sent to Mail");
        }
    </script>
</body>
</html>
