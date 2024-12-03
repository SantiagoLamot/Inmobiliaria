package negocio;

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

}
