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
    	// Par�metros para paginar
        String pageParam = request.getParameter("page");
        int page = 1;
        try {
            page = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            page = 1; // P�gina por defecto
        }

        int limit = 3; // N�mero de propiedades por p�gina

        // Obtener propiedades
        List<Propiedad> propiedades = np.ObtenerResumenDePropiedades();
        if (propiedades == null || propiedades.isEmpty()) {
        	request.setAttribute("propiedadesPaginadas", propiedades);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", 1);
            request.getRequestDispatcher("/propiedades.jsp").forward(request, response);
            return;
        }

        // Calcular �ndices de paginaci�n
        int totalPropiedades = propiedades.size();
        int totalPages = (int) Math.ceil((double) totalPropiedades / limit);
        page = Math.max(1, Math.min(page, totalPages)); // Asegurar que page est� en rango

        int start = Math.max(0, (page - 1) * limit);
        int end = Math.min(start + limit, totalPropiedades);

        // Sublista para la p�gina actual
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
