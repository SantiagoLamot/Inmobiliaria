package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Contacto;
import negocio.NegocioContacto;

@WebServlet("/ServletEditarContactos")
public class ServletEditarContactos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NegocioContacto nc = new NegocioContacto();
    public ServletEditarContactos() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Contacto c = nc.ObtenerDatosContactos();
		request.getSession().setAttribute("contacto", c);
	    // Redirigir a index.jsp después de cargar los datos en la sesión
	    response.sendRedirect(request.getContextPath() + "/Administrador/editarContacto.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Contacto c = new Contacto();
		c.setUrlfacebook(request.getParameter("txtFacebook"));
		c.setUrlInstagram(request.getParameter("txtInsta"));
		c.setUrlWhatsapp(request.getParameter("txtWhats"));
		c.setUrlMaps(request.getParameter("txtMaps"));
		c.setDireccion(request.getParameter("txtDireccion"));
		request.getSession().setAttribute("contacto", c);
		nc.ActualizarContactos(c);
		// Redirigir a index.jsp después de cargar los datos en la sesión
	    response.sendRedirect(request.getContextPath() + "/Administrador/editarContacto.jsp");		
        return;
	}

}
