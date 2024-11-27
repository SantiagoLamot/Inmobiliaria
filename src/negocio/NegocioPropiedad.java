package negocio;

import dao.DaoPropiedad;
import entidades.Propiedad;

public class NegocioPropiedad {

	public int RegistrarPropiedad(Propiedad p)
	{
		DaoPropiedad daop = new DaoPropiedad();
		return daop.RegistrarPropiedad(p);
	}
}
