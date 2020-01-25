package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection initializeDatabase(String base, String user, String password)
            throws SQLException, ClassNotFoundException
    {
        Connection conn = null;
      try {
          String dbDriver = "com.mysql.jdbc.Driver";
          String dbURL = "jdbc:mysql://localhost:3306/" + base + "?serverTimezone=UTC&allowPublicKeyRetrieval=true";
          Class.forName(dbDriver);
          conn = DriverManager.getConnection(dbURL, user, password);
      }
      catch(SQLException se) {
          System.out.println("Database connection:" + se.getMessage());
      }
        return conn;
    }
}
