package web.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection myConnection() {
		Connection con=null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","System","4730");
			System.out.println("Connection to DATABASE"+con);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return con;
		
	}
	
}
