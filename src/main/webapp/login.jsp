<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <link href="styl.css" rel="stylesheet"/>
        <title>Log in to our shop</title>
</head>
<body>
<%
        Object userMsg = request.getAttribute("userMsg");
        String userMessage = "";
        if (userMsg != null)
                userMessage += userMsg;
        Object login = "";
        if(request.getParameter("user") != null)
                login = request.getAttribute("user");
        String passwordMessage = "";
        Object passwordMsg = request.getAttribute("passwordMsg");
        System.out.println("passwordMsg:" + passwordMsg);
        if(passwordMsg != null)
                passwordMessage = "" + request.getAttribute("passwordMsg") + "<br/>";
%>
<c:set var="loginValue" value="<%=login%>"/>
<%@include file="header.jsp"%>
<form method="post" action="waliduj">
        Input login:<br/>
        <input type="text" name="user" class="textBox" value="${loginValue}"/><br />
        <p style="color: red;"><%=userMessage%></p>
        Input password: <br/>
        <input type="password" name="password" class="textBox" /><br/><br/>
        <p style="color:red;"><%=passwordMessage%></p>
        <input class=\"button\" type="submit" value="log in to JSP&Servlets shop">
    </form>
<%@include file="footer.jsp"%>
</body>
</html>