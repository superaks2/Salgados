<section class="secao secao-cardapio">
  <div class="container">
    <h2 class="title text-center text-white">Cardápio</h2>
    <div class="row px-5">
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/qCVR385.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Salgados</h4>
          <form action="<?=$url_base?>cardapio/cardapio-detalhe.php" method="post">
              <input type="hidden" name="cardapio" value="Salgados">
              <div class="btn-container">
                <button class="btn btn-primary style-1 btn-sm">Ver Todos</button>
              </div>
          </form>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/qCVR385.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Pratos</h4>
          <div class="btn-container">
            <button class="btn btn-primary style-1 btn-sm">Ver Todos</button>
          </div>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
        <figure class="cardapio-figure">
          <img src="https://i.imgur.com/qCVR385.jpg">
        </figure>
        <div class="cardapio-textos text-white">
          <h4 class="cardapio-titulo">Bebidas</h4>
          <div class="btn-container">
            <button class="btn btn-primary style-1 btn-sm">Ver Todos</button>
          </div>
        </div>
      </a>
      <a class="col-3 cardapio" href="#" data-aos="zoom-in">
      <figure class="cardapio-figure">
        <img src="https://i.imgur.com/qCVR385.jpg">
      </figure>
      <div class="cardapio-textos text-white">
        <h4 class="cardapio-titulo">Doces</h4>
        <div class="btn-container">
          <button class="btn btn-primary style-1 btn-sm">Ver Todos</button>
        </div>
      </div>
    </a>
    </div>
  </div>
</section>