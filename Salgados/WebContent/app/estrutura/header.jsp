<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<header class="p-3 sticky-top">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="<%= request.getContextPath() %>/app/index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
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

        <div class="dropdown" id="carrinho-menu">
        	<!-- CARRINHO -->
        	<div class="carrinho-count" style="position: absolute;">0</div>
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
	        	</div>
	        	<hr class="dropdown-divider">
	        	<div class="carrinho-detalhe d-flex justify-content-end">
	        		<small class="me-3"><b>Total: </b> <span class="valor-total-geral">R$ 00,00</span></small>
	        	</div>
	        	<div class="d-flex justify-content-center p-1 mt-2">
	        		<a href="<%= request.getContextPath() %>/app/carrinho.jsp" class="btn btn-success fw-bold text-uppercase btn-sm">Finalizar Compra</a>
	        	</div>
	        </div>
	        <!-- END CARRINHO -->
        </div>
      </div>
    </div>
  </header>