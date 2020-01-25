<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*" %>
<%@ page import = "model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1250">
<title>Walidowanie użytkownika</title>
</head>
<body>
<!-- Użycie tagu jsp:useBean. Tag ten szuka obiektu klasy User z pakiecie
	web-zima2019.model w sesji użytkownika. Jeśli znajdzie, to go 
	wykorzysta, jeśli nie stworzy nowy obiekt klasy user o nazwie "user"-->
	<jsp:useBean 
		id= "user" class= "model.User" scope= "session">
	</jsp:useBean>

	<!-- Użycie tagu jsp:setProperty. Tag ten umieszcza wszystkie parametry
	przesyłane z innych plików jsp pasujące do obiektu o nazwie user. Jeśli
	parametry te nie będą się zgadzać, tomcat wyrzuci wyjątkiem -->
	<jsp:setProperty property="*" name="user" />

	<!-- Ponowne użycie tagu jsp:useBean ładujący źródło danych. -->
	<jsp:useBean id="dataSource"
		class="model.DataSource" scope="session">
	</jsp:useBean>

	<!-- Wyświetlenie nazwy użytkownika. -->
	Nazwa: <%= user.getName() %><br />


	<% String result = "Dane niepoprawne";

	if(dataSource.userExists(user)) {
		result = "Poprawny użytkownik oraz hasło";
		}
	%>
	<!-- Zwrócenie wynikowego stringa "result" -->
	<%= result %>
	<h2>Parametry poprzedniej storny:</h2>
	<p>Request method: ${pageContext.request.method}</p>
	<p>App id: ${initParam.AppId}</p>
	<p>Port: ${pageContext.request.localPort}</p>
</body>
</html>