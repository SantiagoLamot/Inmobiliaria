package filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet Filter implementation class FiltroAdministradores
 */
@WebFilter("/Administrador/*")
public class FiltroAdministradores implements Filter {

    public FiltroAdministradores() {
    }
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Convertir las interfaces ServletRequest y ServletResponse a sus equivalentes HTTP
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Obtener la sesi�n activa (sin crear una nueva si no existe)
        HttpSession session = httpRequest.getSession(false);

        // Inicializar la variable `u` para almacenar el atributo "Usuario" de la sesi�n
        String u = null;

        // Si la sesi�n existe, intentar obtener el atributo "Usuario"
        if (session != null) {
            u = (String) session.getAttribute("Usuario");
        }

        // Validar que la sesi�n sea v�lida y que el usuario sea administrador
        if (session == null || !"Admin".equals(u)) {
            // Si no hay sesi�n o el usuario no es administrador, redirigir al login
            if (session != null) {
                // Solo agregar mensaje si hay una sesi�n activa
                session.setAttribute("Mensaje", "Acceso denegado: Debe iniciar sesi�n como administrador.");
            }
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/adminLogin.jsp");
            return;
        }

        // Continuar con la cadena del filtro si la validaci�n es exitosa
        chain.doFilter(request, response);
    }

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
