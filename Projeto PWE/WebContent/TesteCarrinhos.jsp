<%@page import="model.Carrinhos"%>
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
	String Valor = request.getParameter("Valor");
	String FK_Produtos = request.getParameter("FK_Produtos");
	String FK_Clientes = request.getParameter("FK_Clientes");
	String Metodo_Pagamento = request.getParameter("Metodo_Pagamento");
	String Id = request.getParameter("Id");
	String FK_RG = request.getParameter("FK_RG");

	
	String acao = request.getParameter("acao");

	if(acao != null){
		Carrinhos carrinhos = new Carrinhos(Valor,FK_Produtos,FK_Clientes,Metodo_Pagamento,Id,FK_RG);
		if(Integer.valueOf(acao)==1){
			carrinhos.save();
		}else if(Integer.valueOf(acao)==2){
			carrinhos.delete();
		}
	};
	
	String saida = new Carrinhos().listAll();
	response.getWriter().write(saida);
%>








	<form action="TesteProdutos.jsp" method="POST" class="form-horizontal">
		<h3>Carrinhos</h3>
		<div class="form-group">
			<label for="Valor">Valor</label>
			<input type="text" id="Valor" name="Valor" placeholder="Insira o valor total do carrinho" class="form-control">
		</div>
		<div class="form-group">
			<label for="FK_Produtos">FK_Produtos</label>
			<input type="text" id="FK_Produtos" name="FK_Produtos" placeholder="Insira o ID do Produto" class="form-control">
		</div>
		<div class="form-group">
			<label for="FK_Clientes">FK_Clientes</label>
			<input type="text" id="FK_Clientes" name="FK_Clientes" placeholder="Insira o ID do Cliente" class="form-control">
		</div>
		<div class="form-group">
			<label for="Metodo_Pagamento">Metodo_Pagamento</label>
			<input type="text" id="Metodo_Pagamento" name="Metodo_Pagamento" placeholder="Insira o metodo de pagamento" class="form-control">
		</div>
		<div class="form-group">
			<label for="Id">Id</label>
			<input type="text" id="Id" name="Id" placeholder="Insira do Id" class="form-control">
		</div>
		<div class="form-group">
			<label for="FK_RG">FK_RG</label>
			<input type="text" id="FK_RG" name="FK_RG" placeholder="Insira o RG do Cliente" class="form-control">
		</div>
		
		
		<input type="hidden" name="acao" value="0">
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='1'; this.form.submit()">Salvar</button>
		<button type="button" id="btnProdutos" class="btn btn-primary" onclick="acao.value='2'; this.form.submit()">Excluir</button>
		
	</form>



</body>
</html>