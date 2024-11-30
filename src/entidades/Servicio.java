package entidades;

public class Servicio {
	private int Id;
	private String Servicio;
	private boolean estado;
	
	public Servicio() {
		super();
	}

	public Servicio(String servicio) {
		super();
		Servicio = servicio;
	}
	public Servicio(int id, String servicio) {
		super();
		Id = id;
		Servicio = servicio;
	}
		
	public Servicio(int id, String servicio, boolean estado) {
		super();
		Id = id;
		Servicio = servicio;
		this.estado = estado;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getServicio() {
		return Servicio;
	}

	public void setServicio(String servicio) {
		Servicio = servicio;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

}
