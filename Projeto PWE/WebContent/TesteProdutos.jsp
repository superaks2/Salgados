<%@page import="model.Produtos"%>
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
	String Valor = request.getParameter("Valor");
	String Tipo = request.getParameter("Tipo");
	String Id = request.getParameter("Id");

	
	String acao = request.getParameter("acao");

	if(acao != null){
		Produtos produtos = new Produtos(Nome,Valor,Tipo,Id);
		if(Integer.valueOf(acao)==1){
			produtos.save();
		}else if(Integer.valueOf(acao)==2){
			produtos.delete();
		}
	};
	
	String saida = new Produtos().listAll();
	response.getWriter().write(saida);
%>








	<form action="TesteProdutos.jsp" method="POST" class="form-horizontal">
		<h3>Cadastro Produto</h3>
		<div class="form-group">
			<label for="Nome">Produto</label>
			<input type="text" id="Nome" name="Nome" placeholder="Insira o nome do produto" class="form-control">
		</div>
		<div class="form-group">
			<label for="Valor">Valor</label>
			<input type="text" id="Valor" name="Valor" placeholder="Insira o Valor do produto" class="form-control">
		</div>
		<div class="form-group">
			<label for="Tipo">Tipo</label>
			<input type="text" id="Tipo" name="Tipo" placeholder="Insira o Tipo do produto" class="form-control">
		</div>
		<div class="form-group">
			<label for="Id">Id</label>
			<input type="text" id="Id" name="Id" placeholder="Insira o nome do Id" class="form-control">
		</div>
		
		<input type="hidden" name="acao" value="0">
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='1'; this.form.submit()">Salvar</button>
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='2'; this.form.submit()">Excluir</button>
		
	</form>



</body>
</html>