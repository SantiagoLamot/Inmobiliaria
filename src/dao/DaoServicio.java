package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Servicio;

public class DaoServicio {
	
	public List<Servicio> ObtenerServicios()
	{
		List<Servicio> servicios = new ArrayList<>();
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT * FROM db_inmobiliaria.tb_servicios where tb_servicios.estado = 1");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				Servicio s = new Servicio(rs.getInt("id"),rs.getString("servicio"));
				servicios.add(s);
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return servicios;
	}
	
}
