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

@WebFilter("")
public class FiltroIndex implements Filter {

    public FiltroIndex() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Convertir las interfaces genéricas a las específicas de HTTP
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Redirigir al servlet que me carga el resumend de propieda deseado
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/ServletObtenerResumenPropiedades");
		return;
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
