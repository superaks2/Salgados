<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp" %>
<section class="secao bg-white">
	<div class="container">
		<div class="row">
			<h4 class="col mb-4">Finalizar Pedido</h4>
		</div>
		<div class="row">
			<div class="col-4 bloco-dados">
				<div class="col-12 border rounded p-3">
					<h6 class="mb-3">Dados Pessoais</h6>
					<p>
						<small>Solicitamos apenas as informações essenciais para realização da compra.</small>
					</p>
					<form class="row">
					  	<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">@</span>
						  <input type="text" class="form-control normal" placeholder="email@hotmail.com" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">Nome e Sobrenome</span>
						  <input type="text" class="form-control normal" placeholder="nome" aria-label="email">
						  <input type="text" class="form-control normal" placeholder="sobrenome" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">RG</span>
						  <input type="text" class="form-control normal" placeholder="999.9999.99-1" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">Telefone</span>
						  <input type="text" class="form-control normal" placeholder="(11) 9999-9999" aria-label="telefone">
						</div>
						<div class="input-group input-group-sm">
							<button class="btn btn-sm btn-success text-uppercase fw-bold ms-auto">Ir para Entrega</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-4">
				<div class="col-12 rounded border p-3 h-100 d-flex flex-column">
					<h6 class="mb-3">Entrega</h6>
					<form class="row">
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="cep">CEP</span>
						  <input type="text" class="form-control normal" placeholder="99999-999" aria-label="cep">
						</div>
						<div class="mb-3">
							<small class="fw-bold">Endereço de entrega</small>
							<div class="endereco-entrega p-2 border rounded d-flex mt-2">
								<div class="icone me-3 fs-2 text-primary"><i class="fas fa-house-user"></i></div>
								<small class="">Rua X<br>Bairro - São Paulo / SP</small>
							</div>
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="cep">Nº</span>
						  <input type="text" class="form-control normal" placeholder="999" aria-label="número">
						  <span class="input-group-text" id="cep">Comp.</span>
						  <input type="text" class="form-control normal" placeholder="Apt. 9" aria-label="complemento">
						</div>
					</form>
					<div class="input-group input-group-sm mt-auto">
						<button class="btn btn-sm btn-success text-uppercase fw-bold ms-auto">Ir para Pagamento</button>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="col-12 rounded border p-3 h-100 d-flex flex-column">
					<h6 class="mb-3">Resumo do Pedido</h6>
					<ul class="list-unstyled p-0">
						<li class="pb-2 border-bottom mb-2">
							<div class="d-flex justify-content-between">
								<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
				                	<img src="https://i.imgur.com/7rjovw8.jpg">
				             	 </figure>
				             	 <span class="me-auto">2 x Coxinha</span>
				             	 <small class="fw-bold">R$ 32,90</small>
			             	 </div>
						</li>
						<li class="pb-2 border-bottom mb-2">
							<div class="d-flex justify-content-between">
								<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
				                	<img src="https://i.imgur.com/7rjovw8.jpg">
				             	 </figure>
				             	 <span class="me-auto">2 x Coxinha</span>
				             	 <small class="fw-bold">R$ 32,90</small>
			             	 </div>
						</li>
						<li class="pb-2 border-bottom mb-2">
							<div class="d-flex justify-content-between">
								<figure class="rounded overflow-hidden mb-0 me-3" style="max-width: 30px; display: inline-table;">
				                	<img src="https://i.imgur.com/7rjovw8.jpg">
				             	 </figure>
				             	 <span class="me-auto">2 x Coxinha</span>
				             	 <small class="fw-bold">R$ 32,90</small>
			             	 </div>
						</li>
					</ul>
					<div class="total-pedido d-flex justify-content-end align-items-end flex-column">
						<p class="text-muted">
							<small class="me-4">Subtotal</small> R$ 32,90
						</p>
						<p class="text-success fw-bold">
							<small class="me-4">Total</small> R$ 32,90
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="estrutura/footer.jsp"%>