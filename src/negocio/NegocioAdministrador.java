package negocio;

import dao.DaoAdministrador;
import entidades.Administrador;

public class NegocioAdministrador {
	DaoAdministrador da = new DaoAdministrador();
	
	public boolean IntentoInicioSesion(Administrador a)
	{
		return da.IntentoInicioSesion(a);
	}
}
