<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		<!-- Sidebar -->

		<div class="nav-side-menu">
			<div class="brand">Admin</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
			<div class="menu-list">
				<ul id="menu-content" class="menu-content collapse out">
					<li class="active">
						<a href="<%= request.getContextPath() %>/admin/index.jsp">
	                  		<i class="fas fa-tachometer-alt"></i> Dashboard
	                  	</a>
					</li>
					
					<li  data-toggle="collapse" data-target="#users" class="collapsed">
	                	<a href="#"><i class="fa fa-user fa-lg"></i> Usuários <i class="fas fa-caret-down"></i></a>
	                </li>
	                <ul class="sub-menu collapse" id="users">
	                    <li><a href="<%= request.getContextPath() %>/admin/usuarios/adicionar.jsp">Adicionar</a></li>
	                    <li><a href="<%= request.getContextPath() %>/admin/usuarios/gerenciar.jsp">Gerenciar</a></li>
	                </ul>

	                <li data-toggle="collapse" data-target="#groups" class="collapsed">
	                	<a href="#"><i class="fa fa-users fa-lg"></i> Grupos <i class="fas fa-caret-down"></i></a>
	                </li>  
	                <ul class="sub-menu collapse" id="groups">
	                	<li><a href="group.php">Gerenciar Grupos</a></li>
	                </ul>


	                <li data-toggle="collapse" data-target="#products" class="collapsed">
	                	<a href="#"><i class="fas fa-cookie"></i> Produtos <i class="fas fa-caret-down"></i></a>
	                </li>
	                <ul class="sub-menu collapse" id="products">
	                  <li><a href="<%= request.getContextPath() %>/admin/produtos/adicionar.jsp">Adicionar</a></li>
	                  <li><a href="<%= request.getContextPath() %>/admin/produtos/gerenciar.jsp">Gerenciar</a></li>
	                </ul>

	                <li data-toggle="collapse" data-target="#order" class="collapsed">
	                	<a href="#"><i class="fas fa-book-open"></i> Pedidos <i class="fas fa-caret-down"></i></a>
	                </li>
	                <ul class="sub-menu collapse" id="order">
	                  <li><a href="<%= request.getContextPath() %>/admin/pedidos/gerenciar.jsp">Gerenciar</a></li>
	                </ul>

	                <li>
	                	<a href="settings.php">
	                		<i class="fa fa-sun fa-lg"></i> Configurações
	                  	</a>
	                </li>

	                <li>
	                  	<a href="<%= request.getContextPath() %>/admin/logout.jsp">
	                  		<i class="fa fa-user-times fa-lg"></i> Sair
	               		</a>
	                </li>

				</ul>	
			</div>
		</div>
		
	<script type="text/javascript">
		function toggleMenu() {
			$('.wrapper').toggleClass('menuDisplayed');
		}
	</script>