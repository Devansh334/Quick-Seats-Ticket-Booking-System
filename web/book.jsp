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
    <title>Book Now</title>
    <style>
        body {
            background-image: url('Images/Bg.png');
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input {
            width: calc(100% - 22px); /* Adjusted width to accommodate the label */
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group input[readonly] {
            background-color: #f2f2f2;
            cursor: not-allowed;
        }

        .form-group input[type="number"] {
            width: 100%;
            -moz-appearance: textfield;
        }

        .form-group input[type="number"]::-webkit-inner-spin-button, 
        .form-group input[type="number"]::-webkit-outer-spin-button { 
            -webkit-appearance: none;
            margin: 0;
        }

        .form-group input[type="number"]:disabled {
            background-color: #f2f2f2;
            cursor: not-allowed;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input[type="number"] {
            width: calc(100% - 22px);
            float: left;
            margin-right: 10px;
        }

        .form-group input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .amount-label {
            display: block;
            font-size: 14px;
            margin-top: 10px;
            color: #333;
        }

        .amount-label input[type="number"] {
            width: calc(100% - 22px); /* Adjusted width to match other input fields */
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #f2f2f2;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    
    <%
        String id = request.getParameter("id");
        int rate = Integer.parseInt(request.getParameter("rate"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        HttpSession hs = request.getSession(true);
        hs.setAttribute("bus_id", id);
        hs.setAttribute("ts", seats);
        String user_email = (String) session.getAttribute("user_email");
        String user_name = (String) session.getAttribute("user_name");
    %>
    <div class="container">
        <form id="bookingForm" action="Chkbook" method="post">
            <div class="form-group">
                <label for="userName">Name:</label>
                <input type="text" id="userName" value="<%= user_name %>" readonly>
            </div>
            <div class="form-group">
                <label for="userEmail">Email:</label>
                <input type="text" id="userEmail" value="<%= user_email %>" readonly>
            </div>
            <div class="form-group">
                <label for="seats">Number of Seats:</label>
                <input type="number" min="1" max="<%= seats %>" name="seats" id="seats" placeholder="Enter No of seats" oninput="calculateAmount()">
            </div>
            <br><br>
            <div class="form-group">
                <label for="amount" class="amount-label">Total Amount:</label>
                <input type="number" id="amount" name="amt" readonly>
            </div>
            <br><br>
            <div class="form-group">
                <input type="submit" value="Proceed To Pay">
            </div>
        </form>
    </div>
   
    <script>
        function calculateAmount() {
            var seats = parseInt(document.getElementById("seats").value);
            var rate = <%= rate %>; // Assuming rate is passed from the server-side
            var amount = seats * rate;
            document.getElementById("amount").value = amount;
        }
    </script>
</body>
</html>
