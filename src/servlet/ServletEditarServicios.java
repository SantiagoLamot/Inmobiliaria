package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Servicio;
import negocio.NegocioServicio;

@WebServlet("/ServletEditarServicios")
public class ServletEditarServicios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	NegocioServicio ns = new NegocioServicio();   
    public ServletEditarServicios() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("Servicios", ns.ObtenerServicios());
		response.sendRedirect(request.getContextPath() + "/Administrador/editarServicio.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("btnActualizar") != null) {
			String idS = request.getParameter("idServicio");
			String servicio = request.getParameter("txtServicio");
			String estadoS = request.getParameter("SelectEstado");
			
			int id = Integer.parseInt(idS);
			boolean estado = Boolean.parseBoolean(estadoS);
			
			Servicio s = new Servicio(id,servicio,estado);
			ns.ActualizarServicio(s);
	    } 
		else if (request.getParameter("btnEliminar") != null) {
			String idS = request.getParameter("idServicio");
			int id = Integer.parseInt(idS);
			ns.EliminarServicio(id);
		}
		response.sendRedirect(request.getContextPath() + "/ServletEditarServicios");
	}
}
