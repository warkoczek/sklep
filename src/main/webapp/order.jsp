<%@ page import="model.Item, java.util.List, java.util.ArrayList, java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="model.DatabaseConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <link href="styl.css" rel="stylesheet"/>
    <title>Create order</title>
</head>
<body>
<h2>Create new order</h2>
<%@include file="header.jsp"%>
<%
    List<Item> koszyk = (ArrayList<Item>)session.getAttribute("shoppingCart");
    String dbUSER = (String)session.getAttribute("dbUSER");
    String dbPASS = (String)session.getAttribute("dbPASS");
    String login = (String)session.getAttribute("user");
    double suma = 0;
    for(Item item : koszyk) {
        out.print("<p>" + item.getProduct() + ", quantity: " + item.getQuantity() + ", price: " + item.getPrice() + "</p>");
        suma += item.getQuantity()*item.getPrice();
    }
    out.print("<br/>Total price : " + String.format("%.2f", suma));
    String category = request.getParameter("category");
    System.out.println("category: " + category);
    if (category == null)
        category = "all";
    String sort = request.getParameter("sort");
    System.out.println("sort: " + sort);
    if (sort == null)
        sort = "name";
    Statement stmt = null;
    ResultSet rs;
    String firstName = "";
    String lastName ="";
    String city = "";
    String code = "";
    String street = "";
    String streetNumber = "";
    rs = null;
    try {
        Connection conn = DatabaseConnection.initializeDatabase("sklep", dbUSER, dbPASS);
        stmt = conn.createStatement();
        String sql = "SELECT * FROM users where login = \'" + login + "\'";
        rs = stmt.executeQuery(sql);
        rs.next();
        firstName = rs.getString("firstName");
        lastName = rs.getString("lastName");
        city = rs.getString("city");
        code = rs.getString("code");
        street = rs.getString("street");
        streetNumber = rs.getString("streetNumber");
    }
    catch(ClassNotFoundException cnfe) {
        System.out.println("!!!" + cnfe.getMessage());
    }
    catch(SQLException se) {
        System.out.println("@@@"  +se.getMessage());
    }
%>
<c:set var="first" value="<%=firstName%>"/>
<c:set var="last" value="<%=lastName%>"/>
<div style="position: center; background-color: antiquewhite ">
    <form action="newOrder" method="post">
        Your first name:<input type="text" class="textBox" name="firstName" value="${first}"><br/>
        Your last name :<input type="text" class="textBox" name="lastName" value="${last}"><br/>
        City: <input type="text" class="textBox" name="city" value="<%=city%>"><br/>
        City code:<input type="text" class="textBox" name="code" value="<%=code%>" width="6"><br/>
        Street address: <input type="text" class="textBox" name="street" value="<%=street%>"><br/>
        Street number: <input type="text" class="textBox" name="streetNumber" value="<%=streetNumber%>" width="8"><br/>
        Editional comment: <input type="text" class="textBox" name="comments"><br/>
        <input class="button" type="submit" title="Create order">
    </form>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
