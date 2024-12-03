package entidades;

public class Administrador {
	private String Usuario;
	private String Contrasenia;
	
	public Administrador() {
		super();
	}

	public Administrador(String usuario, String contrasenia) {
		super();
		Usuario = usuario;
		Contrasenia = contrasenia;
	}

	public String getUsuario() {
		return Usuario;
	}

	public void setUsuario(String usuario) {
		Usuario = usuario;
	}

	public String getContrasenia() {
		return Contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		Contrasenia = contrasenia;
	}
	
	
}
