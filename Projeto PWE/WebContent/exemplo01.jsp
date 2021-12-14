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

	String IdUsuario = (String) session.getAttribute("IdUsuario");

	if(IdUsuario == null){
		out.write("Usuário não logado no session");
	}else{
		out.write("Usuário logado no session" + IdUsuario);
	}
%>

</body>
</html>