package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    public static Connection getConnection() throws Exception {
        // Ajusta la URL, usuario y contraseña según tu configuración
        String url = "jdbc:postgresql://localhost:5432/bodegas";
        String user = "postgres";
        String password = "postgres";
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
