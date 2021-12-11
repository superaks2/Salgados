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
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Sign out</a></li>
          </ul>
        </div>
        <a class="cart ms-2" href="./carrinho.jsp" width="32" height="32">
          <svg class="bi mx-auto mx-lg-2" width="24" height="24"><use xlink:href="#cart"></use></svg>
        </a>
      </div>
    </div>
  </header>