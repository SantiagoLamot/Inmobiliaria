package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import entidades.Propiedad;
import negocio.NegocioPropiedad;

@WebServlet("/ServletObtenerPropiedadesPaginadas")
public class ServletObtenerPropiedadesPaginadas extends HttpServlet {
	NegocioPropiedad np = new NegocioPropiedad();

	private static final long serialVersionUID = 1L;
       
    public ServletObtenerPropiedadesPaginadas() {
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Entro al servlet de paginacion");
    	// Parámetros para paginar
        String pageParam = request.getParameter("page");
        int page = 1;
        try {
            page = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            page = 1; // Página por defecto
        }

        int limit = 3; // Número de propiedades por página

        // Obtener propiedades
        List<Propiedad> propiedades = np.ObtenerResumenDePropiedades();
        if (propiedades == null || propiedades.isEmpty()) {
        	request.setAttribute("propiedadesPaginadas", propiedades);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", 1);
            request.getRequestDispatcher("/propiedades.jsp").forward(request, response);
            return;
        }

        // Calcular índices de paginación
        int totalPropiedades = propiedades.size();
        int totalPages = (int) Math.ceil((double) totalPropiedades / limit);
        page = Math.max(1, Math.min(page, totalPages)); // Asegurar que page esté en rango

        int start = Math.max(0, (page - 1) * limit);
        int end = Math.min(start + limit, totalPropiedades);

        // Sublista para la página actual
        List<Propiedad> propiedadesPaginadas = propiedades.subList(start, end);

        // Pasar datos al JSP
        request.setAttribute("propiedadesPaginadas", propiedadesPaginadas);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/propiedades.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
