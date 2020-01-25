<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello tu Darek</title>
</head>
<body>
<%
    // To jest skryptlet.  Zauważ, że zmienna
    java.util.Date date = new java.util.Date();
    System.out.println( "Komunikat ze skryptletu. Data: " + date);
%>
<p>To jest inna sprawa: kichać to!</p>
<p>Obecnie mamy <%= (date.getYear()+ 1900) +"-" + (date.getMonth()+1) + "-" + date.getDate() %></p>
</body>
</html>