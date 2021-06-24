<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inicio</title>
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
<link rel="stylesheet" href="css/index_style.css">
<script defer src="js/contenido_dinamico.js"></script>

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
							<li class="nav-item"><a class="nav-link"
								href="formularioAlta.jsp">Alta</a></li>
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
					<%String usuario = (String)session.getAttribute("nombreUsuario");%>
					<%if(usuario != null){ %>
					<a class="nav-link" href="mostrarCarrito.jsp">
							<img src="images/carritoOpen.png" style="width:28px" alt="carritoFoto" />
					</a>
					
					<img src="images/user.png" alt="usuario" width="28px"/> <span class="usuario"><%=usuario %></span>
					<a href="LibrosServlet?opcion=12">
							<img src="images/logout.png" alt="Logout" Title="Logout" width="28px"/>
					</a>
					<%} %>
				</nav>
			</div>
		</div>

		<div class="row">
			<div
				class="col-lg-12 col-md-12 col-sm-12 border seccion rounded text-center fondoIndex">
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-2"></div>
					<div class="col-lg-8 col-md-8 col-sm-8" style="margin-top: 8vh">
						<marquee style="color:orange; font-size: 20px; z-index: 2"><%=application.getAttribute("mensajeDto") %></marquee>

						<div class="card-deck" style="max-width: 80rem;">
							<div class="card bordeCard">
								<img src="images/3.jpg" class="card-img-top" alt="Catalogo">
								<div class="card-body">
									<h5 class="card-title">Catálogo</h5>
									<p class="card-text">Accede a nuestro Catálogo de Libros</p>
								</div>

								<div class="card-footer">
									<small class="text-muted"> <a
										href="LibrosServlet?opcion=5" class="linkfooter"> Ver
											Catálogo </a>
									</small>

								</div>

							</div>
							<div class="card bordeCard">
								<img src="images/5.jpg" class="card-img-top" alt="Listado">
								<div class="card-body">
									<h5 class="card-title">Listado</h5>
									<p class="card-text">Contiene la lista completa de todos
										los libros en formato tabla</p>
								</div>

								<div class="card-footer">
									<small class="text-muted"> <a
										href="LibrosServlet?opcion=3" class="linkfooter"> Ver
											Listado Completo </a>
									</small>

								</div>

							</div>

						</div>

					</div>

					<div class="col-lg-2 col-md-2 col-sm-2"></div>
				</div>


			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border footer">Página realizada por Katherine Paucar - 2021</div>
		</div>
	</div>

</body>
</html>