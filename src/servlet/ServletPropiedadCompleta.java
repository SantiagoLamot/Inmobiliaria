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
		session.setAttribute("Propiedad", np.ObtenerropiedadConImagenes(id));
		response.sendRedirect(request.getContextPath() + "/verMas.jsp");
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
