package paucar.katherine.services;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;

import paucar.katherine.modelo.Libro;
import paucar.katherine.negocio.GestionLibreria;
import paucar.katherine.negocio.ItfzGestionLibreria;

@Path("/")
public class LibrosREST {

	private ItfzGestionLibreria negocioLibros = new GestionLibreria();
	
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/consultar
	@GET
	@Path("consultar")
	@Produces("application/json")//lo que estamos devolviendo
	public String todos() {
		List<Libro> lista  = negocioLibros.consultarTodos();
		JSONArray array = new JSONArray(lista);
		return array.toString();
	}
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/consultar/9788491395928
	@GET
	@Path("consultar/{isbn}")
	@Produces("application/json")//lo que estamos devolviendo
	public String consultar(@PathParam("isbn") String isbn) {
		Libro libro  = negocioLibros.consultarISBN(isbn);
		JSONObject json = new JSONObject(libro);
		return json.toString();
	}
	
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/consultarTitulo/sira
	@GET
	@Path("consultarTitulo/{titulo}")
	@Produces("application/json")//lo que estamos devolviendo
	public String consultarTitulo(@PathParam("titulo") String titulo) {
		List<Libro> lista=negocioLibros.consultarTitulo(titulo);
		JSONArray array = new JSONArray(lista);
		return array.toString();
	}
	
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/alta
	@POST
	@Path("alta")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces("application/json")
	public String alta(@FormParam("id") int id,
			@FormParam("titulo") String titulo, 
			@FormParam("autor") String autor,
			@FormParam("editorial") String editorial, 
			@FormParam("isbn") String isbn,
			@FormParam("publicacion") int publicacion,
			@FormParam("precio") double precio,
			@FormParam("descripcion") String descripcion) {
		Libro nuevo = new Libro(id, titulo, autor, editorial, isbn, publicacion, precio, descripcion);
		boolean insertado = negocioLibros.altaLibro(nuevo);
		JSONObject json = new JSONObject();
		json.put("insertado", insertado);
		return json.toString();
	}
	
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/modificar
	@PUT
	@Path("modificar")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces("application/json")
	public String modificar(@FormParam("isbn") String isbn,
			@FormParam("precio") double precio) {
		boolean modificado=negocioLibros.modificarPrecio(isbn, precio);
		JSONObject json=new JSONObject();
		json.put("modificado", modificado);
		return json.toString();
		
	}
	//http://localhost:8080/Libreria_Katherine_PaucarSW/rest/eliminar/8
	@DELETE
	@Path("eliminar/{codigo}")
	@Produces("application/json")
	public String eliminar(@PathParam("codigo") int id) {
		boolean eliminado=negocioLibros.eliminarLibro(id);
		JSONObject json=new JSONObject();
		json.put("eliminado", eliminado);
		return json.toString();
		
	}
}
