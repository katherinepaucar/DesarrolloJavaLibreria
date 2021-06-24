package paucar.katherine.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import paucar.katherine.modelo.Libro;
import paucar.katherine.negocio.Carrito;
import paucar.katherine.negocio.GestionLibreria;
import paucar.katherine.negocio.ItfzGestionLibreria;
//import paucar.katherine.persistencia.ItfzLibrosDAO;

/**
 * Servlet implementation class LibrosServlet
 */
@WebServlet("/LibrosServlet")
public class LibrosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ItfzGestionLibreria negocioLibros = new GestionLibreria();
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LibrosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String procesarLista(HttpServletRequest request, HttpServletResponse response) {
		List<Libro> libros = negocioLibros.consultarTodos();

		request.setAttribute("listado", libros);

		return "/mostrarListado.jsp";
	}

	private String procesarConsultarISBN(HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn");
		Libro libro = negocioLibros.consultarISBN(isbn);
		if (libro != null) {
			request.setAttribute("encontrado", libro);

		} else {
			request.setAttribute("mensaje", "No se han encontrado datos con ISBN: " + isbn);
		}

		return "/formularioConsultar.jsp";
	}

	private String procesarAltaLibro(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("libro_id"));
		String titulo = request.getParameter("titulo");
		String autor = request.getParameter("autor");
		String editorial = request.getParameter("editorial");
		String isbn = request.getParameter("isbn");
		int publicacion = Integer.parseInt(request.getParameter("publicacion"));
		double precio = Double.parseDouble(request.getParameter("precio"));
		String descripcion = request.getParameter("descripcion");

		boolean insertado = negocioLibros
				.altaLibro(new Libro(id, titulo, autor, editorial, isbn, publicacion, precio, descripcion));
		if (insertado) {
			request.setAttribute("mensaje", "Libro insertado en la base de datos correctamente");
		} else {
			request.setAttribute("mensaje", "No se pudo insertar el libro en  la base de datos");
		}
		return "/formularioAlta.jsp";

	}

	private String procesarEliminar(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("libro_id"));
		boolean eliminado = negocioLibros.eliminarLibro(id);

		if (eliminado) {
			request.setAttribute("mensaje", "Libro con ID " + id + " eliminado de la base de datos");

		} else {
			request.setAttribute("mensaje", "No se pudo eliminar el libro con ID " + id + " en la base de datos");
		}

		return "/formularioEliminar.jsp";
	}

	private String procesarBuscarTitulo(HttpServletRequest request, HttpServletResponse response) {
		String titulo = request.getParameter("titulo");
		List<Libro> listaTitulos = negocioLibros.consultarTitulo(titulo);
		// System.out.println(listaTitulos);
		if (!listaTitulos.isEmpty()) {
			request.setAttribute("titulosEncontrados", listaTitulos);
		} else {
			request.setAttribute("mensaje", "Datos no encontrados con el titulo: " + titulo);
		}

		return "/formularioBuscar.jsp";
	}

	private String procesarModificar(HttpServletRequest request, HttpServletResponse response) {
		String isbn = request.getParameter("isbn");
		double precio = Double.parseDouble(request.getParameter("precio"));
		boolean modificado = negocioLibros.modificarPrecio(isbn, precio);

		if (modificado) {
			request.setAttribute("mensaje", "Se ha modificado correctamente el libro con ISBN " + isbn);

		} else {
			request.setAttribute("mensaje",
					"No se pudo modificar el precio del libro con ISBN " + isbn + " en la base de datos");
		}

		return "/formularioModificar.jsp";
	}

	private String mostrarLibros(HttpServletRequest request, HttpServletResponse response) {

		List<Libro> libros = negocioLibros.consultarTodos();

		request.setAttribute("listado", libros);
		
		return "/mostrarLibro.jsp";
	}

	private String mostrarDetalleLibro(HttpServletRequest request, HttpServletResponse response) {

		int codigo = Integer.parseInt(request.getParameter("id"));
		// System.out.println(codigo);
		Libro libros = negocioLibros.buscarID(codigo);
		// System.out.println(libros);
		request.setAttribute("detalles", libros);

		return "/mostrarLibroDetalle.jsp";
	}

	private String procesarCompra(HttpServletRequest request, HttpServletResponse response) {

		// Recuper la cookie y ver si existe
		String nombre = "";
		//
		Cookie[] listadoCookies = request.getCookies();
		for (Cookie cookie : listadoCookies) {
			if (("cookieUser").equals(cookie.getName())) { // equal por ser de tipo String
				nombre = cookie.getValue();
			}

		}
		if (nombre.length() == 0) {
			return "/formularioLogin.jsp";
		} else {

			// Recogemos el id pasado por el link
			int id = Integer.parseInt(request.getParameter("codigo"));
			// Si no existe me crea la sesion
			HttpSession miSession = request.getSession(true);

			Carrito carrito = (Carrito) miSession.getAttribute("miCarro");
			if (carrito == null) {
				carrito = new Carrito();
				miSession.setAttribute("miCarro", carrito);

			}
			
			//Guardamos el nombre como atributo de la sesion
			miSession.setAttribute("nombreUsuario", nombre);
		
			carrito.addLibro(id);

			return "/mostrarCarrito.jsp";
		}
	}

	private String procesarsacarLibro(HttpServletRequest request, HttpServletResponse response) {
		// Recogemos el id pasado por el link
		int id = Integer.parseInt(request.getParameter("codigo"));
		// Si no existe me crea la sesion
		HttpSession miSession = request.getSession(false);

		Carrito carrito = (Carrito) miSession.getAttribute("miCarro");
		//System.out.println(carrito);
		carrito.sacarLibro(id);

		return "/mostrarCarrito.jsp";
	}
	
	private String procesarLogin(HttpServletRequest request, HttpServletResponse response) {
		String nombre= request.getParameter("user");
		
		//Creamos la cookie
		Cookie miCookie= new Cookie("cookieUser", nombre);
		
		miCookie.setMaxAge(24*60*60); //1 dia
		response.addCookie(miCookie);
		
		
		//return "/LibrosServlet?opcion=5";
		return "/index.jsp";
		
	}
	private String procesarLogout(HttpServletRequest request, HttpServletResponse response) {
		
		// Recorremos la cookie y si está la eliminamos
		Cookie[] allCookies = request.getCookies();
		for (Cookie cookie : allCookies) {
			if ("cookieUser".equals(cookie.getName())) {
				cookie.setMaxAge(0);
				cookie.setValue("");
				response.addCookie(cookie);
			}
		}
		
		// Recuperamos sesion
		HttpSession miSession = request.getSession(false);

		// Cerramos sesion
		miSession.invalidate();

		return "/index.jsp";
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String vista = "index.jsp";
		switch (request.getParameter("opcion")) {
		case "1":
			// Añadir Libro
			vista = procesarAltaLibro(request, response);
			break;
		case "2":
			// Eliminar Libro
			vista = procesarEliminar(request, response);
			break;
		case "3":
			// Consultar todos los libros en forma de Listado
			vista = procesarLista(request, response);
			break;
		case "4":
			// Consultar por ISBN
			vista = procesarConsultarISBN(request, response);
			break;
		case "5":
			// Mostrar Libros Catálogo
			vista = mostrarLibros(request, response);
			break;
		case "6":
			// Buscar por Titulo
			vista = procesarBuscarTitulo(request, response);
			break;
		case "7":
			// Modificar
			vista = procesarModificar(request, response);
			break;
		case "8":
			// Procesar Compra
			vista = procesarCompra(request, response);
			break;
		case "9":
			// Procesar Sacar libro del carrito
			vista = procesarsacarLibro(request, response);
			break;
		case "10":
			// Mostrar detalles de un libro en concreto
			vista = mostrarDetalleLibro(request, response);
			break;
		case "11":
			// Login
			vista = procesarLogin(request, response);
			break;
		case "12":
			// Logout
			vista = procesarLogout(request, response);
			break;
		}

		// Elegir la vista que mostrara el resultado
		RequestDispatcher rd = request.getRequestDispatcher(vista);

		// Redirigir hacia esa pagina
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
