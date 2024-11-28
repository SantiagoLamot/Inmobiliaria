package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidades.Contacto;


public class DaoContacto {
	
	public Contacto ObtenerDatosContactos()
	{
		Contacto c = new Contacto();;
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT * FROM db_inmobiliaria.tb_contactos;");
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				c.setDireccion(rs.getString("direccion"));
				c.setUrlfacebook(rs.getString("urlFacebook"));
				c.setUrlInstagram(rs.getString("urlInstagram"));
				c.setUrlWhatsapp(rs.getString("urlWhatsapp"));
				c.setUrlMaps(rs.getString("urlMaps"));
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return c;
	}
	

}
