<%-- 
    Document   : update
    Created on : 18-Feb-2024, 12:59:56 pm
    Author     : DEVANSH GOYAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Password</title>
    <style>
        body {
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
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        .container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .alert {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Password</h2>
        <%String mail = request.getParameter("mail");%>
        <form action="Updatepass" method="post" onsubmit="return chkpass()">
            <input type="text" value="<%= mail %>" name="mail" readonly >
            <input id="a" type="password" placeholder="Enter New Password" required>
            <input id="b" type="password" placeholder="Confirm New Password" name="newpass" required>
            <input type="submit" value="Update">
        </form>
        <div id="alert" class="alert"></div>
    </div>

    <script>
        function chkpass() {
            var a = document.getElementById("a").value;
            var b = document.getElementById("b").value;
            if (a === b) {
                return true;
            } else {
                document.getElementById("alert").innerText = "Password and Confirm Password Do Not Match";
                return false;
            }
        }
    </script>
</body>
</html>
