package paucar.katherine.negocio;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import paucar.katherine.modelo.Libro;

public class Carrito implements Serializable {

	private static final long serialVersionUID = 5751105547786003283L;
	
	private double importe;
	private List<Libro> items= new ArrayList<>();
	private ItfzGestionLibreria negocioLibros = new GestionLibreria();
	
	public void addLibro(int id) {
		Libro libroEncontrado=negocioLibros.buscarID(id);
		items.add(libroEncontrado);
		importe +=libroEncontrado.getPrecio();
		
	}
	
	public void sacarLibro(int id) {
		
		Libro eliminar = null;
		
		//System.out.println(eliminar);
		 for (Libro libro : items) {
			 if(id==libro.getID())
			 eliminar = libro;
			// System.out.println(eliminar);
		}
		 if (!items.isEmpty()) {
		 items.remove(eliminar);
		 //System.out.println(items);
		 importe -=eliminar.getPrecio();
		 }else {
			 System.out.println("No hay libros que borrar");
		 }
		
	}

	public double getImporte() {
		return importe;
	}

	public List<Libro> getItems() {
		return items;
	}



}
