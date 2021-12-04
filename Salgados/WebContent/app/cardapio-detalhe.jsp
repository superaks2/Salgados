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
          <ul>
            <li>
              <a href="#" class="text-decoration-none text-dark">Salgados</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark">Pratos</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark">Bebidas</a>
            </li>
            <li>
              <a href="#" class="text-decoration-none text-dark">Doces</a>
            </li>
          </ul>
        </div>
      </div>
      <div class="col-9 cardapio-lista">
        <div class="row cardapio-container">
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-4 mb-4">
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="https://i.imgur.com/7rjovw8.jpg">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5>Coxinha</h5>
                <p class="">
                  coxinha recheada com hambúrguer, maionese e ketchup.
                </p>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" disabled="disabled" data-type="minus" data-field="quant[1]">
                                <span class="fa fa-minus"></span>
                            </button>
                        </span>
                        <input type="text" name="quant[1]" class="form-control input-number normal" value="1" min="1" max="10">
                        <span class="input-group-append">
                            <button type="button" class="btn btn-outline-secondary btn-number normal" data-type="plus" data-field="quant[1]">
                                <span class="fa fa-plus"></span>
                            </button>
                        </span>
                    </div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</section>
<%@include file="estrutura/footer.jsp" %>