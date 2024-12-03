package servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entidades.*;
import negocio.NegocioImagen;
import negocio.NegocioPropiedad;
@WebServlet("/ServletActualizarPropiedad")
//IMPORTANTE CUANDO SE USA EL enctype="multipart/form-data" en el FORM DEL JSP, que permitte enviar archivos como img 
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ServletActualizarPropiedad extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "uploads";
	Propiedad p = new Propiedad();
	Imagen i = new Imagen();
	NegocioPropiedad np = new NegocioPropiedad();
    NegocioImagen ni = new NegocioImagen();
	public ServletActualizarPropiedad() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idS = request.getParameter("idP");
		p.setId(Integer.parseInt(idS));
		p.setTitulo(request.getParameter("txtTitulo"));
		System.out.println("ID Propiedad: " + request.getParameter("idPropiedad"));
		System.out.println("Título: " + request.getParameter("txtTitulo"));
		System.out.println("Localidad: " + request.getParameter("txtLocalidad"));
		System.out.println("Precio: " + request.getParameter("txtPrecio"));
		System.out.println("Reseña: " + request.getParameter("txtResenia"));
		p.setResenia(request.getParameter("txtResenia"));
		p.setDescripcion(request.getParameter("txtDescripcion"));
		p.setPrecio(request.getParameter("txtPrecio"));
		p.setLocalidad(request.getParameter("txtLocalidad"));
		p.setURLmaps(request.getParameter("textUrlMaps"));
			
		np.ActualizarPropiedad(p);
		i.setIdPropiedad(p.getId());
			
		if(i.getIdPropiedad()!=-1)
		{
			// Obtener la ruta absoluta de la aplicación web
			String applicationPath = request.getServletContext().getRealPath("");
			System.out.println(applicationPath);
			// Construir la ruta del directorio donde se guardarán los archivos subidos
			String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
			
			// Crear el directorio de guardado si no existe
			File fileSaveDir = new File(uploadFilePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}
			
			// Procesar cada parte del request (cada archivo subido)
			for (Part part : request.getParts()) {
				String fileType = extractFileType(part);

				
				if (fileType != null && !fileType.isEmpty()) {
					//Le agrego valores random al nombre asi no se repite nunca
					String fileName = UUID.randomUUID().toString()+fileType;
					
					// Guardar el archivo en el directorio especificado
					part.write(uploadFilePath + File.separator + fileName);
					
					// Guardar la URL en la base de datos
					i.setURLimagen(UPLOAD_DIR + "/" + fileName);
					ni.RegistrarImagen(i);
				}
			}
				HttpSession session = request.getSession(false);
			    session.setAttribute("Mensaje", "Propiedad registrada exitosamente");
			    response.sendRedirect(request.getContextPath() + "/Administrador/principalAdministrador.jsp");
			    return;
			}
			else {
				HttpSession session = request.getSession(false);
			    session.setAttribute("Mensaje", "Ocurrio un error al agregar propiedad");
			    response.sendRedirect(request.getContextPath() + "/Administrador/AgregarPropiedad.jsp");
			    return;
			}
	}
	
	
	private String extractFileType(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            String fileName = new File(s.substring(s.indexOf("=") + 2, s.length() - 1)).getName();
	            if (fileName.contains(".")) {
	                // Extrae la extensión del archivo (ejemplo: ".jpg")
	                return fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
	            }
	        }
	    }
	    return ""; // Si no se encuentra una extensión
	}
}
