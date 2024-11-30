package negocio;

import dao.DaoContacto;
import entidades.Contacto;

public class NegocioContacto {
	DaoContacto dc = new DaoContacto();
	
	public Contacto ObtenerDatosContactos()
	{
		return dc.ObtenerDatosContactos();
	}
	
	public void ActualizarContactos(Contacto c)
	{
		dc.ActualizarContactos(c);
		return;
	}
	
	public String ObtenerUrlWhatsapp()
	{
		return dc.ObtenerUrlWhatsapp();
	}
	
}
