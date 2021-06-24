package paucar.katherine.web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ListenerApp
 *
 */
@WebListener
public class ListenerApp implements ServletContextListener {


    public ListenerApp() {
        // TODO Auto-generated constructor stub
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	  System.out.println("Se ha va a destruir el contexto de la aplicacion Librería");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	 System.out.println("Se ha creado el contexto de la aplicacion Librería");
    	 
    	 String dto=sce.getServletContext().getInitParameter("Descuento");
    	//Guardarlos en su contexto
         sce.getServletContext().setAttribute("mensajeDto", dto);
    }
	
}
