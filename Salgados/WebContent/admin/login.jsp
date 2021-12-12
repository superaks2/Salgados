<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="estrutura/head.jsp" %>

	<div class="container-fluid" style="padding: 0;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="padding: 8px 50px;">
			<a class="navbar-brand" href="#">Restaurante Salgados</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
			  		<li class="nav-item active">
			    		<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
			  		</li>
				</ul>
				<form class="form-inline ml-auto">
		    		<a href="register.php" class="text-white" style="text-decoration: none;"><span class="fa fa-user"></span> Sair</a>
		  		</form>
			</div>
		</nav>
		<div class="col-md-8 mx-auto">
			<h2 class="text-center text-inverse mb-4 mt-4">Login</h2>
		</div>
		<div class="text-center text-success mb-4">
			<h5>Mensagem</h5>
		</div>
		<div class="col-md-6 mx-auto">
			<form method="POST" action="" class="needs-validation" novalidate>
  				<div class="form-row">
    				<div class="col-md-12 mb-3">
      					<label for="validationCustom03">Email</label>
      					<input type="email" name="email" class="form-control" id="validationCustom03" placeholder="Email" required>
      					<div class="invalid-feedback">
        					Please provide a valid email.
      					</div>
    				</div>
				    <div class="col-md-12 mb-3">
				    	<label for="validationCustom04">Password</label>
				    	<input type="password" name="password" class="form-control" id="validationCustom04" placeholder="Senha" required>
				    	<div class="invalid-feedback">
				        	Please provide a valid password.
				      	</div>
				    </div>
  				</div>
  				<div class="form-group">
      				<input class="form-input" name="remember" type="checkbox"> Lembrar
  				</div>
  				<button class="btn btn-primary w-100" name="login" type="submit">Logar</button>
			</form>
		</div>
	</div>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>