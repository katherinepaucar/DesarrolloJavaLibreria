<%@page import="paucar.katherine.negocio.Carrito"%>
<%@page import="paucar.katherine.modelo.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Carrito</title>
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
<link rel="stylesheet" href="css/listadolibros_styles.css" />
<link rel="stylesheet" type="text/css" href="css/stacktable.css">
</head>
<body>

	<div class="container">

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border rounded  estilobarra">

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
							<li class="nav-item"><a class="nav-link" href="LibrosServlet?opcion=3">Listado</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioConsultar.jsp">Consultar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioBuscar.jsp">Buscar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="formularioModificar.jsp">Modificar</a></li>

						</ul>

					</div>
				
					<%String usuario = (String)session.getAttribute("nombreUsuario");%>

			
					<%if(usuario != null || usuario.length() >0 ){ %>
					<a class="nav-link activeCarrito" href="mostrarCarrito.jsp">
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
			<div class="col-lg-12 col-md-12 col-sm-12 border seccion rounded table-responsive-sm table-responsive-md table-responsive-lg">

				<!--Tabla-->
				
			<% 		Carrito carrito= (Carrito) session.getAttribute("miCarro");
				if(carrito!=null){
					List<Libro> lista = carrito.getItems();		
		
			 %>
			 	<div class="row">
			 	<div class="col-lg-1 col-md-1 col-sm-1"></div>
			 	<div class="col-lg-10 col-md-10 col-sm-10" style="margin-top: 5vh">
			 
			 	<h3 style="text-align: center">Items agregados</h3>
				 	<p style="background: #CC7178;text-align: center; color:white; font-size: 18px; width: 400px;float:left">
				 	Importe total: <%= Math.round(carrito.getImporte()*100.0)/100.0 %> €
				 	</p>
			 		<p style="background: #4E937A;text-align: center; color:white; font-size: 18px;width: 500px;float:left">
			 		Descuento Aplicado (10%):  <%=Math.round(carrito.getImporte()*0.9*100.0)/100.0 %> €
			 		</p>
			 	</div>
			 	<div class="col-lg-1 col-md-1 col-sm-1"></div>

			 	</div>
				<table class="table table-striped  table-hover text-center " id="miTabla">
				
					<thead>
					
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Titulo</th>
							<th scope="col">Autor</th>
							<th scope="col">Editorial</th>
							<th scope="col">ISBN</th>
							<th scope="col">Publicación</th>
							<th scope="col">Precio(€)</th>
							<th scope="col" style="height: 20px">Quitar</th>
						</tr>
					</thead>
					<tbody>
						<%
						if(lista !=null || !lista.isEmpty()){
						for (Libro libro : lista) {
						%>
						<tr>
							<th scope="row"><%=libro.getID()%></th>
							<td><%=libro.getTitulo()%></td>
							<td><%=libro.getAutor()%></td>
							<td><%=libro.getEditorial()%></td>
							<td><%=libro.getIsbn()%></td>
							<td><%=libro.getPublicacion()%></td>
							<td><%=libro.getPrecio()%></td>
							<td>
						<a href="LibrosServlet?opcion=9&codigo=<%= libro.getID() %>">
						<img  alt="Eliminar <%= libro.getTitulo() %>" 
						title="Sacar del carrito <%= libro.getTitulo() %>" 
						src="images/deteleCarrito.png" style="width: 30px"/>
						</a>
						</td>
						
						</tr>
					<%}}}else{%>
					
					<h2 style="text-align: center; color:#ec407a;margin-top:60px">No hay productos añadidos en el carrito</h2>
					<%} %>
					</tbody>
				</table>
				<div style="text-align: center">
				<a href="LibrosServlet?opcion=5" >
				<button type="button" class="btn btn-primary">
					Seguir Comprando
				</button>
				</a>
				</div>
				

				<!---->
		
		</div>
		</div>

		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 border footer">Página
				realizada por Katherine Paucar - 2021</div>
		</div>
	</div>
<!-- Fin Container -->

	<script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="js/stacktable.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$('table').cardtable();
			$('#miTabla').cardtable();
		})
	</script>
</body>
</html>