<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="../estrutura/head.jsp">
	<jsp:param name="css" value="/admin/assets/css/usuarios_gerenciar.css"/>
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
									<p class="d-inline ml-2">Usuários</p>
									<a href="<%= request.getContextPath() %>/admin/index.jsp" class="d-inline text-dark mt-2" style="text-decoration: none; float: right; font-weight: 500;"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
								</div>
								<div class="row">

									<!-- Add User Button -->

									<div class="col-md-4">
										<a href="<%= request.getContextPath() %>/admin/usuarios/adicionar.jsp" class="btn btn-primary ml-1">Adicionar Usuário</a>
									</div>

									<!-- Search Bar -->

									<div class="col-md-4 mt-2 mb-4 ml-auto">
										<div class="input-group">
						                	<input type="text" name="search" id="search" onkeyup="SearchField();" class="form-control shadow-none" placeholder="Procurar Usuários">
						                	<span class="input-group-btn">
						                		<button class="btn btn-primary shadow-none" id="search-button">Procurar</button>
						                 	</span>
						               	</div>
									</div>

									<!-- Table -->

									<table class="table table-hover mx-3" id="user_table">
										<thead class="thead-dark">
									    	<tr>
									      		<th scope="col">Id</th>
									      		<th scope="col">Nome</th>
									      		<th scope="col">Usuário</th>
									      		<th scope="col">Email</th>
									      		<th scope="col">Sexo</th>
									      		<th scope="col">Grupo</th>
									      		<th scope="col">Ação</th>
									    	</tr>
									  	</thead>
									  	<tbody id="display">
									  	<tr>
									  		<td>
									  			<h5 class='text-danger mb-3'>Nenhum dado para exibir.<h5>
									  		</td>
									  	</tr>
									  	</tbody>
									</table>

									<!-- Pagination -->

									<nav aria-label="Page navigation example" style="background-color: transparent;">
		                              <ul class="pagination justify-content-end">
		                                     
		                                  <li class="page-item"><a href="<?php  echo 'manage_user.php?page=' . $page_previous ?>" class="page-link">Voltar</a></li>               
		                                    


		                                <li class="page-item"><a href="manage_user.php?page=' . $page . '" class="page-link"> 1 </a></li>


		                                  <li class="page-item "><a href="<?php  echo 'manage_user.php?page=' . $page_next ?>" class="page-link">Próximo</a></li>
		                                      
		                              </ul>
		                          	</nav>
									
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
	        		<h4 class="modal-title text-center text-info" id="exampleModalCenterTitle">Update User</h4>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<form method="POST" action="" id="update_form">
						<div class="form-group">
					    	<label for="firstNameUpdate" style="font-weight: 600;">First Name</label>
					    	<input type="text" name="firstNameUpdate" class="form-control shadow-none" id="firstNameUpdate" placeholder="Enter First Name">
					  	</div>
						<div class="form-group">
					    	<label for="usernameUpdate" style="font-weight: 600;">Username</label>
					    	<input type="text" name="usernameUpdate" class="form-control shadow-none" id="usernameUpdate" placeholder="Enter Username">
					  	</div>
					  	<div class="form-group">
					    	<label for="emailUpdate" style="font-weight: 600;">Email</label>
					    	<input type="email" name="emailUpdate" class="form-control shadow-none" id="emailUpdate" placeholder="Enter Email">
					  	</div>
						<label style="font-weight: 600;">Gender</label>
					  	<div class="form-group">
					  		<div class="form-check form-check-inline">
							  	<input class="form-check-input" type="radio" name="optionUpdate" id="maleUpdate" value="male">
							  	<label class="form-check-label" for="maleUpdate">Male</label>
							</div>
							<div class="form-check form-check-inline">
							  	<input class="form-check-input" type="radio" name="optionUpdate" id="femaleUpdate" value="female">
							  	<label class="form-check-label" for="femaleUpdate">Female</label>
							</div>
					  	</div>
					  	<button type="hidden" id="user_id" class="d-none"></button>
					  	<button type="submit" name="update" id="update" class="btn btn-primary">Update User</button>
					  	<button type="button" class="btn btn-danger shadow-none" data-dismiss="modal" aria-label="Close">Cancel</button>
					</form>
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

	<script type="text/javascript">
		function SearchField() {
			xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "user_search.php?search="+document.getElementById('search').value, false);
			xmlhttp.send(null);

			document.getElementById('display').innerHTML=xmlhttp.responseText;
      	}
	</script>

	<script type="text/javascript">
		/* Getting Data as json */

		$(document).on('click','.edit_data',function(){
			var user_id = $(this).attr('id');
			$.ajax({
				url:"update_user.php",
				method:"POST",
				data:{user_id:user_id},
				dataType:"json",
				success:function(data){
					$('#firstNameUpdate').val(data.firstName);
					$('#usernameUpdate').val(data.username);
					$('#emailUpdate').val(data.email);
					$('#user_id').val(data.id);
					if(data.gender == 'male')
						$('input:radio[name=optionUpdate]')[0].checked = true;
					else
						$('input:radio[name=optionUpdate]')[1].checked = true;
					$('#UpdateModal').modal('show');
				}
			});
		});

		/* Updating Data at backend */

		$('#update_form').on('submit', function(e){
			var user_id = $('#user_id').val();
			var firstNameUpdate = $('#firstNameUpdate').val();
			var usernameUpdate = $('#usernameUpdate').val();
			var emailUpdate = $('#emailUpdate').val();
			var genderUpdate = $('input:radio[name=optionUpdate]:checked').val();
			//alert("firstName: " + firstNameUpdate + " username: " + usernameUpdate + " email: " + emailUpdate + " gender: " + genderUpdate + " userID: " + user_id);
			e.preventDefault();
			if($('#firstNameUpdate').val() == "")
			{
				alert('Name is required.');
			}
			else if($('#usernameUpdate').val() == "")
			{
				alert('Username is required.');
			}
			else if($('#emailUpdate').val() == "")
			{
				alert('Email is required.');
			}
			else
			{
				$.ajax({
					url:"update_user_database.php",
					method:"POST",
					data: {
						firstNameUpdate: firstNameUpdate,
						usernameUpdate: usernameUpdate,
						emailUpdate: emailUpdate,
						genderUpdate: genderUpdate,
						user_id: user_id
					},
					success:function(data)
					{
						$('#UpdateModal').modal('hide');
						$('#user_table').html(data);
					}
				});
			}
		});

	</script>

</body>
</html>