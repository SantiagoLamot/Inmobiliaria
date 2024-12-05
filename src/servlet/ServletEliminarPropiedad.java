package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegocioImagen;
import negocio.NegocioPropiedad;
@WebServlet("/ServletEliminarPropiedad")
public class ServletEliminarPropiedad extends HttpServlet {
	private static final long serialVersionUID = 1L;
    NegocioPropiedad ne = new NegocioPropiedad();
    NegocioImagen ni = new NegocioImagen();
	public ServletEliminarPropiedad() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idS = request.getParameter("idP");
		ne.BajaLogicaPropiedad(Integer.parseInt(idS));
		List<String> UrlImagenes = ni.ObtenerImagenes(Integer.parseInt(idS));
		for(String url: UrlImagenes)
		{
			// Obtener la ruta absoluta del directorio raíz de la aplicación
			String applicationPath = request.getServletContext().getRealPath("");
			
			// Construir la ruta completa del archivo utilizando `fileName`
			File fileToDelete = new File(applicationPath, url);
			
			System.out.println("Ruta final del archivo a eliminar: " + fileToDelete.getAbsolutePath());
			
			if (fileToDelete.exists()) {
				if (fileToDelete.delete()) {
				} else {
					response.getWriter().write("No se pudo eliminar el archivo.");
				}
			} else {
				response.getWriter().write("El archivo no existe.");
			}
		}
		// Redirigir al usuario después de completar la operación
	    response.sendRedirect(request.getContextPath() + "/ServletObtenerResumenPropiedades?source=admin");
	}
}
