package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import entidades.Imagen;

public class DaoImagen {
	public void GrabarImagen(Imagen i)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("INSERT INTO `db_inmobiliaria`.`tb_imagenes` (`url`) VALUES (?);", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, i.getURLimagen());
						
			int r = pstmt.executeUpdate();
			if (r > 0) {
	            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
	                if (generatedKeys.next()) {
	                    i.setIdImagen(generatedKeys.getInt(1));
	                    DaoImagen.GrabarImagenPorPropiedad(i);
	                }
	            }
	        }
		
	    } catch (Exception e) {
	        System.out.print("Error registrando usuario visitante: " + e);
	    }  
	}
	
	public static void GrabarImagenPorPropiedad(Imagen i)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("INSERT INTO `db_inmobiliaria`.`tb_imagenes_propiedades` (`id_imagen`, `id_propiedad`) VALUES (?, ?);");
			pstmt.setInt(1, i.getIdImagen());
			pstmt.setInt(2, i.getIdPropiedad());
						
			pstmt.executeUpdate();
		
	    } catch (Exception e) {
	        System.out.print("Error registrando usuario visitante: " + e);
	    }  	
	}
	
	public void bajaLogImagen(int id)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("UPDATE `db_inmobiliaria`.`tb_imagenes` SET `estado`='0' WHERE tb_imagenes.id = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		
	    } catch (Exception e) {
	        System.out.print("Error registrando baja de imagen: " + e);
	    }  	
	}
	
	public List<String> ObtenerListaImagenes(int id)
	{
		List<String> listaURL = new ArrayList<>();
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("SELECT tb_imagenes.url FROM db_inmobiliaria.tb_imagenes "
					+ "left join db_inmobiliaria.tb_imagenes_propiedades on tb_imagenes.id = tb_imagenes_propiedades.id_imagen "
					+ "left join db_inmobiliaria.tb_propiedades on tb_imagenes_propiedades.id_propiedad = tb_propiedades.id "
					+ "where tb_propiedades.id = ?;");
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				listaURL.add(rs.getString("url"));
	        }
	    } catch (Exception e) {
	        System.out.print("Error buscando imagenes a borrar: " + e);
	    }
		return listaURL;
	}
}
