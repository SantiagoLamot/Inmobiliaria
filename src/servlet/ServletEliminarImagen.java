package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegocioImagen;
@WebServlet("/ServletEliminarImagen")
public class ServletEliminarImagen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NegocioImagen ni = new NegocioImagen();
	
	public ServletEliminarImagen() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("UrlImagen"); 
	    String idImagenS = request.getParameter("idImagen");
	    int idImagen = Integer.parseInt(idImagenS);
	    String idPropiedad = request.getParameter("idPropiedad");

	    if (fileName != null && !fileName.isEmpty()) {
	        // Obtener la ruta absoluta del directorio raíz de la aplicación
	        String applicationPath = request.getServletContext().getRealPath("");

	        // Construir la ruta completa del archivo utilizando `fileName`
	        File fileToDelete = new File(applicationPath, fileName);

	        System.out.println("Ruta final del archivo a eliminar: " + fileToDelete.getAbsolutePath());

	        if (fileToDelete.exists()) {
	            if (fileToDelete.delete()) {
	                System.out.println("Archivo eliminado exitosamente.");
	                ni.bajaLogImagen(idImagen); // Lógica para eliminar registro en BD
	            } else {
	                response.getWriter().write("No se pudo eliminar el archivo.");
	            }
	        } else {
	            response.getWriter().write("El archivo no existe.");
	        }
	    } else {
	        response.getWriter().write("No se proporcionó un archivo válido para eliminar.");
	    }

	    // Redirigir al usuario después de completar la operación
	    response.sendRedirect(request.getContextPath() + "/ServletPropiedadCompleta?source=admin&id=" + idPropiedad);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
