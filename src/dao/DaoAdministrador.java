package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entidades.Administrador;

public class DaoAdministrador {
	public boolean IntentoInicioSesion(Administrador a)
	{
		try{
			DaoConexion dc = new DaoConexion();
			Connection cn = dc.getConnection();
			PreparedStatement pstmt = cn.prepareStatement("SELECT COUNT(*) FROM db_inmobiliaria.tb_administrador WHERE usuario = ? AND contrasenia = ?");
			pstmt.setString(1, a.getUsuario());
			pstmt.setString(2, a.getContrasenia());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
			return true;
	        }   
		}
		catch (Exception e) {
			System.out.print("Error verificando usuario" + e);
			return false;
		}
    return false;
	}
}
