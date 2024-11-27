package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Propiedad;
import negocio.NegocioPropiedad;

@WebServlet("/ServletObtenerResumenPropiedades")
public class ServletObtenerResumenPropiedades extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletObtenerResumenPropiedades() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 NegocioPropiedad np = new NegocioPropiedad();
		 List<Propiedad> propiedades = np.ObtenerResumenDePropiedades();
		 request.getSession().setAttribute("Propiedades", propiedades);
	     // Redirigir a index.jsp después de cargar los datos en la sesión
	     response.sendRedirect(request.getContextPath() + "/index.jsp");
	     System.out.println("cant de propieadades: "+ propiedades.size());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
