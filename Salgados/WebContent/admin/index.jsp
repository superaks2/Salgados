<%@include file="estrutura/head.jsp" %>
	<div class="wrapper">
	
		<!-- Sidebar -->
		<%@include file="estrutura/menu.jsp" %>
		<!-- Sidebar -->
		
		
		<!-- Content -->

		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<nav>
							<a href="#" id="toggle" onclick="toggleMenu()"><i class="fas fa-bars ml-3"></i></a>
						</nav>
						<div class="below-toggle-content">
							<div class="col-md-12">
								<div class="top-part mb-3">
									<h2 class="d-inline">Dashboard</h2>
									<p class="d-inline ml-2">Painel de Controle</p>
								</div>
								<div class="row">
									<div class="col-md-3 mx-auto total-products">
										<div class="row">
											<div class="col-md-8">
												<h1 class="text-white">1</h1>
												<h5 class="text-white">Total de Produtos</h5>
											</div>
											<div class="col-md-4 text-right">
												<i class="fas fa-shopping-cart"></i>
											</div>	
										</div>
										<a href="<%= request.getContextPath() %>/admin/produtos/gerenciar.jsp" class="btn btn-primary btn-sm w-100 mt-4 mx-auto text-center">Ver Produtos <i class="fas fa-arrow-circle-right"></i></a>
									</div>
									<div class="col-md-3 mx-auto total-orders">
										<div class="row">
											<div class="col-md-8">
												<h1 class="text-white">4</h1>
												<h5 class="text-white">Total de Pedidos</h5>
											</div>
											<div class="col-md-4 text-right">
												<i class="fas fa-chart-bar"></i>
											</div>	
										</div>
										<a href="report.php" class="btn btn-success btn-sm w-100 mt-4 mx-auto text-center">Ver Pedidos <i class="fas fa-arrow-circle-right"></i></a>
									</div>
									<div class="col-md-3 mx-auto total-users">
										<div class="row">
											<div class="col-md-8">
												<h1 class="text-white">10</h1>
												<h5 class="text-white">Total de Usuários</h5>
											</div>
											<div class="col-md-4 text-right">
												<i class="fa fa-users"></i>
											</div>	
										</div>
										<a href="manage_user.php" class="btn btn-warning btn-sm w-100 mt-4 mx-auto text-center text-white">Ver Usuários <i class="fas fa-arrow-circle-right"></i></a>
									</div>
									<div class="col-md-3 mx-auto total-stores">
										<div class="row">
											<div class="col-md-8">
												<h1 class="text-white">5</h1>
												<h5 class="text-white">Total de Lojas</h5>
											</div>
											<div class="col-md-4 text-right">
												<i class="fa fa-store fa-lg"></i>
											</div>	
										</div>
										<a href="store.php" class="btn btn-danger btn-sm w-100 mt-4 mx-auto text-center">Ver Lojas <i class="fas fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						
					</div>
				</div>
			</div>
		</div>

	</div>	


</body>
</html>