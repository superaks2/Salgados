<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="../estrutura/head.jsp">
	<jsp:param name="css" value="/admin/assets/css/produtos_adicionar.css"/>
</jsp:include>
<%@ include file="../estrutura/head.jsp" %>

	<div class="wrapper">

		<!-- Sidebar -->
		<%@ include file="../estrutura/menu.jsp" %>

		<!-- Content -->

		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<nav class="bar">
							<a href="#" id="toggle"><i class="fas fa-bars ml-3"></i></a>
						</nav>
						<div class="below-toggle-content">
							<div class="col-md-12">
								<div class="top-part mb-3">
									<h2 class="d-inline">Adicionar Produtos</h2>
									<p class="d-inline ml-2">Produtos</p>
									<a href="<%= request.getContextPath() %>/admin/index.jsp" class="d-inline text-dark mt-2" style="text-decoration: none; float: right; font-weight: 500;"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
								</div>
							</div>
							<div class="row">
								<h5 class="text-danger" style="margin-left: 32.5px;"><?php echo $msg; ?></h5>
								<form method="POST" action="" enctype="multipart/form-data">
									<h1>Upload Imagem</h1>
							    	<div class="avatar-upload">
							        	<div class="avatar-edit">
							            	<input type="file" name="file" id="imageUpload" accept=".png, .jpg, .jpeg" />
							            	<label for="imageUpload"><i class="fas fa-edit"></i></label>
							        	</div>
							        	<div class="avatar-preview">
							            	<div id="imagePreview" style="background-image: url(img/preview.jpg);"></div>
							        	</div>
							    	</div>
							    	<div class="form-group">
								    	<label for="name" style="font-weight: 600;">Nome Produto</label>
								    	<input type="text" name="name" class="form-control shadow-none" id="name" placeholder="Nome do Produto">
								  	</div>
								  	<div class="form-group">
								    	<label for="price" style="font-weight: 600;">Preço</label>
								    	<input type="text" name="price" class="form-control shadow-none" id="price" placeholder="Preço do Produto">
								  	</div>
								  	<div class="form-group shadow-textarea">
										<label for="description" style="font-weight: 600;">Descrição</label>
										<textarea class="form-control z-depth-1 shadow-none" name="description" id="description" rows="4" placeholder="Adicionar descrição..."></textarea>
									</div>
									<div class="form-group">
									    <label for="groups" style="font-weight: 600;">Categoria</label>
									    <select class="form-control shadow-none" id="category" name="category">
				    						<option>Selecione uma categoria</option>
				    						<option>Salgados</option>
				    						<option>Pratos</option>
				    						<option>Bebidas</option>
				    						<option>Doces</option>
									    </select>
									</div>
									<div class="form-group">
								    	<label for="status">Ativo</label>
								    	<select class="form-control shadow-none" id="status" name="status">
								      		<option value="yes">Sim</option>
								      		<option value="no">Não</option>
								    	</select>
								  	</div>
								  	<button type="submit" name="add" class="btn btn-primary shadow-none mt-3 mb-2">Adicionar Produto</button>
					  				<button type="button" class="btn btn-danger shadow-none mt-3 mb-2">Cancelar</button>
								</form>
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