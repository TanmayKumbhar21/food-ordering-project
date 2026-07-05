package DB; // पॅकेजचे नाव

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
    private static final String URL = "jdbc:mysql://localhost:3306/fooddb"; // तुझी Database Name (fooddb)
    private static final String USER = "root";  
    private static final String PASSWORD = "root";  

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC Driver लोड करणे
            conn = DriverManager.getConnection(URL, USER, PASSWORD); // Database ला Connect करणे
            System.out.println("✅ Database Connected Successfully!");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver Not Found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Database Connection Failed!");
            e.printStackTrace();
        }
        return conn;
    }
}
