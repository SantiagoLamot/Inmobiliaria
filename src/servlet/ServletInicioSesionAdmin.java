package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			System.out.println("Inicio Sesion");
		}
		else 
		{
			System.out.println("No INICIO");
		}
	}

}
