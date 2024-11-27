package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}