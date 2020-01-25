<%@ page import="model.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping cart</title>
</head>
<body>
<%@include file="header.jsp"%>
<div>
<h3>Your shopping cart</h3>
<%
    List<Item> koszyk = (ArrayList<Item>)session.getAttribute("shoppingCart");
    double suma = 0;
    for(Item item : koszyk) {
        out.print("<p>" + item.getProduct() + ", quantity: " + item.getQuantity() + ", price: " + item.getPrice() + "</p>");
        suma += item.getQuantity()*item.getPrice();
    }
    out.print("<br/>Total price : " + String.format("%.2f", suma));
    Cookie[] ciastka = request.getCookies();
    //wyświetlenie ciasteczka o kluczu o wartości zalogowany użytkownik
    String login = (String)session.getAttribute("user");
    for(Cookie cookie : ciastka) {
        if (cookie.getName().equals(login)) {
            String st = cookie.getValue();
            st = st.replace("^%", "\"");
            st = st.replace("!%", ",");
            System.out.println(st);
            Gson json = new Gson();
            Item[] items = json.fromJson(st, Item[].class);
            out.print("<br/>Products in cookie (shopping cart):<br/>");
            for (Item item : items)
                out.print("<p>" + item.getProduct() + " " + item.getQuantity() + "</p>");
        }
    }
%>
</div>
<%@include file="footer.jsp"%>
</body>
</html>