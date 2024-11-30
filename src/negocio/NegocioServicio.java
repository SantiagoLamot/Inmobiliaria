package negocio;

import java.util.List;

import dao.DaoServicio;
import entidades.Servicio;

public class NegocioServicio {
	DaoServicio ds = new DaoServicio();
	
	public List<Servicio> ObtenerServiciosActivos()
	{
		return ds.ObtenerServiciosActivos();
	}
	
	public List<Servicio> ObtenerServicios()
	{
		return ds.ObtenerServicios();
	}
	
	public void ActualizarServicio(Servicio s)
	{
		ds.ActualizarServicio(s);
		return; 
	}
	public void AgregarServicio(Servicio s)
	{
		ds.AgregarServicio(s);
		return;
	}
	public void EliminarServicio(int id)
	{
		ds.EliminarServicio(id);
		return;
	}
}

