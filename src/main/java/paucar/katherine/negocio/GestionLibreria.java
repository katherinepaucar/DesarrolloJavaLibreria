package paucar.katherine.negocio;

import java.util.List;

import paucar.katherine.modelo.Libro;
import paucar.katherine.persistencia.ItfzLibrosDAO;
import paucar.katherine.persistencia.LibrosDAO;

public class GestionLibreria implements ItfzGestionLibreria {

	//Usamos Polimorfismo
	ItfzLibrosDAO daoLibros = new LibrosDAO();
	@Override
	public boolean altaLibro(Libro libro) {
		
		return daoLibros.altaLibro(libro);
	}

	@Override
	public boolean eliminarLibro(int id) {
		
		return daoLibros.eliminarLibro(id);
	}

	@Override
	public List<Libro> consultarTodos() {
		return daoLibros.consultarTodos();
	}

	@Override
	public Libro consultarISBN(String isbn) {
	
		return daoLibros.consultarISBN(isbn);
	}

	@Override
	public List<Libro> consultarTitulo(String titulo) {
		
		return daoLibros.consultarTitulo(titulo);
	}

	@Override
	public boolean modificarPrecio(String isbn, double precio) {
		
		return daoLibros.modificarPrecio(isbn, precio);
	}

	@Override
	public Libro buscarID(int id) {
		
		return daoLibros.buscarID(id);
	}

}
