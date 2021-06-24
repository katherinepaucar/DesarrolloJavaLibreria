<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="paucar.katherine.modelo.Libro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Buscar</title>
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
<link rel="stylesheet" href="css/index_style.css" />
<link rel="stylesheet" href="css/1alta_styles.css" />
<script defer src="js/buscarValidacion1.js"></script>
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
							<li class="nav-item"><a class="nav-link active" href="#">Buscar</a></li>
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

			<div class="col-lg-12 col-md-12 col-sm-12 border seccion rounded">

				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
					<div class="col-lg-6 col-md-6 col-sm-6  " style="margin-top: 18vh">

						<!--Formulario-->
						<form class="border border-primary rounded" id="formulario"
							action="LibrosServlet" method="get" style="background: #87BCDE;">
							<fieldset>
								<legend class="text-center">Buscar</legend>

								<div class="form-group">
									<!-- Titulo -->
									<label for="titulo_id" class="control-label">Título</label> <input
										type="search" class="form-control" id="titulo_id"
										name="titulo" placeholder="Las flores" /> <small>Error
										message</small>

								</div>
								<input type="hidden" name="opcion" value="6" />
								<div class="form-group text-center">
									<!--Botones -->
									<button type="submit" class="btn btn-dark" style="width: 25%;"
										id="btn-buscar">Buscar</button>

								</div>
							</fieldset>
						</form>

					</div>
				</div>


				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-2"></div>
					<div class="col-lg-8 col-md-8 col-sm-8 ">
						<!--Listas-->
						<%
						List<Libro> listadoTitulos = (List<Libro>) request.getAttribute("titulosEncontrados");
						%>
						<%
						if (listadoTitulos != null) {
							for (Libro libro : listadoTitulos) {
						%>
						
						<ul class="lista">
							<li class="list-group-item h4Titulo"><h4 class="h4Titulo">Los datos del libro son:</h4></li>
							<li class="list-group-item listaBuscar">Titulo</li>
							<li class="list-group-item negritaTitulo"><%=libro.getTitulo()%></li>
							<li class="list-group-item listaBuscar">ID</li>
							<li class="list-group-item"><%=libro.getID()%></li>

							<li class="list-group-item listaBuscar">Descripción</li>
							<li class="list-group-item" style="text-align: justify;"><%=libro.getDescripcion()%></li>

							<li class="list-group-item listaBuscar">Autor</li>
							<li class="list-group-item"><%=libro.getAutor()%></li>

							<li class="list-group-item listaBuscar">Editorial</li>
							<li class="list-group-item"><%=libro.getEditorial()%></li>

							<li class="list-group-item listaBuscar">ISBN</li>
							<li class="list-group-item"><%=libro.getIsbn()%></li>
							<li class="list-group-item listaBuscar">Publicación</li>
							<li class="list-group-item"><%=libro.getPublicacion()%></li>
							<li class="list-group-item listaBuscar">Precio</li>
							<li class="list-group-item"><%=libro.getPrecio()%></li>
						</ul>
						<%
						}
						} else {
						%>
						<%
						if (request.getAttribute("mensaje") != null) {
						%>
						<div class="text-center textoMensaje">
							<%=request.getAttribute("mensaje")%>
						</div>
						<%
						}
						}
						%>

						<!--  -->
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2"></div>
				</div>
				<!-- fin -->
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border footer">Página
				realizada por Katherine Paucar - 2021</div>
		</div>
	</div>
</body>
</html>