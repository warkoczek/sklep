<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose category</title>
</head>
<body>
<form action="products.jsp" method="get">
    <select name="Locale">
        <option value="tools">Narzędzia</option>
        <option value="plants">Rośliny</option>
        <option value="food">Żywność</option>
        <input type="submit" value="SET">
    </select>
</form>
</body>
</html>