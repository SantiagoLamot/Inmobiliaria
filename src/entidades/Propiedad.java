package entidades;

public class Propiedad {
	private int Id;
	private String Titulo;
	private String Localidad;
	private String URLimagenPrincipal;
	private String Precio;
	private String Resenia;
	private String Descripcion;
	private String URLmaps;
	
	public Propiedad() {
		super();
	}

	public Propiedad(String titulo, String localidad,String uRLimagen, String resenia, String descripcion,
			String urlMaps) {
		super();
		Titulo = titulo;
		Localidad = localidad;
		URLimagenPrincipal = uRLimagen;
		Resenia = resenia;
		Descripcion = descripcion;
		URLmaps = urlMaps;
	}
	
	public Propiedad(int id,String titulo, String uRLimagen, String precio, String resenia, String descripcion,
			String ubicacion) {
		super();
		Id = id;
		Titulo = titulo;
		URLimagenPrincipal = uRLimagen;
		Precio = precio;
		Resenia = resenia;
		Descripcion = descripcion;
		URLmaps = ubicacion;
	}
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getTitulo() {
		return Titulo;
	}

	public void setTitulo(String titulo) {
		Titulo = titulo;
	}

	public String getLocalidad() {
		return Localidad;
	}

	public void setLocalidad(String localidad) {
		Localidad = localidad;
	}

	public String getURLimagenPrincipal() {
		return URLimagenPrincipal;
	}

	public void setURLimagenPrincipal(String uRLimagenPrincipal) {
		URLimagenPrincipal = uRLimagenPrincipal;
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

	public String getURLmaps() {
		return URLmaps;
	}

	public void setURLmaps(String urlMaps) {
		URLmaps = urlMaps;
	}
}
