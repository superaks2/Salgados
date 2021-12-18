<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- ESTRUTURA  -->
<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp"%>
<!-- END ESTRUTURA -->

<!-- BANNER -->
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Meu Carrinho</h2>
        </div>
    </div>
</section>
<!-- END BANNER -->

<div class="container" data-aos="fade-up">

	<div class="carrinho-container rounded bg-white p-4 mt-5 row">
		<table class="table">
			<thead>
				<tr>
					<th>Pedido</th>
					<th>Entrega</th>
					<th>Preço</th>
					<th>Quantidade</th>
					<th>Total</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="tabela-carrinho">
			</tbody>
		</table>
	</div>
	
	<div class="row mt-4">
		<div class="col-3 p-4 rounded bg-white ms-auto">
		<h5>Custos do Pedido</h5>
		<hr>
		<p class="mb-1">
			<span class="me-4 fs-6">Frete</span> <span class="text-green">Grátis</span>
		</p>
		<p class="mb-0">
			<span class="price fw-bold fs-6 me-4">Total</span> <span class="valor-total-geral">R$ 35,90</span>
		</p>
		</div>
	</div>
	
	<div class="btn-container d-flex">
		<a class="btn btn-primary style-1 ms-auto" href="<%= request.getContextPath() %>/app/checkout.jsp"><i class="fas fa-shopping-cart"></i> Finalizar Pedido</a>
	</div>

</div>


<!-- ESTRUTURA  -->
<%@include file="estrutura/footer.jsp" %>
<!-- END ESTRUTURA -->


<!-- SCRIPTS CARRINHO -->
<script>
	initCartData.subscribe(updateHTMLCart)
	
	// Atualiza o html do carrinho na tabela da página
	function updateHTMLCart(productData) {
		const tabelaCarrinho = document.querySelector('.tabela-carrinho')
		console.log(productData)
		productData.forEach(produto => {			
			$(tabelaCarrinho).append(createHTMLCartPag(produto))
		})
	}
	

</script>
<!-- END SCRIPTS CARRINHO -->