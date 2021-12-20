<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp" %>
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Pedido finalizado com sucesso!</h2>
        </div>
    </div>
</section>
<section class="secao">
    <div class="container">
    	<div class="row">
    		<div class="col-12">
				<div class="carrinho-container rounded bg-white p-4 mt-2 row">
					<table class="table">
						<thead>
							<tr>
								<th>Pedido</th>
								<th>Preço</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody class="tabela-carrinho">
						</tbody>
					</table>
				</div>
    		</div>
    	</div>
    	<div class="row mt-4">
			<div class="col-3 p-4 rounded bg-white ms-auto">
			<h5>Custos do Pedido</h5>
			<hr>
			<p class="mb-0">
				<span class="price fw-bold fs-6 me-4">Total</span> <span class="valor-total-geral">R$ 00,00</span>
			</p>
		</div>
	</div>
	</div>
</section>
<%@include file="estrutura/footer.jsp"%>

<script>

	initCartData.subscribe(updateHTMLCart)
	
	// Atualiza o html do carrinho na tabela da página e reseta carrinho
	function updateHTMLCart(productData) {
		const tabelaCarrinho = document.querySelector('.tabela-carrinho')
		console.log(productData)
		productData.forEach(produto => {			
			$(tabelaCarrinho).append(createHTMLPedidoFinalizado(produto))
		})
		
		localStorage.setItem('cart', JSON.stringify([]))
	}
	
	// Oculta carrinho
	const carrinhoMenu = document.querySelector('#carrinho-menu')
	carrinhoMenu.classList.add('d-none')


</script>