<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="paucar.katherine.modelo.Libro"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detalles Libro</title>
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
							<li class="nav-item"><a class="nav-link active" href="#">Consultar</a></li>
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
			<div class="col-lg-12 col-md-12 col-sm-12 border seccion rounded">

				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
					<div class="col-lg-6 col-md-6 col-sm-6" style="margin-top: 5vh">
						<jsp:useBean id="detalles" scope="request"
							class="paucar.katherine.modelo.Libro" />
					<div style="text-align: right">
									<a href="LibrosServlet?opcion=5" >
									<button type="button" class="btn btn-primary">
										Volver a Catálogo
									</button>
									</a>
					</div>
						<h3>Detalles del libro seleccionado:</h3>
						<ul id="lista" class="list-group" style="text-align: justify;border:1px solid purple">
							<li class="list-group-item" style="text-align: center" >
								<img src="images/<jsp:getProperty property="ID" 
								name="detalles" />.jpg" alt="foto Libro"  
								style="width:80%"
								/>
							</li>
							<li class="list-group-item h4Titulo">ID</li>
							<li class="list-group-item"><jsp:getProperty
									property="ID" name="detalles" /></li>

							<li class="list-group-item h4Titulo">Titulo</li>
							<li class="list-group-item" style="color:#ff6d00;font-weight: bold"><jsp:getProperty
									property="titulo" name="detalles" /></li>
							<li class="list-group-item h4Titulo">Descripción</li>
							<li class="list-group-item"><jsp:getProperty
									property="descripcion" name="detalles" /></li>
							<li class="list-group-item h4Titulo">Autor</li>
							<li class="list-group-item"><jsp:getProperty
									property="autor" name="detalles" /></li>

							<li class="list-group-item h4Titulo">Editorial</li>
							<li class="list-group-item"><jsp:getProperty
									property="editorial" name="detalles" /></li>

							<li class="list-group-item h4Titulo">ISBN</li>
							<li class="list-group-item"><jsp:getProperty property="isbn"
									name="detalles" /></li>

							<li class="list-group-item h4Titulo">Publicación</li>
							<li class="list-group-item"><jsp:getProperty
									property="publicacion" name="detalles" /></li>

							<li class="list-group-item h4Titulo">Precio €</li>
							<li class="list-group-item" style="color:navy;font-weight: bold"><jsp:getProperty
									property="precio" name="detalles" /></li>


						</ul>
					
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
				</div>

				<!---->
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border footer">Página
				realizada por Katherine Paucar - 2021</div>
		</div>
	</div>
</body>
</html>