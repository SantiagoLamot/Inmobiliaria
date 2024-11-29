package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entidades.Servicio;

public class DaoServicio {
	
	public List<Servicio> ObtenerServiciosActivos()
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
	
	public List<Servicio> ObtenerServicios()
	{
		List<Servicio> servicios = new ArrayList<>();
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			
			PreparedStatement pstmt = cn.prepareStatement("SELECT * FROM db_inmobiliaria.tb_servicios");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				Servicio s = new Servicio(rs.getInt("id"),rs.getString("servicio"), rs.getBoolean("estado"));
				servicios.add(s);
			}
		}
		catch (Exception e) {
			System.out.print("Error" + e);
		}
		return servicios;
	}
	
	public void ActualizarServicio(Servicio s)
	{
		try {
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("UPDATE `db_inmobiliaria`.`tb_servicios` SET `servicio`= ? , `estado`= ? WHERE `id`= ? ;");
			pstmt.setString(1, s.getServicio());
			pstmt.setBoolean(2, s.isEstado());
			pstmt.setInt(3, s.getId());
			
			pstmt.executeUpdate();
	    } 
		catch (Exception e) {
	        System.out.print("Error actualizando servicio: " + e);
	    }
	}
	
}
