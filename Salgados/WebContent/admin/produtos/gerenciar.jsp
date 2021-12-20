<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Produtos" %>
<jsp:include page="../estrutura/head.jsp">
	<jsp:param name="css" value="/admin/assets/css/produtos_gerenciar.css"/>
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
							<a href="#" id="toggle" onclick="toggleMenu()"><i class="fas fa-bars ml-3"></i></a>
						</nav>
						<div class="below-toggle-content">
							<div class="col-md-12">
								<div class="top-part mb-3">
									<h2 class="d-inline">Gerenciar</h2>
									<p class="d-inline ml-2">Produtos</p>
									<a href="<%= request.getContextPath() %>/admin/index.jsp" class="d-inline text-dark mt-2" style="text-decoration: none; float: right; font-weight: 500;"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
								</div>
								<div class="row">

									<!-- Buttons -->

									<div class="col-md-4">
										<a href="<%= request.getContextPath() %>/admin/produtos/adicionar.jsp" class="btn btn-primary mt-2 add_product">Adicionar Produtos</a>
									</div>

									<!-- Search Bar -->

									<div class="col-md-4 mt-2 mb-4 ml-auto">
										<div class="input-group">
					
						               	</div>
									</div>

								</div>

								<div class="row">	

									<!-- Table -->

									<table class="table table-hover ml-3 mr-3" id="product">
										<thead class="thead-dark">
									    	<tr>
									      		<th scope="col">Imagem</th>
									      		<th scope="col">Nome Produto</th>
									      		<th scope="col">Preço</th>
									      		<th scope="col">Categoria</th>
									      		<th scope="col">Ação</th>
									    	</tr>
									  	</thead>
									  	<tbody id="display">
 											<% 	String saida = new Produtos().listAll();%>
 											<%= saida %>
									  	</tbody>
									</table>

								</div>
								
								<div class="row">	

									<!-- Pagination -->

									<nav aria-label="Page navigation example" style="background-color: transparent;">
		                              <ul class="pagination justify-content-end">

		                                      
		                              </ul>
		                          	</nav>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	

	<!-- Update Group Modal -->

	<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="UpdateModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h4 class="modal-title text-center text-info" id="exampleModalCenterTitle">Update Product</h4>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<form method="POST" action="" id="update_form">
						<div class="form-group">
					    	<label for="product_name">Product Name</label>
					    	<input type="text" name="product_name" class="form-control shadow-none" id="product_name" placeholder="Enter Product Name">
					  	</div>
					  	<div class="form-group">
					    	<label for="price" style="font-weight: 600;">Price</label>
					    	<input type="text" name="price" class="form-control shadow-none" id="price" placeholder="Enter Price">
					  	</div>
					  	<div class="form-group">
						    <label for="groups" style="font-weight: 600;">Category</label>
						    <select class="form-control shadow-none" id="category" name="category">
						    	
						    </select>
						</div>    	
					  	<div class="form-group">
					    	<label for="status">Select Status</label>
					    	<select class="form-control shadow-none" name="status" id="status">
					      		<option value="yes">Yes</option>
					      		<option value="no">No</option>
					    	</select>
					  	</div>
					  	<button type="hidden" id="product_id" class="d-none"></button>
					  	<button type="submit" name="update_product" id="update_product" class="btn btn-primary shadow-none">Update Product</button>
					  	<button type="button" class="btn btn-danger shadow-none" data-dismiss="modal" aria-label="Close">Cancel</button>
					</form>
	      		</div>
	    	</div>
	  	</div>
	</div>	

	<script>
		
		function SearchField() {
			xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "product_search.php?search="+document.getElementById('search').value, false);
			xmlhttp.send(null);

			document.getElementById('display').innerHTML=xmlhttp.responseText;
      	}

	</script>

	<script type="text/javascript">

		/* Getting Data as json */

		$(document).on('click','.edit_data',function(){
			var product_id = $(this).attr('id');
			$.ajax({
				url:"update_product.php",
				method:"POST",
				data:{product_id:product_id},
				dataType:"json",
				success:function(data){
					var formoption = "";
					$('#product_name').val(data.name);
					$('#price').val(data.price);
					formoption += "<option value='" + data.category + "'>" + data.category + "</option>";
					$('#category').html(formoption);
					$('#status').val(data.status);
					$('#product_id').val(product_id);
					$('#UpdateModal').modal('show');
				}
			});
		});

		/* Updating Data at backend */

		$('#update_form').on('submit', function(e){
			var product_id = $('#product_id').val();
			var product_name = $('#product_name').val();
			var price = $('#price').val();
			var status = $('#status').val();
			e.preventDefault();
			if($('#product_name').val() == "" || $('#price').val() == "")
			{
				alert('Name or Price is empty.');
			}
			else
			{
				$.ajax({
					url:"update_product_database.php",
					method:"POST",
					data: {
						product_name: product_name,
						price: price,
						status: status,
						product_id: product_id
					},
					success:function(data)
					{
						$('#UpdateModal').modal('hide');
						$('#product').html(data);
					}
				});
			}
		});
	</script>

</body>
</html>