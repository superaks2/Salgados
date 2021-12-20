<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>Restaurant - dashboard</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/admin/assets/css/dashboard.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>${param.css}">
</head>
<body> 

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
			</div>
		</nav>
		<div class="col-md-8 mx-auto">
			<h2 class="text-center text-inverse mb-4 mt-4">Login</h2>
		</div>
		<div class="text-center text-success mb-4">
		</div>
		<div class="col-md-6 mx-auto">
			<form method="POST" action="login" class="needs-validation" novalidate>
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
				    	<input type="password" name="senha" class="form-control" id="validationCustom04" placeholder="Senha" required>
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