package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import dao.DaoConexion;
import entidades.Propiedad;


public class DaoPropiedad {
	
	public int RegistrarPropiedad(Propiedad p) {
		int IdPropiedad	= -1;
		try {
				DaoConexion dc = new DaoConexion();
				Connection cn = dc.getConnection();
				PreparedStatement pstmt = cn.prepareStatement("INSERT INTO `db_inmobiliaria`.`tb_propiedades` "
						+ "(`titulo`, `precio`, `resenia`, `descripcion`, `ubicacion`, `localidad`) VALUES (?, ?, ?, ?, ?, ?);",
						Statement.RETURN_GENERATED_KEYS);
				// Statement.RETURN_GENERATED_KEYS: Esto indica al driver de la base de datos que queremos recuperar las claves generadas automáticamente.
				pstmt.setString(1, p.getTitulo());
				pstmt.setString(2, p.getPrecio());
				pstmt.setString(3, p.getResenia());
				pstmt.setString(4, p.getDescripcion());
				pstmt.setString(5, p.getURLmaps());
				pstmt.setString(6, p.getLocalidad());
				
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
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT db_inmobiliaria.tb_propiedades.*, db_inmobiliaria.tb_imagenes.url FROM db_inmobiliaria.tb_propiedades " + 
					"inner join db_inmobiliaria.tb_imagenes_propiedades on tb_propiedades.id = tb_imagenes_propiedades.id_propiedad " + 
					"inner join db_inmobiliaria.tb_imagenes on tb_imagenes_propiedades.id_imagen = tb_imagenes.id \r\n" + 
					"where db_inmobiliaria.tb_propiedades.id = ?");
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
			{
				p.setId(rs.getInt("id"));
				p.setTitulo(rs.getString("titulo"));
				p.setPrecio(rs.getString("precio"));
				p.setResenia(rs.getString("resenia"));
				p.setDescripcion(rs.getString("descripcion"));
				p.setURLmaps(rs.getString("ubicacion"));
				p.setLocalidad(rs.getString("localidad"));
				p.addURLimagen(rs.getString("url"));
				while (rs.next()) {
					p.addURLimagen(rs.getString("url"));
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
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT tb_propiedades.id, tb_propiedades.titulo,tb_propiedades.resenia, tb_propiedades.localidad,  db_inmobiliaria.tb_imagenes.url FROM db_inmobiliaria.tb_propiedades " + 
					"inner join db_inmobiliaria.tb_imagenes_propiedades on tb_propiedades.id = tb_imagenes_propiedades.id_propiedad " + 
					"inner join db_inmobiliaria.tb_imagenes on tb_imagenes_propiedades.id_imagen = tb_imagenes.id " + 
					"GROUP BY db_inmobiliaria.tb_propiedades.id;");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				Propiedad p = new Propiedad();
				p.setId(rs.getInt("id"));
				p.setTitulo(rs.getString("titulo"));
				p.setResenia(rs.getString("resenia"));
				p.setURLimagenPrincipal(rs.getString("url"));
				p.setLocalidad(rs.getString("localidad"));
				propiedades.add(p);
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return propiedades;
	}
	
}