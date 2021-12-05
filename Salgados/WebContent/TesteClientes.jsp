<%@page import="model.Clientes"%>
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
	String RG = request.getParameter("RG");
	String Telefone = request.getParameter("Telefone");

	
	String acao = request.getParameter("acao");

	if(acao != null){
		Clientes clientes = new Clientes(Nome,RG,Telefone);
		if(Integer.valueOf(acao)==1){
			clientes.save();
		}else if(Integer.valueOf(acao)==2){
			clientes.delete();
		}
	};
	
	String saida = new Clientes().listAll();
	response.getWriter().write(saida);
%>








	<form action="TesteClientes.jsp" method="POST" class="form-horizontal">
		<h3>Cadastro Clientes</h3>
		<div class="form-group">
			<label for="Nome">Nome</label>
			<input type="text" id="Nome" name="Nome" placeholder="Insira o nome do Cliente" class="form-control">
		</div>
		<div class="form-group">
			<label for="Telefone">Telefone</label>
			<input type="text" id="Telefone" name="Telefone" placeholder="Insira o Telefone do Cliente" class="form-control">
		</div>
		<div class="form-group">
			<label for="RG">RG</label>
			<input type="text" id="RG" name="RG" placeholder="Insira o RG do Cliente" class="form-control">
		</div>
		
		<input type="hidden" name="acao" value="0">
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='1'; this.form.submit()">Salvar</button>
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='2'; this.form.submit()">Excluir</button>
		
	</form>



</body>
</html>