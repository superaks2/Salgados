<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp" %>
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Cardápio</h2>
        </div>
    </div>
</section>
<section class="secao secao-cardapio-detalhe">
  <div class="container">
    <div class="row">
      <div class="col-3 lateral">
        <div class="lateral-container p-3 bg-white rounded">
          <h3 class="text-dark">Filtre aqui</h3>
          <hr>
          <ul class="filtro-lista" onclick="filtrar(event)">
            <li>
              <a href="#" class="text-decoration-none text-dark" data-tipo="Salgados">Salgados</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark" data-tipo="Pratos">Pratos</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark" data-tipo="Bebidas">Bebidas</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark" data-tipo="Doces">Doces</a>
            </li>
          </ul>
        </div>
      </div>
      <script>
      	function filtrar(e) {
      		let tipo = e.target.dataset.tipo
      		if(tipo) {
      			console.log(tipo)
          		$('.cardapio-container').load('/Salgados/cardapio-detalhe/detalhe', {tipo: tipo})
      		}
      		
      	}

      </script>
      	
      </script>
      <div class="col-9 cardapio-lista">
        <div class="row cardapio-container">
          <div class="lista-salgado">
	
		   	
          </div>
        </div>
      </div>
    </div>
  </div>

</section>

<script>
	
	// CARREGA O HTML DOS PRODUTOS
	$('.cardapio-container').load('/Salgados/cardapio-detalhe/detalhe')
	// END CARREGA O HTML DOS PRODUTOS
		
		   		
</script>
<%@include file="estrutura/footer.jsp" %>