package entidades;

public class Propiedad {
	private String Titulo;
	private String URLimagen;
	private String Precio;
	private String Resenia;
	private String Descripcion;
	private String Ubicacion;
	
	public Propiedad() {
		super();
	}

	public Propiedad(String titulo, String uRLimagen, String resenia, String descripcion,
			String ubicacion) {
		super();
		Titulo = titulo;
		URLimagen = uRLimagen;
		Resenia = resenia;
		Descripcion = descripcion;
		Ubicacion = ubicacion;
	}
	
	public Propiedad(String titulo, String uRLimagen, String precio, String resenia, String descripcion,
			String ubicacion) {
		super();
		Titulo = titulo;
		URLimagen = uRLimagen;
		Precio = precio;
		Resenia = resenia;
		Descripcion = descripcion;
		Ubicacion = ubicacion;
	}

	public String getTitulo() {
		return Titulo;
	}

	public void setTitulo(String titulo) {
		Titulo = titulo;
	}

	public String getURLimagen() {
		return URLimagen;
	}

	public void setURLimagen(String uRLimagen) {
		URLimagen = uRLimagen;
	}

	public String getPrecio() {
		return Precio;
	}

	public void setPrecio(String precio) {
		Precio = precio;
	}

	public String getResenia() {
		return Resenia;
	}

	public void setResenia(String resenia) {
		Resenia = resenia;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

	public String getUbicacion() {
		return Ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		Ubicacion = ubicacion;
	}
}
