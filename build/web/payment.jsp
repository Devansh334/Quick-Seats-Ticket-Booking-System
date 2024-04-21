<%-- 
    Document   : payment
    Created on : 20-Apr-2024, 11:46:13 pm
    Author     : DEVANSH GOYAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Payment</title>
    <style>
        body {
            background-image: url('Images/Bg.png');
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        
        .container {
            margin-top: 50px;
        }
        
        h1 {
            font-size: 24px;
            color: #007bff; /* Blue color */
            margin-bottom: 20px;
        }
        
        .qr-code {
            margin-bottom: 20px;
        }
        
        #box {
            margin-bottom: 10px;
        }
        
        label {
            font-size: 16px;
        }
        
        input[type="checkbox"] {
            margin-right: 10px;
        }
        
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
        String amt = (String)session.getAttribute("amt");
        %>
    <div class="container">
        <h1>Pay Rs.<%=amt%> by Scanning the Given QR Code</h1>
        <div class="qr-code">
            <img src="Images/qr.png" height="200px" width="200px" alt="QR Code">
        </div>
        <form action="ticket.jsp" method="post">
            <input type="checkbox" id="box" required>
            <label for="box">I hereby declare that I have made successful payment</label>
            <br><br>
            <input type="submit" value="Done">
        </form>
    </div>
</body>
</html>
