<%@page import="model.Usuarios"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String Nome = request.getParameter("Nome");
	String Senha = request.getParameter("Senha");
	String Email = request.getParameter("Email");
	String Nivel_acesso = request.getParameter("Nivel_acesso");
	String Id = request.getParameter("Id");
	String FK_rg = request.getParameter("FK_rg");

	
	String acao = request.getParameter("acao");

	if(acao != null){
		Usuarios usuarios = new Usuarios(Nome,Senha,Email,Nivel_acesso,Id,FK_rg);
		if(Integer.valueOf(acao)==1){
			usuarios.save();
		}else if(Integer.valueOf(acao)==2){
			usuarios.delete();
		}
	};
	
	String saida = new Usuarios().listAll();
	response.getWriter().write(saida);
%>








	<form action="TesteUsuario.jsp" method="POST" class="form-horizontal">
		<h3>Cadastro Usuarios</h3>
		<div class="form-group">
			<label for="Nome">Nome</label>
			<input type="text" id="Nome" name="Nome" placeholder="Insira o nome do produto" class="form-control">
		</div>
		<div class="form-group">
			<label for="Senha">Senha</label>
			<input type="password" id="Senha" name="Senha" placeholder="Senha do Usuario" class="form-control">
		</div>
		<div class="form-group">
			<label for="Email">Email</label>
			<input type="Email" id="Email" name="Email" placeholder="Insira o Email" class="form-control">
		</div>
		<div class="form-group">
			<label for="Nivel_acesso">Nivel_acesso</label>
			<input type="text" id="Nivel_acesso" name="Nivel_acesso" placeholder="Nivel de acesso do usuario" class="form-control">
		</div>
		<div class="form-group">
			<label for="FK_rg">FK_rg</label>
			<input type="text" id="FK_rg" name="FK_rg" placeholder="RG do cliente" class="form-control">
		</div>
		
		<input type="hidden" name="acao" value="0">
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='1'; this.form.submit()">Salvar</button>
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='2'; this.form.submit()">Excluir</button>
		
	</form>



</body>
</html>