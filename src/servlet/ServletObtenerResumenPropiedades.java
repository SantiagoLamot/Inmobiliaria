package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegocioPropiedad;

@WebServlet("/ServletObtenerResumenPropiedades")
public class ServletObtenerResumenPropiedades extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletObtenerResumenPropiedades() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NegocioPropiedad np = new NegocioPropiedad();
		request.getSession().setAttribute("Propiedades", np.ObtenerResumenDePropiedades());
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
