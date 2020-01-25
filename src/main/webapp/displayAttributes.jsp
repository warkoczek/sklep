<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<html>
<head>
    <title>tagLib: remove</title>
</head>
<body>
<h2>Atrybuty, które zostały</h2>
<!-- usuwamy atrybut 'kontynent' -->
<c:remove var = "kontynent"/>

<p> <b>Miasto</b>:
    <c:out value="${miasto}"    default="Atrybut nie ma wartości"/>
</p>
<p> <b>Kraj</b>:
    <c:out value="${kraj}"      default="Atrybut nie ma wartości"/>
</p>
<p> <b>Kontynent</b>:
    <c:out value="${kontynent}" default="Atrybut nie ma wartości"/>
</p>

</body>
</html>
