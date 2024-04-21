<%-- 
    Document   : addbus
    Created on : 18-Feb-2024, 9:44:22 am
    Author     : DEVANSH GOYAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Bus</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            background-image: url('Images/Bg.png');
            margin: 0;
            padding: 0;
            color: #333; /* Text color */
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        input[type="text"], input[type="number"], input[type="date"], input[type="time"], input[type="submit"], input[type="radio"], select {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            margin-top: 20px;
            background-color: #3498db; 
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        label {
            color: #333; /* Text color */
        }
        h3 {
            margin-top: 20px; /* Add space above headings */
            padding-bottom: 10px;
            border-bottom: 1px solid #ccc; /* Bottom border for separation */
            color: #3498db; /* Blue for main headings */
        }
        span.error {
            color: #e74c3c; /* Red for error messages */
        }
        .bold {
            font-weight: bold; /* Bold words */
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

    </style>
    <script>
        function validateDateTime() {
            var depDate = new Date(document.getElementById("dep_date").value);
            var depTime = new Date("1970-01-01T" + document.getElementById("dep_time").value);
            var arrDate = new Date(document.getElementById("arr_date").value);
            var arrTime = new Date("1970-01-01T" + document.getElementById("arr_time").value);

            var now = new Date();

            if (depDate < now || (depDate.getTime() === now.getTime() && depTime < now)) {
                alert("Departure date and time must be in the future.");
                return false;
            }

            if (arrDate < now || (arrDate.getTime() === now.getTime() && arrTime < now)) {
                alert("Arrival date and time must be in the future.");
                return false;
            }

            return true;
        }

        function validateForm() {
            return validateDateTime();
        }
    </script>
</head>
<body>

    <div class="navbar">
        <a href="Logout">Log Out</a>
        <a href="showbus.jsp">Schedule</a>
        <a href="agencieshome.jsp">Home</a>
    </div>
    
    
<%
String agency_name = (String)session.getAttribute("agency_name");
String agency_email = (String)session.getAttribute("agency_email");

%>

<form action="Addbus" method="post" onsubmit="return validateForm()"> 
    <h3>Agency Information</h3>
    <input type="text" name="agency_name" placeholder="<%=agency_name%>" readonly required><br>
    <input type="text" name="agency_email" placeholder="<%=agency_email%>" readonly required><br>

    <h3>Bus Details</h3>
    
    <input type="text" name="Bus_no" placeholder="Enter Bus Number" required><br><br>

    <label><span class="bold">Select Bus Type:</span></label><br>
    <input type="radio" id="sleeperAC" name="Bus_type" value="Sleeper AC" required>
    <label for="sleeperAC">Sleeper AC</label><br>

    <input type="radio" id="acChaircar" name="Bus_type" value="AC Chaircar" required>
    <label for="acChaircar">AC Chair car</label><br>

    <input type="radio" id="sleeperNonAC" name="Bus_type" value="Sleeper Non AC" required>
    <label for="sleeperNonAC">Sleeper Non AC</label><br>

    <input type="radio" id="nonACChaircar" name="Bus_type" value="Non AC Chaircar" required>
    <label for="nonACChaircar">Non AC Chair car</label><br><br>

    <input type="number" name="total_seats" placeholder="Enter Total Seats in Bus" min="10" max="50" required><br>
    <span class="error"><%=request.getAttribute("totalSeatsError") %></span><br>

    <h3>Operator Details</h3>
   
    <input type="text" name="Driver_name" placeholder="Enter Driver Name" required><br>

    
    <input type="text" name="Driver_contact" placeholder="Enter Driver Phone Number " required><br>
    <span class="error"><%=request.getAttribute("driverContactError") %></span><br>

    <h3>Journey Details</h3><br>
    
    <h4>Journey From</h4>
    <input type="text" name="city_from" placeholder="Bus Start From City or Town" required><br><br>

    <label for="dep_date">Departure Date:</label>
    <input type="date" id="dep_date" name="dep_date" required><br>

    <label for="dep_time">Departure Time:</label>
    <input type="time" id="dep_time" name="dep_time" required><br>

    <label for="dep_day">Departure Day:</label>
    <select id="dep_day" name="dep_day" required>
        <option value="Monday">Monday</option>
        <option value="Tuesday">Tuesday</option>
        <option value="Wednesday">Wednesday</option>
        <option value="Thursday">Thursday</option>
        <option value="Friday">Friday</option>
        <option value="Saturday">Saturday</option>
        <option value="Sunday">Sunday</option>
    </select><br><br>
    <h4>Journey To</h4>
    <input type="text" name="city_to" placeholder="Bus Destination City or Town" required><br><br>

    <label for="arr_date">Arrival Date:</label>
    <input type="date" id="arr_date" name="arr_date" required><br>

    <label for="arr_time">Arrival Time:</label>
    <input type="time" id="arr_time" name="arr_time" required><br>

    <label for="arr_day">Arrival Day:</label>
    <select id="arr_day" name="arr_day" required>
        <option value="Monday">Monday</option>
        <option value="Tuesday">Tuesday</option>
        <option value="Wednesday">Wednesday</option>
        <option value="Thursday">Thursday</option>
        <option value="Friday">Friday</option>
        <option value="Saturday">Saturday</option>
        <option value="Sunday">Sunday</option>
    </select><br><br>
    <h4>Fare</h4>
    <input type="number"  name="rate" placeholder="Enter Ticket Price" min="0" required><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>
