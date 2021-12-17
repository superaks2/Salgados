<!-- ESTRUTURA  -->
<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp"%>
<!-- END ESTRUTURA -->

<!-- BANNER -->
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Meu Carrinho ${teste}</h2>
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
			<tbody>
				<tr>
					<td>
						<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
						<span>Pedido loco aqui</span>
					</td>
					<td>a calcular</td>
					<td>R$ 25,50</td>
					<td>
						<div class="input-group input-group-sm input-add w-25">
						  <button class="btn btn-outline-secondary left" type="button"><span class="fa fa-minus"></span></button>
						  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
					      <button class="btn btn-outline-secondary right" type="button"><span class="fa fa-plus"></span></button>
						</div>
					</td>
					<td>R$ 9,99</td>
					<td><a href="#" class="link-dark"><i class="fas fa-times"></i></a></td>
				</tr>
				<tr>
					<td>
						<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
						<span>Pedido loco aqui</span>
					</td>
					<td>a calcular</td>
					<td>R$ 25,50</td>
					<td>
						<div class="input-group input-group-sm input-add w-25">
						  <button class="btn btn-outline-secondary left" type="button"><span class="fa fa-minus"></span></button>
						  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
					      <button class="btn btn-outline-secondary right" type="button"><span class="fa fa-plus"></span></button>
						</div>
					</td>
					<td>R$ 9,99</td>
					<td><a href="#" class="link-dark"><i class="fas fa-times"></i></a></td>
				</tr>
				<tr>
					<td>
						<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
						<span>Pedido loco aqui</span>
					</td>
					<td>a calcular</td>
					<td>R$ 25,50</td>
					<td>
						<div class="input-group input-group-sm input-add w-25">
						  <button class="btn btn-outline-secondary left" type="button"><span class="fa fa-minus"></span></button>
						  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
					      <button class="btn btn-outline-secondary right" type="button"><span class="fa fa-plus"></span></button>
						</div>
					</td>
					<td>R$ 9,99</td>
					<td><a href="#" class="link-dark"><i class="fas fa-times"></i></a></td>
				</tr>
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
			<span class="price fw-bold fs-6 me-4">Total</span> <span>R$ 35,90</span>
		</p>
		</div>
	</div>
	
	<div class="btn-container d-flex">
		<a class="btn btn-primary style-1 ms-auto" href="./checkout.jsp"><i class="fas fa-shopping-cart"></i> Finalizar Pedido</a>
	</div>

</div>


<!-- ESTRUTURA  -->
<%@include file="estrutura/footer.jsp" %>
<!-- END ESTRUTURA -->