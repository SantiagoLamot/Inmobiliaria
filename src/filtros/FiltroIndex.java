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

@WebFilter("/index.jsp")
public class FiltroIndex implements Filter {

    public FiltroIndex() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Convertir las interfaces genéricas a las específicas de HTTP
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        System.out.println("Entro al filtro index");
        // Redirigir al servlet que me carga el resumend de propieda deseado
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/ServletObtenerResumenPropiedades");
//		// pass the request along the filter chain
//		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
