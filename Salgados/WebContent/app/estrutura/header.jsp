<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<header class="p-3 sticky-top">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto mb-2 justify-content-center mb-md-0 ms-auto">
          <li><a href="./" class="nav-link px-3">Home</a></li>
          <li><a href="./sobre.jsp" class="nav-link px-3">O Restaurante</a></li>
          <li><a href="./cardapio.jsp" class="nav-link px-3">Cardápio</a></li>
          <li><a href="./contato.jsp" class="nav-link px-3">Contato</a></li>
        </ul>

        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 ps-3" style="display: none;">
          <input type="search" class="form-control rounded-pill" placeholder="Buscar..." aria-label="Search">
        </form>

        <div class="dropdown text-end">
          <a href="#" class="d-block text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
<svg class="bi mx-auto ms-2" width="24" height="24"><use xlink:href="#people-circle"></use></svg>
          </a>
          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
            <li><a class="dropdown-item" href="#">Meus Pedidos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sair</a></li>
          </ul>
        </div>
        <div class="dropdown">
        	<!-- CARRINHO -->
        	<div class="carrinho-count" style="position: absolute;">3</div>
	        <a class="cart ms-2" href="#" class="dropdown-toggle" id="dropdownCart" data-bs-toggle="dropdown" width="32" height="32">
	          <svg class="bi mx-auto mx-lg-2" width="24" height="24"><use xlink:href="#cart"></use></svg>
	        </a>
	        <div class="dropdown-menu text-small" aria-labelledby="dropdownCart" style="min-width: 18rem;">
	        	<div class="dropdown-header d-flex">
	        		<h5 class="d-inline">Meu Carrinho</h5>
	        		<button type="button" class="btn-close ms-auto" style="font-size: 10px;" aria-label="Close"></button>
	        	</div>
	        	<hr class="dropdown-divider">
	        	<div class="carrinho-container overflow-auto" style="max-height: 300px;">
		        	<div class="carrinho-items p-2 border-bottom">
		        		<div class="carrinho-top d-flex">
		        		  <figure class="col-3 rounded overflow-hidden mb-0 d-inline-block">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
			              <div class="col-9 textos d-flex flex-column ps-2">
			              	<small class="carrinho-titulo">Coxinha de Catupiry</small>
			              	<small class="fw-bold">R$ 32,90</small>
			              </div>
		        		</div>
		        		<div class="d-flex carrinho-mid mt-2 align-items-baseline">
		        	      <div class="col-3">
		        	      &nbsp;
		        	      </div>
		        		  <div class="col-5 prato-footer-esquerda">
		                  	<div class="input-group input-group-sm input-add" style="max-width: 100px; max-height: 25px;">
							  <button class="btn btn-outline-secondary left d-flex align-items-center" type="button"><span class="fa fa-minus"></span></button>
							  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
							    <button class="btn btn-outline-secondary right d-flex align-items-center" type="button"><span class="fa fa-plus"></span></button>
							</div>
		                  </div>
		                  <div class="col-3">
		                  	<small class="ms-2"><a href="#">Remover</a></small>
		                  </div>
		        		</div>
		        	</div>
		        	<div class="carrinho-items p-2 border-bottom">
		        		<div class="carrinho-top d-flex">
		        		  <figure class="col-3 rounded overflow-hidden mb-0 d-inline-block">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
			              <div class="col-9 textos d-flex flex-column ps-2">
			              	<small class="carrinho-titulo">Coxinha de Catupiry</small>
			              	<small class="fw-bold">R$ 32,90</small>
			              </div>
		        		</div>
		        		<div class="d-flex carrinho-mid mt-2 align-items-baseline">
		        	      <div class="col-3">
		        	      &nbsp;
		        	      </div>
		        		  <div class="col-5 prato-footer-esquerda">
		                  	<div class="input-group input-group-sm input-add" style="max-width: 100px; max-height: 25px;">
							  <button class="btn btn-outline-secondary left d-flex align-items-center" type="button"><span class="fa fa-minus"></span></button>
							  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
							    <button class="btn btn-outline-secondary right d-flex align-items-center" type="button"><span class="fa fa-plus"></span></button>
							</div>
		                  </div>
		                  <div class="col-3">
		                  	<small class="ms-2"><a href="#">Remover</a></small>
		                  </div>
		        		</div>
		        	</div>
		        	<div class="carrinho-items p-2 border-bottom">
		        		<div class="carrinho-top d-flex">
		        		  <figure class="col-3 rounded overflow-hidden mb-0 d-inline-block">
			                <img src="https://i.imgur.com/7rjovw8.jpg">
			              </figure>
			              <div class="col-9 textos d-flex flex-column ps-2">
			              	<small class="carrinho-titulo">Coxinha de Catupiry</small>
			              	<small class="fw-bold">R$ 32,90</small>
			              </div>
		        		</div>
		        		<div class="d-flex carrinho-mid mt-2 align-items-baseline">
		        	      <div class="col-3">
		        	      &nbsp;
		        	      </div>
		        		  <div class="col-5 prato-footer-esquerda">
		                  	<div class="input-group input-group-sm input-add" style="max-width: 100px; max-height: 25px;">
							  <button class="btn btn-outline-secondary left d-flex align-items-center" type="button"><span class="fa fa-minus"></span></button>
							  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
							    <button class="btn btn-outline-secondary right d-flex align-items-center" type="button"><span class="fa fa-plus"></span></button>
							</div>
		                  </div>
		                  <div class="col-3">
		                  	<small class="ms-2"><a href="#">Remover</a></small>
		                  </div>
		        		</div>
		        	</div>
	        	</div>
	        	<hr class="dropdown-divider">
	        	<div class="d-flex justify-content-center p-1 mt-2">
	        		<a href="#" class="btn btn-success fw-bold text-uppercase btn-sm">Finalizar Compra</a>
	        	</div>
	        </div>
	        <!-- END CARRINHO -->
        </div>
      </div>
    </div>
  </header>