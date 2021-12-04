<%@include file="estrutura/head.jsp" %>
<%@include file="estrutura/header.jsp" %>
<section class="secao banner" style="background-image: url('https://i.imgur.com/TYz70Uk.jpg'); background-size: cover; background-repeat: no-repeat;">
    <div class="container">
        <div class="col-12">
            <h2 class="text-white text-center" data-aos="fade-up">Contato</h2>
        </div>
    </div>
</section>
<section class="secao">
    <div class="container">
        <div class="row">
                <div class="col-lg-4 col-md-12" data-aos="fade-up">
					<div class="contact-box-info-wrapper bg-white rounded p-4">
						<div class="row">
							<div class="col-lg-12 col-md-12 contact-box-item">
								<div class="contact-box">
									<h4>Informações de Contato</h4>
									<table>
									    <tr>
									        <td class="pb-2"><i class="fas fa-phone-alt text-secundaria"></i></td>
									        <td class="ps-2 pb-2"><a class="text-decoration-none text-dark" href="#">(11) 99999-9999</a></td>
									    </tr>
									    <tr>
									        <td class="pb-2"><i class="fas fa-envelope text-secundaria"></i></td>
									        <td class="ps-2 pb-2"><a class="text-decoration-none text-dark" href="#">contato@email.com</a></td>
									    </tr>
									    <tr>
									        <td class="pb-2 align-baseline"><i class="fas fa-map-marker-alt text-secundaria"></i></td>
									        <td class="ps-2 pb-2">Av. Xablau de Andrade, Nº 666 - São Paulo / SP</a></td>
									    </tr>
									</table>
								</div>
							</div>

							<div class="col-lg-12 col-md-12 contact-box-item mt-4">
								<div class="contact-box">
									<h4>Horário de Funcionamento</h4>
                                    <table class="text-dark">
                                      <tbody>
                                          <tr>
                                            <td>Segunda - Sexta</td>
                                            <td class="ps-4"><i class="fas fa-clock text-secundaria"></i> 6:00 às 18:00</td>
                                          </tr>
                                          <tr>
                                            <td>Sábado</td>
                                            <td class="ps-4"><i class="fas fa-clock text-secundaria"></i> 11:00 às 14:00</td>
                                          </tr>
                                          <tr>
                                            <td>Domingo</td>
                                            <td class="ps-4"><i class="fas fa-clock text-secundaria"></i> 12:00 às 14:00</td>
                                          </tr>
                                        </tbody>
                                    </table>
								</div>
							</div>

						</div>
					</div>
				</div>
                <div class="col-lg-8 col-md-12" data-aos="fade-up">
					<div class="form-container-wrapper bg-white rounded p-4">
						<div class="form-container-box">
							<form class="row g-3">
							  <div class="col-md-6">
							      <label for="nome" class="form-label">Nome</label>
							      <input type="text" class="form-control" id="nome">
							  </div>
							  <div class="col-md-6">
							      <label for="tel" class="form-label">Telefone</label>
							      <input type="tel" class="form-control" id="tel">
							  </div>
                              <div class="col-md-12">
                                <label for="inputEmail4" class="form-label">Email</label>
                                <input type="email" class="form-control" id="inputEmail4">
                              </div>
                              <div class="col-md-12">
                              <label for="mensagem">Mensagem</label>
                              <textarea class="form-control" placeholder="Escreva sua mensagem..." id="mensagem" style="height: 100px"></textarea>
                              </div>
                              <div class="col-12">
                                <button type="submit" class="btn btn-primary style-1">Enviar</button>
                              </div>
                            </form>

						</div>
                    </div>
                </div>
            </div>
    </div>
</section>
<%@include file="estrutura/footer.jsp"%>