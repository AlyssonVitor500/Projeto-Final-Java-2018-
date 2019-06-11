package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conectar {
	
	public static Connection getConnection() throws SQLException {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/fairycars", "root", "121202");
			
		}catch (ClassNotFoundException e) {
			throw new SQLException(e.getException());
		}
	}
	
}
