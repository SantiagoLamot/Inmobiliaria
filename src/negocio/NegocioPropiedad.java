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
	
	public Propiedad ObtenerPropiedadConImagenes(int id)
	{
		return daop.ObtenerPropiedadConImagenes(id);
	}
	
	public List<Propiedad> ObtenerResumenDePropiedades()
	{
		return daop.ObtenerResumenPropiedades();
	}
	
	public void ActualizarPropiedad(Propiedad p)
	{
		daop.ActualizarPropiedad(p);
		return;
	}
}
