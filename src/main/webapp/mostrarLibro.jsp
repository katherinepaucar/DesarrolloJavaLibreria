<%@page import="paucar.katherine.modelo.Libro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Catálogo</title>
    <link  rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />

    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="css/index_style.css" />
    <link rel="stylesheet" href="css/lista_styles.css" />
    <script>
    
    </script>
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
							<li class="nav-item"><a class="nav-link active"
								href="#">Catálogo</a></li>
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
      
     <!-- Inicio Datos --> 
  		 <div class="row ">
			<div class="col-lg-12 col-md-12 col-sm-12 border seccion rounded">
			
		<div class="row">
		  <div class="col-lg-1 col-md-1 col-sm-1"> </div>
        <div class="col-lg-10 col-md-10 col-sm-10 seccion rounded centrar paddingCards">
		        <h2>Catálogo de Libros</h2>
			        <marquee style="color:orange; font-size: 20px; z-index: 2"><%=application.getAttribute("mensajeDto") %></marquee>
					<% List<Libro> listado= (List<Libro>)request.getAttribute("listado");%>
					<%for (Libro libro:listado) {%>
										<div class="card datos" style="width: 18rem">
			
											<img src="images/<%=libro.getID() %>.jpg" class="card-img-top"
												alt="Imagen" style="height: 200px" />
			
			
											<div class="card-body">
												<h5 class="card-title"><%=libro.getTitulo() %></h5>
											
											</div>
											<ul class="list-group list-group-flush letraLiCatalogo">
												<li class="list-group-item"><span class="titulosLibro">Autor: <br/>
												</span><%=libro.getAutor() %></li>
												<li class="list-group-item"><span class="titulosLibro">Editorial: <br/>
												</span> <%=libro.getEditorial() %></li>
												<li class="list-group-item"><span class="titulosLibro">Publicación:
												</span> <%=libro.getPublicacion() %></li>
												<li class="list-group-item"><span class="titulosLibro">Precio:
												</span><%=libro.getPrecio() %></li>
											</ul>
									<div class="card-body">
																		
									<a href="LibrosServlet?opcion=8&codigo=<%= libro.getID() %>">
									
									<button type="button" class="btn btn-info btnCarrito">
									Añadir
									<img  alt="Comprar <%= libro.getTitulo() %>" 
									title="Agregar <%= libro.getTitulo() %>" 
									src="images/carritoOpen.png"/>
									</button>
										</a>
										<a href="LibrosServlet?opcion=10&id=<%= libro.getID() %>">
										<button type="button" class="btn btn-info btnCarrito">Ver Detalles</button>
										</a>
									</div>

										
										</div>
										<%} %>

				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
				
				 </div>
				</div>
		
		
		 </div>
		</div>
		
		<!-- Inicio Fin --> 
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 border footer">Página realizada por Katherine Paucar - 2021</div>
      </div>
    </div>
  </body>
</html>
