package entidades;

public class Contacto {
	private String UrlWhatsapp;
	private String UrlInstagram;
	private String Urlfacebook;
	private String UrlMaps;
	private String Direccion;
	
	public Contacto() {
		super();
	}

	public Contacto(String urlWhatsapp, String urlInstagram, String urlfacebook, String urlMaps, String direccion) {
		super();
		UrlWhatsapp = urlWhatsapp;
		UrlInstagram = urlInstagram;
		Urlfacebook = urlfacebook;
		UrlMaps = urlMaps;
		Direccion = direccion;
	}
	
	public String getUrlWhatsapp() {
		return UrlWhatsapp;
	}
	public void setUrlWhatsapp(String urlWhatsapp) {
		UrlWhatsapp = urlWhatsapp;
	}
	public String getUrlInstagram() {
		return UrlInstagram;
	}
	public void setUrlInstagram(String urlInstagram) {
		UrlInstagram = urlInstagram;
	}
	public String getUrlfacebook() {
		return Urlfacebook;
	}
	public void setUrlfacebook(String urlfacebook) {
		Urlfacebook = urlfacebook;
	}
	public String getUrlMaps() {
		return UrlMaps;
	}
	public void setUrlMaps(String urlMaps) {
		UrlMaps = urlMaps;
	}
	public String getDireccion() {
		return Direccion;
	}
	public void setDireccion(String direccion) {
		Direccion = direccion;
	}
	
	
}
