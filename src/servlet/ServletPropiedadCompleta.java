package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.NegocioContacto;
import negocio.NegocioPropiedad;
@WebServlet("/ServletPropiedadCompleta")
public class ServletPropiedadCompleta extends HttpServlet {
	NegocioPropiedad np = new NegocioPropiedad();
	NegocioContacto nc = new NegocioContacto();
	private static final long serialVersionUID = 1L;
    public ServletPropiedadCompleta() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String idPropiedad = request.getParameter("id");
		int id = Integer.parseInt(idPropiedad);
		session.setAttribute("UrlWhatsapp", nc.ObtenerUrlWhatsapp());
		session.setAttribute("Propiedad", np.ObtenerPropiedadConImagenes(id));
		String source = request.getParameter("source");
		if (source != null && "admin".equals(source)) {
			// Redirigir a /Administrador/editarPropiedad.jsp después de cargar los datos en la sesión
		    response.sendRedirect(request.getContextPath() + "/Administrador/editarPropiedad.jsp");
		}
		else
		{
			// Redirigir a verMas.jsp después de cargar los datos en la sesión
			response.sendRedirect(request.getContextPath() + "/verMas.jsp");
		}
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
