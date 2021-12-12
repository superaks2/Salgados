<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="../estrutura/head.jsp">
	<jsp:param name="css" value="/admin/assets/css/usuarios_adicionar.css"/>
</jsp:include>

	<div class="wrapper">

		<!-- Sidebar -->

		<%@include file="../estrutura/menu.jsp" %>

		<!-- Content -->

		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<nav>
							<a href="#" id="toggle"><i class="fas fa-bars ml-3"></i></a>
						</nav>
						<div class="below-toggle-content">
							<div class="col-md-12">
								<div class="top-part mb-3">
									<h2 class="d-inline">Adicionar</h2>
									<p class="d-inline ml-2">Usuários</p>
									<a href="<%= request.getContextPath() %>/admin/index.jsp" class="d-inline text-dark mt-2" style="text-decoration: none; float: right; font-weight: 500;"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
								</div>
								<div class="row">
									<a href="<%= request.getContextPath() %>/admin/usuarios/gerenciar.jsp" class="btn btn-primary ml-3 mb-2">Gerenciar Usuários</a>
								</div>
								<h5 class="text-danger ml-10">* Mensagem *</h5>
								<div class="row">
									<form method="POST" action="" class="w-100 p-3">
										<div class="form-group">
											<label for="groups" style="font-weight: 600;">Grupos</label>
											<select name="groups" class="form-control shadow-none" id="groups">
											<option>Clientes</option>
											<option>Administradores</option> 
											</select>	       
										</div>
										<div class="form-group">
									    	<label for="first-name" style="font-weight: 600;">Primeiro Nome</label>
									    	<input type="text" name="firstName" class="form-control shadow-none" id="first-name" placeholder="Primeiro Nome">
									  	</div>
									  	<div class="form-group">
									    	<label for="last-name" style="font-weight: 600;">Segundo Nome</label>
									    	<input type="text" name="lastName" class="form-control shadow-none" id="last-name" placeholder="Segundo Nome">
									  	</div>
										<div class="form-group">
									    	<label for="username" style="font-weight: 600;">Usuário</label>
									    	<input type="text" name="username" class="form-control shadow-none" id="username" placeholder="Usuário">
									  	</div>
									  	<div class="form-group">
									    	<label for="email" style="font-weight: 600;">Email</label>
									    	<input type="email" name="email" class="form-control shadow-none" id="email" placeholder="Email">
									  	</div>
									  	<div class="form-group">
									    	<label for="password" style="font-weight: 600;">Senha</label>
									    	<input type="password" name="password" class="form-control shadow-none" id="password" placeholder="Senha">
									  	</div>
									  	<div class="form-group">
									    	<label for="confirm-password" style="font-weight: 600;">Confirmar Senha</label>
									    	<input type="password" name="confirmPassword" class="form-control shadow-none" id="confirm-password" placeholder="senha">
									  	</div>
									  	<label style="font-weight: 600;">Sexo</label>
									  	<div class="form-group">
									  		<div class="form-check form-check-inline">
											  	<input class="form-check-input" type="radio" name="option" id="male" value="male" checked>
											  	<label class="form-check-label" for="male">Masculino</label>
											</div>
											<div class="form-check form-check-inline">
											  	<input class="form-check-input" type="radio" name="option" id="female" value="female">
											  	<label class="form-check-label" for="female">Feminino</label>
											</div>
									  	</div>
									  	<button type="submit" name="save" class="btn btn-primary" id="save">Salvar</button>
									  	<button type="submit" name="cancel" class="btn btn-danger">Cancelar</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>	

	<script type="text/javascript">
		$('#toggle').click(function(e){
			e.preventDefault();
			$('.wrapper').toggleClass('menuDisplayed');
		});
	</script>

</body>
</html>