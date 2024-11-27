package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import entidades.Propiedad;
import negocio.NegocioPropiedad;

@WebServlet("/ServletGuardarPropiedad")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ServletGuardarPropiedad extends HttpServlet {
	
	private static final String UPLOAD_DIR = "uploads";
	private static final long serialVersionUID = 1L;
    
	public ServletGuardarPropiedad() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("btnGuardar")!= null)
		{
			Propiedad p = new Propiedad();
			p.setTitulo(request.getParameter("txtTitulo"));
			p.setResenia(request.getParameter("txtResenia"));
			p.setDescripcion(request.getParameter("Descripcion"));
			p.setPrecio(request.getParameter("txtPrecio"));
			p.setLocalidad(request.getParameter("txtLocalidad"));
			p.setURLmaps(request.getParameter("textUrlMaps"));
			NegocioPropiedad np = new NegocioPropiedad();
			
			int idPropiedad = np.RegistrarPropiedad(p);
			// Obtener la ruta absoluta de la aplicación web
	        String applicationPath = request.getServletContext().getRealPath("");
	        
	        // Construir la ruta del directorio donde se guardarán los archivos subidos
	        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
	        
	        // Crear el directorio de guardado si no existe
	        File fileSaveDir = new File(uploadFilePath);
	        if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdirs();
	        }

	        // Procesar cada parte del request (cada archivo subido)
	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);
	            
	            if (fileName != null && !fileName.isEmpty()) {
	                // Guardar el archivo en el directorio especificado
	                part.write(uploadFilePath + File.separator + fileName);

	                // Guardar la URL en la base de datos
	                String fileUrl = UPLOAD_DIR + "/" + fileName;
	                saveFileUrlToDatabase(fileUrl);
	            }
	        }

	        response.getWriter().print("¡Subida de archivos exitosa!");
	    }	
	}
	
	
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return null;
	}

}
