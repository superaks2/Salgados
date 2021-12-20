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
					<form class="row form-dados">
					  	<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">@</span>
						  <input type="text" class="form-control normal" name="email" placeholder="email@hotmail.com" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">Nome</span>
						  <input type="text" class="form-control normal" name="nome" placeholder="nome" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">CPF</span>
						  <input type="text" class="form-control normal" name="cpf" placeholder="999.9999.99-1" aria-label="email">
						</div>
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="basic-addon1">Telefone</span>
						  <input type="text" class="form-control normal" name="telefone" placeholder="(11) 9999-9999" aria-label="telefone">
						</div>
					</form>
				</div>
			</div>
			<div class="col-4">
				<div class="col-12 rounded border p-3 h-100 d-flex flex-column">
					<h6 class="mb-3">Entrega</h6>
					<form class="row form-endereco">
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="cep">CEP</span>
						  <input type="text" class="form-control normal" name="cep" placeholder="99999-999" aria-label="cep">
						</div>
						<div class="mb-3">
							<small class="fw-bold">Endereço de entrega</small>
							<div class="endereco-entrega p-2 border rounded d-flex mt-2">
								<div class="icone me-3 fs-2 text-primary"><i class="fas fa-house-user"></i></div>
								<small class="endereco-texto"></small>
							</div>
						</div>
						<input type="hidden" name="endereco" value="preencher">
						<div class="input-group input-group-sm mb-3">
						  <span class="input-group-text" id="numero">Nº</span>
						  <input type="text" class="form-control normal" placeholder="999" aria-label="número">
						  <span class="input-group-text" id="complemento">Comp.</span>
						  <input type="text" class="form-control normal" placeholder="Apt. 9" aria-label="complemento">
						</div>
					</form>
					<div class="input-group input-group-sm mt-auto">
						<button class="btn btn-sm btn-success text-uppercase fw-bold ms-auto btn-finalizar">
						<span class="spinner-grow spinner-grow-sm d-none" role="status" aria-hidden="true"></span>
						Finalizar Pedido
						</button>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="col-12 rounded border p-3 h-100 d-flex flex-column">
					<h6 class="mb-3">Resumo do Pedido</h6>
					<ul class="list-unstyled p-0 lista-carrinhos" style="max-height: 200px; overflow: auto;">
					</ul>
					<div class="total-pedido d-flex justify-content-end align-items-end flex-column">
						<p class="text-success fw-bold">
							<small class="me-4">Total</small> <span class="valor-total-geral">R$ 32,90</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="estrutura/footer.jsp"%>

<!-- Modal ALERTA -->
<div class="modal fade" id="modal-aviso" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Aviso</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <p class="modal-aviso-texto">
       	Preencha todos os dados!
       </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<script>
	// Preenche o HTML com os dados do produto no carrinho
	initCartData.subscribe(updateHTMLCart)
	
	function updateHTMLCart(productData) {
		const listaCarrinho = document.querySelector('.lista-carrinhos')
		productData.forEach(produto => {
			$(listaCarrinho).append(createHTMLCheckoutPag(produto))
		})
	}
	
	// Auto completa cep
	const keyCep = document.querySelector('input[name="cep"]')
	keyCep.addEventListener('keyup', function(e) {
		if(this.value.length == 8) {
			this.setAttribute('disabled', true)
			$.ajax({
				url: 'https://viacep.com.br/ws/' + this.value + '/json/',
				dataType: 'json'
			}).done(response => {
				const elementEndereco = document.querySelector('.endereco-texto')
				const inputEndereco = document.querySelector('input[name="endereco"]')
				let enderecoStr = 'Rua: ' + response.logradouro + '<br>Bairro: ' + response.bairro + '<br>' + response.localidade + ' / ' + response.uf
				elementEndereco.innerHTML = enderecoStr
				
				inputEndereco.value = response.logradouro
			})
		}
	})
	
	// Oculta carrinho
	const carrinhoMenu = document.querySelector('#carrinho-menu')
	carrinhoMenu.classList.add('d-none')
	
	
	// Ação finalizar pedido (clicou botão finalizar)
	const btnFinalizar = document.querySelector('.btn-finalizar')
	btnFinalizar.addEventListener('click', function (e) {
		
		// Pega dados do formulário
		const formDados = document.querySelector('.form-dados')
		const formEndereco = document.querySelector('.form-endereco')
		const fdDados = new FormData(formDados)
		const fdEndereco = new FormData(formEndereco)
		
		const allData = {}
		
		// Preenche os dados do usuário no allData
		fdDados.forEach((valor, nome) => {
			allData[nome] = valor
		})
		
		// Preenche o endereço
		fdEndereco.forEach((valor, nome) => {
			allData[nome] = valor
		})
		
		allData['produtos'] = productsCartData
		console.log(allData)
		
		// Verifica se todos os dados foram preenchidos, caso contrário exibe alerta
		let preencheuTudo = !Object.values(allData).some(values => values == '')
		if(!preencheuTudo) {
			$('#modal-aviso').modal('show')
		} else {
			// Envia dados
			const spiner = btnFinalizar.querySelector('span')
			spiner.classList.remove('d-none')
			
			btnFinalizar.setAttribute('disabled', '');
			
			$.ajax({
				url: 'finaliza-pedido',
				data: allData
			}).done(response => {
				if(response == 'ok') {
					window.location.href = "<%= request.getContextPath() %>/app/pedido-finalizado.jsp"
				}
				console.log(response)
			}).fail(err => {
				console.log(err)
			})
			
		}
		
		
	})
	
	
	
</script>