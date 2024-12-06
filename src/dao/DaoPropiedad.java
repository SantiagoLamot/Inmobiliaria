package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import dao.DaoConexion;
import entidades.Imagen;
import entidades.Propiedad;


public class DaoPropiedad {
	
	public int RegistrarPropiedad(Propiedad p) {
		int IdPropiedad	= -1;
		try {
				DaoConexion dc = new DaoConexion();
				Connection cn = dc.getConnection();

				PreparedStatement pstmt = cn.prepareStatement("INSERT INTO `db_inmobiliaria`.`tb_propiedades` "
						+ "(`titulo`, `precio`, `resenia`, `descripcion`, `urlMaps`, `localidad`, `fechaUltMod`) VALUES (?, ?, ?, ?, ?, ?, ?);",
						Statement.RETURN_GENERATED_KEYS);
				// Statement.RETURN_GENERATED_KEYS: Esto indica al driver de la base de datos que queremos recuperar las claves generadas automáticamente.
				pstmt.setString(1, p.getTitulo());
				pstmt.setString(2, p.getPrecio());
				pstmt.setString(3, p.getResenia());
				pstmt.setString(4, p.getDescripcion());
				pstmt.setString(5, p.getURLmaps());
				pstmt.setString(6, p.getLocalidad());
				// Obtenir la fecha y hora actual
				java.util.Date ahora = new java.util.Date();

				// Convertir java.util.Date a java.sql.Timestamp
				java.sql.Timestamp fechaActual = new java.sql.Timestamp(ahora.getTime());

				pstmt.setTimestamp(7, fechaActual);
				
				int r = pstmt.executeUpdate();
				if (r > 0) {
		            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
		                if (generatedKeys.next()) {
		                    IdPropiedad = generatedKeys.getInt(1);
		                }
		            }
		        }
			
		    } catch (Exception e) {
		        System.out.print("Error registrando propiedad: " + e);
		    }
		    return IdPropiedad;
		}
	
	public Propiedad ObtenerPropiedadConImagenes(int id)
	{
		Propiedad p = new Propiedad();;
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT tb_propiedades.*, img_filtradas.url, img_filtradas.id AS idImagen FROM db_inmobiliaria.tb_propiedades LEFT JOIN (SELECT tb_imagenes.url, tb_imagenes.id, tb_imagenes_propiedades.id_propiedad FROM db_inmobiliaria.tb_imagenes INNER JOIN db_inmobiliaria.tb_imagenes_propiedades ON tb_imagenes.id = tb_imagenes_propiedades.id_imagen WHERE tb_imagenes.estado = 1) AS img_filtradas ON tb_propiedades.id = img_filtradas.id_propiedad WHERE tb_propiedades.id = ?;");
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				p.setId(rs.getInt("id"));
				p.setTitulo(rs.getString("titulo"));
				p.setPrecio(rs.getString("precio"));
				p.setResenia(rs.getString("resenia"));
				p.setDescripcion(rs.getString("descripcion"));
				p.setURLmaps(rs.getString("urlMaps"));
				p.setLocalidad(rs.getString("localidad"));
				p.addImagen(new Imagen(rs.getInt("idImagen"), rs.getString("url")));
				while (rs.next()) {
					p.addImagen(new Imagen(rs.getInt("idImagen"), rs.getString("url")));
				} 
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return p;
	}
	
	public List<Propiedad> ObtenerResumenPropiedades()
	{
		List<Propiedad> propiedades = new ArrayList<>();
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT tb_propiedades.*, tb_imagenes.url AS urlImagenPrin "
					+ "FROM db_inmobiliaria.tb_propiedades "
					+ "LEFT JOIN db_inmobiliaria.tb_imagenes ON tb_imagenes.id = tb_propiedades.idImagenPrincipal "
					+ "WHERE tb_propiedades.estado = 1 "
					+ "ORDER BY "
					+ "tb_propiedades.fechaUltMod DESC;");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				Propiedad p = new Propiedad();
				p.setId(rs.getInt("id"));
				p.setTitulo(rs.getString("titulo"));
				p.setResenia(rs.getString("resenia"));
				p.setURLimagenPrincipal(rs.getString("urlImagenPrin"));
				p.setLocalidad(rs.getString("localidad"));
				p.setLocalidad(rs.getString("urlMaps"));
				propiedades.add(p);
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return propiedades;
	}
	
	
	public void ActualizarPropiedad(Propiedad p) {
		try {
				DaoConexion dc = new DaoConexion();
				Connection cn = dc.getConnection();
				PreparedStatement pstmt = cn.prepareStatement("UPDATE `db_inmobiliaria`.`tb_propiedades` "
						+ "SET `titulo`=?, `precio`=?, `resenia`=?, `descripcion`=?, `urlMaps`=?, `localidad`=?, `fechaUltMod`=? "
						+ "WHERE `id`=?;");
				pstmt.setString(1, p.getTitulo());
				pstmt.setString(2, p.getPrecio());
				pstmt.setString(3, p.getResenia());
				pstmt.setString(4, p.getDescripcion());
				pstmt.setString(5, p.getURLmaps());
				pstmt.setString(6, p.getLocalidad());
				// Obtenir la fecha y hora actual
				java.util.Date ahora = new java.util.Date();

				// Convertir java.util.Date a java.sql.Timestamp
				java.sql.Timestamp fechaActual = new java.sql.Timestamp(ahora.getTime());

				pstmt.setTimestamp(7, fechaActual);
				pstmt.setInt(8, p.getId());
				
				pstmt.executeUpdate();
		 } catch (Exception e) {
		        System.out.print("Error registrando propiedad: " + e);
		}
	}
	
	public void ActualizarImagenPrincipal(Propiedad p)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("UPDATE `db_inmobiliaria`.`tb_propiedades` SET `idImagenPrincipal`=?, `fechaUltMod`=?  WHERE `id`=?;");
			pstmt.setInt(1, p.getIdImagenPrincipal());
			// Obtenir la fecha y hora actual
			java.util.Date ahora = new java.util.Date();

			// Convertir java.util.Date a java.sql.Timestamp
			java.sql.Timestamp fechaActual = new java.sql.Timestamp(ahora.getTime());

			pstmt.setTimestamp(2, fechaActual);

			pstmt.setInt(3, p.getId());
			
			pstmt.executeUpdate();
		} 
		catch (Exception e) {
	        System.out.print("Error registrando id propiedad principal: " + e);
		}
	}
	
	public void BajaLogicaPropiedad(int id)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("UPDATE `db_inmobiliaria`.`tb_propiedades` SET `estado`=0 WHERE `id`=?;");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} 
		catch (Exception e) {
	        System.out.print("Error registrando id propiedad principal: " + e);
		}
	}
}