<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Odbiór ciasteczek</title>
</head>
<body>
<h2>Strona odbierająca ciasteczka i MD5</h2>
<%
    Cookie[] cookies = request.getCookies();
    out.print("<h2>Ciasteczka:</h2>");
    for(Cookie cookie : cookies)
        out.print("<p>" + cookie.getName() +" , " + cookie.getValue() + "</p>");
%>
</body>
</html>
