<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="../estrutura/head.jsp">
	<jsp:param name="css" value="/admin/assets/css/pedidos_gerenciar.css"/>
</jsp:include>
	<div class="wrapper">

		<!-- Sidebar -->
		
		<%@include file="../estrutura/menu.jsp" %>

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
									<h2 class="d-inline">Gerenciar</h2>
									<p class="d-inline ml-2">Pedidos</p>
									<a href="<%= request.getContextPath() %>/admin/index.jsp" class="d-inline text-dark mt-2" style="text-decoration: none; float: right; font-weight: 500;"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
								</div>
								<div class="row">

									<!-- Add Group Button -->

									<div class="col-md-2">
										<button type="button" id="addrow" class="btn btn-primary mb-3 add-group shadow-none w-100">Adicionar Pedido</button>
									</div>


									<!-- 
									<div class="col-md-3">
										<select class="form-control shadow-none" id="table">
									    			<option>Nenhuma Tabela Disponível</option>		
									    </select>
									</div>	
									-->
								</div>

								<table class="table table-hover order-list" id="myTable">
									<thead class="thead-dark">
										<tr>
											<th>Id</th>
											<th>Produto</th>
											<th>Quantidade</th>
											<th>Preço</th>
											<th>Total a Pagar</th>
											<th>Ação</th>
										</tr>
									</thead>
								</table>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('#toggle').click(function(e){
			e.preventDefault();
			$('.wrapper').toggleClass('menuDisplayed');
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function () 
		{
    		var counter = 0;

		    $("#addrow").on("click", function () 
		    {
		        var newRow = $("<tr>");
		        var cols = "";

		        cols += '<td><input type="text" class="form-control shadow-none" name="id' + counter + '"/></td>';
		        cols += '<td><select class="form-control" id="name' + counter + '"><option>Pedidos</option></select></td>';
		        cols += '<td><input type="text" class="form-control shadow-none" name="qty' + counter + '"/></td>';
		        cols += '<td><input type="text" class="form-control shadow-none" name="price' + counter + '"/></td>';
		        cols += '<td><input type="text" class="form-control shadow-none" name="tamount' + counter + '"/></td>';

		        cols += '<td><input type="button" class="delete btn btn-md btn-danger "  value="Delete"></td>';
		        newRow.append(cols);
		        $("table.order-list").append(newRow);
		        counter++;
    		});

		    $("table.order-list").on("click", ".delete", function (event) 
		    {
		        $(this).closest("tr").remove();       
		        counter -= 1;
	    	});

		});
	</script>

</body>
</html>