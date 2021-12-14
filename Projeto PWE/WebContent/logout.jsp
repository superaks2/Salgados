<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	/*
	Cookie IdUsuario = new Cookie("IdUsuario","123456");
	IdUsuario.setMaxAge(0); // tempo que o cookie fica vivo
	response.addCookie(IdUsuario);// grava o cookie na maquina do cliente
	*/
	
	
	session.setAttribute("IdUsuario",null);
%>
</body>
</html>