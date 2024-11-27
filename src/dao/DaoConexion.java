package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoConexion {
	private String host = "jdbc:mysql://localhost:3306/";
    private String user = "root";
    private String pass = "root";
    private String dbName = "bd_inmobiliaria";
    private Connection connection = null;

    public DaoConexion() {
        try {
        	Class.forName("com.mysql.jdbc.Driver");  

            connection = DriverManager.getConnection(host + dbName, user, pass);

        } catch (SQLException e) {
            System.err.println("Error SQL: " + e.getMessage());
            e.printStackTrace();  
        } catch (ClassNotFoundException e) {
            System.err.println("Error: El driver JDBC no fue encontrado.");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error inesperado al conectar con la base de datos.");
            e.printStackTrace();
        }


    }

    public Connection getConnection() {
        if (connection != null) {
            System.out.println("Conexi�n activa.");
        } else {
            System.err.println("La conexi�n no est� activa.");
        }
        return connection;
    }

//    @Override
//    public void close() {
//        try {
//            if (connection != null && !connection.isClosed()) {
//                connection.close();               
//            }
//        } catch (Exception e) {
//            System.err.println("Error al cerrar la conexi�n a la base de datos.");
//            e.printStackTrace();
//        }
//    }
}
