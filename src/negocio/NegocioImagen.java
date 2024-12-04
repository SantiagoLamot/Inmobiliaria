package negocio;

import java.util.List;

import dao.*;
import entidades.*;

public class NegocioImagen {
	
	DaoImagen di = new DaoImagen();
	public void RegistrarImagen(Imagen i)
	{
		di.GrabarImagen(i);
		return;
	}
	
	public void bajaLogImagen(int id)
	{
		di.bajaLogImagen(id);
		return;
	}
	public List<String> ObtenerImagenes(int id)
	{
		return di.ObtenerListaImagenes(id);
	}

}
