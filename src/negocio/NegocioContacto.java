package negocio;

import dao.DaoContacto;
import entidades.Contacto;

public class NegocioContacto {
	DaoContacto dc = new DaoContacto();
	
	public Contacto ObtenerDatosContactos()
	{
		return dc.ObtenerDatosContactos();
	}
}
