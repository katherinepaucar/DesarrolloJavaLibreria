<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/index_style.css"/>
<link rel="stylesheet" href="css/1alta_styles.css"/>



</head>
<body>
	<div class="container">


		<div class="row">

			<div
				class="col-lg-12 col-md-12 col-sm-12 border rounded  estilobarra">

				<nav class="navbar navbar-expand-lg navbar navbar-light"
					style="background-color: #a1689b;">
					<a class="navbar-brand #a1689b" href="index.jsp">Librería
						Katherine</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarText" aria-controls="navbarText"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarText">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link"
								href="LibrosServlet?opcion=5">Catálogo</a></li>
							<li class="nav-item"><a class="nav-link" href="formularioAlta.jsp">Alta</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioEliminar.jsp">Eliminar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="LibrosServlet?opcion=3">Listado</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioConsultar.jsp">Consultar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioBuscar.jsp">Buscar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioModificar.jsp">Modificar</a></li>

						</ul>

					</div>
					
				</nav>
			</div>

		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border seccion rounded">
				<div class="row">
					<div class="col-lg-3 col-md-2 col-sm-3"></div>
					<div class="col-lg-6 col-md-8 col-sm-6" style="margin-top: 12vh">
						<!--Formulario-->
						<form class="border  border-primary rounded" id="formularioLogin"
							name="formularioLogin" action="LibrosServlet" method="post" style="background: orange">
							<fieldset>
								<legend class="text-center">Iniciar Sesión</legend>
								<div class="form-group">
									<!-- ID -->
									<label for="usuario" class="control-label">Usuario</label> <input
										type="text" class="form-control" id="usuario" name="user"
										placeholder="Laura" /> <small>Error message</small>
								</div>

								<div class="form-group">
									<!-- Titulo -->
									<label for="password" class="control-label">Contraseña</label> <input
										type="password" class="form-control" id="passwordID" name="password"
										placeholder="Introduce tu contraseña" /> <small>Error message</small>
								</div>
			
							</fieldset>
								<div class="form-group text-center">
									<!--Botones -->
									<input type="hidden" name="opcion" value="11"/><br/>
									<button type="reset" class="btn btn-primary" id="btn-limpiar">Limpiar</button>
									<button type="submit" class="btn btn-primary" id="btn-enviar">Enviar</button>

								</div>
						</form>
						<!---->

					</div>
					<div class="col-lg-3 col-md-2 col-sm-3"></div>
				</div>



			</div>

		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border footer">Página
				realizada por Katherine Paucar - 2021</div>
		</div>
	</div>
</body>
</html>