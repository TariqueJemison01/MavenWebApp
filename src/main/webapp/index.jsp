<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Get the current time
    Date currentTime = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("HH");
    int hour = Integer.parseInt(sdf.format(currentTime));

    // Get the name from the request, replace "John" with the actual variable
    String name = request.getParameter("name") != null ? request.getParameter("name") : "Tarique";

    // Greeting message based on the time of the day
    String greeting;
    if (hour >= 0 && hour < 12) {
        greeting = "Good morning";
    } else if (hour >= 12 && hour < 18) {
        greeting = "Good afternoon";
    } else {
        greeting = "Good evening";
    }
%>

<html>
<body>
    <h2><%= greeting %>, <%= name %>, Welcome to COMP367!</h2>
</body>
</html>
