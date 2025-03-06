package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Propiedad;
import negocio.NegocioImagen;
import negocio.NegocioPropiedad;
@WebServlet("/ServletEliminarImagenSetPrincipal")
public class ServletEliminarImagenSetPrincipal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NegocioImagen ni = new NegocioImagen();
	NegocioPropiedad np = new NegocioPropiedad();
	
	public ServletEliminarImagenSetPrincipal() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnEliminar = request.getParameter("btnEliminar");
	    String btnSetPrincipal = request.getParameter("btnSetPrincipal");
		
		String fileName = request.getParameter("UrlImagen"); 
	    String idImagenS = request.getParameter("idImagen");
	    int idImagen = Integer.parseInt(idImagenS);
	    String idPropiedadS = request.getParameter("idPropiedad");
	    int idPropiedad = Integer.parseInt(idPropiedadS);
			    
		if (btnEliminar != null) {
			if (fileName != null && !fileName.isEmpty()) {
				// Obtener la ruta absoluta del directorio raíz de la aplicación
				String applicationPath = request.getServletContext().getRealPath("");
				
				// Construir la ruta completa del archivo utilizando `fileName`
				File fileToDelete = new File(applicationPath, fileName);
				
				
				if (fileToDelete.exists()) {
					if (fileToDelete.delete()) {
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
		}
		else if (btnSetPrincipal != null) {
			Propiedad p = new Propiedad(idPropiedad, idImagen);
			System.out.println("Id Propeidad:"+idPropiedad);
			System.out.println("Id Imagen seleccionada:"+idImagen);
			np.ActualizarImagenPrincipal(p);
	    }
		
	    // Redirigir al usuario después de completar la operación
	    response.sendRedirect(request.getContextPath() + "/ServletPropiedadCompleta?source=admin&id=" + idPropiedad);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
