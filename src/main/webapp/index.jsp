<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<html>
<body>
<h2>tagLib : core: when-choose</h2>
<%
    int pen = 2550 + (int)(Math.random()*200);
%>
<%@ page import="model.User, java.security.MessageDigest" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<html>
<body>
<h2>Hello from SD Academy</h2>
    <%
    User user1 = new User();
    user1.setName("Jan");
    user1.setPassword("abc");
    User user2 = new User();
    user2.setName("Anna");
    user2.setPassword("bcd");
%>
User name: <%=user1.getName()%><br/>
Password : <%=user1.getPassword()%>
<%
    Cookie cookie1 = new Cookie("user1", user1.getName());
    Cookie cookie2 = new Cookie("user2", user2.getName());
    Cookie cookie3 = new Cookie(user2.getName(), user2.getPassword());
    response.addCookie(cookie1);
    response.addCookie(cookie2);
    response.addCookie(cookie3);
    //region zamiana hasła na MD5
    String password = "abc012";
    MessageDigest md = MessageDigest.getInstance("MD5");
    byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

    StringBuilder sb = new StringBuilder();
    for (byte b : hashInBytes) {
        sb.append(String.format("%02x", b));
    }
    response.addCookie(new Cookie(password, sb.toString().toLowerCase()));
    //endregion
    //przekierowanie
    response.sendRedirect("/sklep/login.jsp");
%>