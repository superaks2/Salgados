<%@page import="model.Vendas"%>
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
	String Quantidade = request.getParameter("Quantidade");
	String ValorTotal = request.getParameter("ValorTotal");
	String Data = request.getParameter("Data");
	String Id = request.getParameter("Id");
	String FK_Carrinhos = request.getParameter("FK_Carrinhos");
	String FK_Produtos = request.getParameter("FK_Produtos");

	
	String acao = request.getParameter("acao");

	if(acao != null){
		Vendas vendas = new Vendas(Quantidade,ValorTotal,Data,Id,FK_Carrinhos,FK_Produtos);
		if(Integer.valueOf(acao)==1){
			vendas.save();
		}else if(Integer.valueOf(acao)==2){
			vendas.delete();
		}
	};
	
	String saida = new Vendas().listAll();
	response.getWriter().write(saida);
%>








	<form action="TesteVendas.jsp" method="POST" class="form-horizontal">
		<h3>Cadastro Produto</h3>
		<div class="form-group">
			<label for="Quantidade">Quantidade</label>
			<input type="text" id="Quantidade" name="Quantidade" placeholder="Insira a Quantidade de produtos" class="form-control">
		</div>
		<div class="form-group">
			<label for="Valor">Valor Total</label>
			<input type="text" id="Valor" name="Valor" placeholder="Insira o Valor total da venda" class="form-control">
		</div>
		<div class="form-group">
			<label for="Data">Data</label>
			<input type="text" id="Data" name="Data" placeholder="Insira a Data da venda" class="form-control">
		</div>
		<div class="form-group">
			<label for="Id">Carrinho</label>
			<input type="text" id="Id" name="Id" placeholder="Insira o nome do Id" class="form-control">
		</div>
		<div class="form-group">
			<label for="FK_Produtos">Produto</label>
			<input type="text" id="FK_Produtos" name="FK_Produtos" placeholder="Insira o Id do produto" class="form-control">
		</div>
		
		<input type="hidden" name="acao" value="0">
		<button type="button" id="btnVendas" class="btn btn-primary" onclick="acao.value='2'; this.form.submit()">Excluir</button>
		
	</form>



</body>
</html>