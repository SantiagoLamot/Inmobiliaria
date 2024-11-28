package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Contacto;
import negocio.NegocioContacto;
@WebServlet("/ServletContacto")
public class ServletContacto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletContacto() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NegocioContacto nc = new NegocioContacto();
		Contacto c = nc.ObtenerDatosContactos();
		request.getSession().setAttribute("contacto", c);
	    // Redirigir a index.jsp después de cargar los datos en la sesión
	    response.sendRedirect(request.getContextPath() + "/contacto.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
