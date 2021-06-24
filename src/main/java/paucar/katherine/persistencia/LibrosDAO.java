package paucar.katherine.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import java.sql.PreparedStatement;

import paucar.katherine.modelo.Libro;

public class LibrosDAO implements ItfzLibrosDAO {
	
		private Connection conexion;
	@Override
	public boolean altaLibro(Libro libro) {
		boolean insertado =false;
		
		try {
			abrirConexion();
			String query="insert into libros values (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conexion.prepareStatement(query);
			
			pst.setInt(1, libro.getID());
			pst.setString(2, libro.getTitulo());
			pst.setString(3, libro.getAutor());
			pst.setString(4, libro.getEditorial());
			pst.setString(5, libro.getIsbn());
			pst.setInt(6, libro.getPublicacion());
			pst.setDouble(7, libro.getPrecio());
			pst.setString(8, libro.getDescripcion());
			
			int registros = pst.executeUpdate();
			
			if(registros  == 1) {
				insertado=true;
				System.out.println("Insertado correctamente");
			}
		} catch (SQLException e) {
		System.out.println("Error al insertar el Libro" + libro);
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		return insertado;
	}

	@Override
	public boolean eliminarLibro(int id) {
		boolean eliminado= false;
		try {
			abrirConexion();
			String query="delete from libros where ID = ?";
			PreparedStatement pstEliminar = conexion.prepareStatement(query);
		
			pstEliminar.setInt(1, id);
			
			int regEliminar = pstEliminar.executeUpdate();
			
			if(regEliminar == 1) {
				eliminado=true;
				System.out.println("Se ha eliminado el libro con ID: " + id);
			}
	
		} catch (SQLException e) {
			System.out.println("Error al eliminar libro");
			e.printStackTrace();
		}finally {
		
			cerrarConexion();
		}
		return eliminado;
	}



	@Override
	public List<Libro> consultarTodos() {
		List<Libro> listaLibros = new ArrayList<>();
	
		try {
			abrirConexion();
			Statement stm = conexion.createStatement();
			String query="select * from libros";
			ResultSet rs= stm.executeQuery(query);
			while(rs.next()) {
				listaLibros.add(new Libro(rs.getInt("ID"),rs.getString("TITULO"),rs.getString("AUTOR"),rs.getString("EDITORIAL"), rs.getString("ISBN"),rs.getInt("PUBLICACION"),rs.getDouble("PRECIO"),rs.getString("DESCRIPCION")));
				
			}
		} catch (SQLException e) {
			System.out.println("Error al consultas todos los Libros");
			e.printStackTrace();
		}finally {
			cerrarConexion();
		}
		
		
		return listaLibros;
	}

	@Override
	public Libro consultarISBN(String isbn) {
		//Almacenar el resultado en un objeto de tipo Libro
		Libro libro=null; 
		
		try {
			abrirConexion();
			String query="select * from libros where ISBN= ?";
			PreparedStatement psConsultarISBN = conexion.prepareStatement(query);
			psConsultarISBN.setString(1, isbn);
			
			ResultSet resultISBN = psConsultarISBN.executeQuery();
			if(resultISBN.next()) {
				resultISBN.beforeFirst();
			while(resultISBN.next()) {
				
				libro = new Libro(resultISBN.getInt("ID"),resultISBN.getString("TITULO"),resultISBN.getString("AUTOR"),resultISBN.getString("EDITORIAL"), resultISBN.getString("ISBN"),resultISBN.getInt("PUBLICACION"),resultISBN.getDouble("PRECIO"),resultISBN.getString("DESCRIPCION"));
			}
			} else {
				System.out.println("No hay coincidencias por el ISBN introducido : " + isbn);
			}
			
		} catch (SQLException e) {
			System.out.println("Error al buscar por ISBN");
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		
		
		return libro;
	}

	@Override
	public List<Libro> consultarTitulo(String titulo) {
		
		List<Libro> listaTitulos = new ArrayList<>();
		
		
		try {
			abrirConexion();
			String query="select * from libros where TITULO like ?";
			PreparedStatement psConsultarTi = conexion.prepareStatement(query);
			psConsultarTi.setString(1,"%"+titulo+"%");
						
			ResultSet resultTitulo = psConsultarTi.executeQuery();
			
			
			if(resultTitulo.next()) {
				resultTitulo.beforeFirst();
				while(resultTitulo.next()) {
					
					listaTitulos.add(new Libro(resultTitulo.getInt("ID"),resultTitulo.getString("TITULO"),resultTitulo.getString("AUTOR"),resultTitulo.getString("EDITORIAL"), resultTitulo.getString("ISBN"),resultTitulo.getInt("PUBLICACION"),resultTitulo.getDouble("PRECIO"),resultTitulo.getString("DESCRIPCION")));
				}
			}else {
				System.out.println("No hay coincidencias por el titulo introducido : " + titulo);
			}
			
			
			
		} catch (SQLException e) {
			System.out.println("Error al buscar por titulo");
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		
		
		return listaTitulos;
	
	}

	@Override
	public boolean modificarPrecio(String isbn, double precio) {
		boolean modificado=false;
		
		try {
			abrirConexion();
			String query="update libros set PRECIO = ? where ISBN = ? ";
			PreparedStatement pstUpdate = conexion.prepareStatement(query);
			pstUpdate.setDouble(1, precio);
			pstUpdate.setString(2, isbn);
			
			int registroModificado=pstUpdate.executeUpdate();
			if (registroModificado == 1) {
				modificado=true;
				System.out.println("Se ha modificado correctamente");
			}
			
		} catch (SQLException e) {
			System.out.println("Error al modificar el Libro con ISBN: " + isbn);
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		return modificado;
	}
	
	//Conexiones

	@Override
	public void abrirConexion() {
		try { //characterEncoding=latin1&useConfigs=maxPerformance
			Class.forName("com.mysql.jdbc.Driver");
			conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/libreria?characterEncoding=UTF-8&useConfigs=maxPerformance", "root", "adminadmin");
		} catch (ClassNotFoundException e) {
			System.out.println("Error en el driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Error al abrir la conexion");
			e.printStackTrace();
		}


	}

	@Override
	public void cerrarConexion() {
		try {
			conexion.close();
		} catch (SQLException e) {
			System.out.println("Error al cerrar la conexion");
			e.printStackTrace();
		}

	}

	@Override
	public Libro buscarID(int id) {
		
		Libro libro=null; 
		
		try {
			abrirConexion();
			String query="select * from libros where id= ?";
			PreparedStatement psbuscarId = conexion.prepareStatement(query);
			psbuscarId.setInt(1, id);
			
			ResultSet resultID = psbuscarId.executeQuery();
			if(resultID.next()) {
				resultID.beforeFirst();
			while(resultID.next()) {
				
				libro = new Libro(resultID.getInt("ID"),resultID.getString("TITULO"),resultID.getString("AUTOR"),resultID.getString("EDITORIAL"), resultID.getString("ISBN"),resultID.getInt("PUBLICACION"),resultID.getDouble("PRECIO"),resultID.getString("DESCRIPCION"));
			}
			} else {
				System.out.println("No hay coincidencias por ID introducido : " + id);
			}
			
		} catch (SQLException e) {
			System.out.println("Error al buscar por ID");
			e.printStackTrace();
		} finally {
			cerrarConexion();
		}
		
		
		return libro;
	}

}
