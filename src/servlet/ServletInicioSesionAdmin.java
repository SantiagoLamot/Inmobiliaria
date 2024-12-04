package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Administrador;
import negocio.NegocioAdministrador;
@WebServlet("/ServletInicioSesionAdmin")
public class ServletInicioSesionAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    NegocioAdministrador na = new NegocioAdministrador();
	public ServletInicioSesionAdmin() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Administrador a = new Administrador(request.getParameter("txtUsuario"), request.getParameter("txtContrasenia"));
		if(na.IntentoInicioSesion(a))
		{
			// Renovar la sesi�n para evitar reutilizaci�n
	        HttpSession oldSession = request.getSession(false);
	        if (oldSession != null) {
	            oldSession.invalidate();
	        }

	        // Crear una nueva sesi�n
	        HttpSession newSession = request.getSession(true);
	        newSession.setAttribute("Usuario", "Admin");
	        
	        // Redirigir al �rea de administraci�n
	        response.sendRedirect(request.getContextPath() + "/Administrador/principalAdministrador.jsp");
	    } else {
	        // Si las credenciales son incorrectas, reutilizar la sesi�n existente para enviar el mensaje
	        HttpSession session = request.getSession();
	        session.setAttribute("Mensaje", "Usuario o contrase�a incorrecta");
	        response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
	    }
	}

}
