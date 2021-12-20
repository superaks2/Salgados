<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp" %>
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Cardápio</h2>
        </div>
    </div>
</section>
<section class="secao secao-cardapio">
  <div class="container">
    <div class="row px-5">
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/qCVR385.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Salgados</h4>
          <div class="btn-container">
          	<form action="cardapio-detalhe.jsp" method="post">
          	<input type="hidden" name="tipo" value="Salgados">
            <button class="btn btn-primary style-1 btn-sm" type="submit">Ver Todos</button>
          	</form>
          </div>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/TyTnUvj.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Pratos</h4>
          <div class="btn-container">
            <form action="cardapio-detalhe.jsp" method="post">
	          	<input type="hidden" name="tipo" value="Pratos">
	            <button class="btn btn-primary style-1 btn-sm" type="submit">Ver Todos</button>
          	</form>
          </div>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/SLrMo5j.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Bebidas</h4>
          <div class="btn-container">
            <form action="cardapio-detalhe.jsp" method="post">
	          	<input type="hidden" name="tipo" value="Bebidas">
	            <button class="btn btn-primary style-1 btn-sm" type="submit">Ver Todos</button>
          	</form>
          </div>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
      <figure class="cardapio-figure">
        <img src="https://i.imgur.com/s63E4sV.jpg">
      </figure>
      <div class="cardapio-textos text-white">
        <h4 class="cardapio-titulo">Doces</h4>
        <div class="btn-container">
            <form action="cardapio-detalhe.jsp" method="post">
	          	<input type="hidden" name="tipo" value="Doces">
	            <button class="btn btn-primary style-1 btn-sm" type="submit">Ver Todos</button>
          	</form>
        </div>
      </div>
    </a>
    </div>
  </div>
</section>

<%@include file="estrutura/footer.jsp"%>