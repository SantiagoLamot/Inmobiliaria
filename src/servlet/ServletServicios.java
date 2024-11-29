package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NegocioServicio;

@WebServlet("/ServletServicios")
public class ServletServicios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NegocioServicio ns = new NegocioServicio();
	public ServletServicios() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("Servicios", ns.ObtenerServicios());
		response.sendRedirect(request.getContextPath() + "/servicios.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
