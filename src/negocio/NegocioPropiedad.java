package negocio;

import java.util.List;

import dao.DaoPropiedad;
import entidades.Propiedad;

public class NegocioPropiedad {

	DaoPropiedad daop = new DaoPropiedad();
	public int RegistrarPropiedad(Propiedad p)
	{
		return daop.RegistrarPropiedad(p);
	}
	
	public Propiedad ObtenerropiedadConImagenes(int id)
	{
		return daop.ObtenerPropiedadConImagenes(id);
	}
	
	public List<Propiedad> ObtenerResumenDePropiedades()
	{
		return daop.ObtenerResumenPropiedades();
	}
}
