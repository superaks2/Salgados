  <section class="section section-slide">
        <!-- Slider main container -->
    <div class="swiper">
      <!-- Additional required wrapper -->
      <div class="swiper-wrapper">
        <!-- Slides -->
        <div class="swiper-slide" style="background: url('https://i.imgur.com/ggEeIUc.jpg');" data-swiper-zoom="5">
          <div class="slide-mask">
            <h2 class="slide-title" data-aos="fade-up">Aproveite nossas promoções</h2>
            <p class="slide-text" data-aos="fade-up">
              Atendemos todos os dias de segunda a sexta
            </p>
            <div class="slide-button" data-aos="fade-up">
              <a href="<%= request.getContextPath() %>/app/sobre.jsp" class="btn btn-primary style-1">Saiba Mais</a>
            </div>
          </div>
        </div>
        <div class="swiper-slide" style="background-image: url('https://i.imgur.com/xUxiD13.jpg');">
          <div class="slide-mask">
             <h2 class="slide-title" data-aos="fade-up">Conheça Nosso Cardápio</h2>
            <p class="slide-text" data-aos="fade-up">
              Cardápio varíado para doces, bebidas, salgados e pratos!
            </p>
            <div class="slide-button" data-aos="fade-up">
             <a href="<%= request.getContextPath() %>/app/cardapio-detalhe.jsp" class="btn btn-primary style-1">Saiba Mais</a>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>