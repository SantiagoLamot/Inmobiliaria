package entidades;

public class Imagen {
	private int IdImagen;
	private int IdPropiedad;
	private String URLimagen;
	
	
	public Imagen() {
		super();
	}


	public Imagen(int idPropiedad, String uRLimagen) {
		super();
		IdPropiedad = idPropiedad;
		URLimagen = uRLimagen;
	}


	public Imagen(int idImagen, int idPropiedad, String uRLimagen) {
		super();
		IdImagen = idImagen;
		IdPropiedad = idPropiedad;
		URLimagen = uRLimagen;
	}


	public int getIdImagen() {
		return IdImagen;
	}


	public void setIdImagen(int idImagen) {
		IdImagen = idImagen;
	}


	public int getIdPropiedad() {
		return IdPropiedad;
	}


	public void setIdPropiedad(int idPropiedad) {
		IdPropiedad = idPropiedad;
	}


	public String getURLimagen() {
		return URLimagen;
	}


	public void setURLimagen(String uRLimagen) {
		URLimagen = uRLimagen;
	}
		
}
