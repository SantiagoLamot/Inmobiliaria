package negocio;

import dao.*;
import entidades.*;

public class NegocioImagen {
	
	public void RegistrarImagen(Imagen i)
	{
		DaoImagen di = new DaoImagen();
		di.GrabarImagen(i);
	}

}
