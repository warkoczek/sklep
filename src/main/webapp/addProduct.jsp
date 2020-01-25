<%@ page import="com.google.gson.Gson" %>
<%@ page import="model.Item" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.GsonBuilder" %><%--
 Dodanie produktu do koszyka
 a potem powrót do strony 'products.jsp'
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product</title>
</head>
<body>
<%
    String product = request.getParameter("product");
    String quantity = request.getParameter("quantity");
    System.out.println("quantity: " + quantity);
    String category = request.getParameter("category");
    double price = Double.parseDouble(request.getParameter("price"));
    String sort = request.getParameter("sort");
    System.out.println("@category: " + category);
    System.out.println("@sort:" + sort);
    out.print("<p>product: " + product + "</p>");
    out.print("<p>quantity: " + quantity + "</p>");
    List<Item> koszyk = (ArrayList<Item>)session.getAttribute("shoppingCart");
    if (koszyk == null)
        koszyk = new ArrayList<>();
    int cartSize = (int)session.getAttribute("shoppingCartSize");
    // sprawdzenie czy produkt już jest w koszyku (jeśli tak, to zwiększenie jego liczby sztuk)
    boolean jest = false;
    for(Item item : koszyk) {
        if (item.getProduct().compareTo(product)==0) {
            int ile0 = item.getQuantity();
            int ile1 = Integer.parseInt(quantity);
            int razem = ile0 + ile1;
            item.setQuantity(razem);
            item.setPrice(price);
            System.out.println("produkt: " + product + " razem:" + razem);
            jest = true;
            break;
        }
    }
    if (!jest) {
        koszyk.add(new Item(product, Integer.parseInt(quantity), price));
        cartSize++;
    }
    session.setAttribute("shoppingCartSize", cartSize);
    session.setAttribute("shoppingCart", koszyk);
    String user = (String)session.getAttribute("user");
    Gson json = new GsonBuilder().create();
    String ciastko = json.toJson(koszyk);
    ciastko = ciastko.replace("\"", "^%");
    ciastko = ciastko.replace(",",  "!%");
    System.out.println(ciastko);
    Cookie cookie = new Cookie(user, ciastko);
    response.addCookie(cookie);
    Thread.sleep(300);
    response.sendRedirect("products.jsp?category=" + category + "&sort=" + sort);
%>
</body>
</html>
