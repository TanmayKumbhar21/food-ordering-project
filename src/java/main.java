import DB.DBconnection;  // DBConnection क्लास Import करणे
import java.sql.Connection;

public class main {
    public static void main(String[] args) {
        // Database Connection टेस्ट करण्यासाठी getConnection() कॉल करतोय
        Connection conn = DBconnection.getConnection();
        
        // जर Connection Successfully झाली असेल तर Success Message दाखवेल
        if (conn != null) {
            System.out.println("✅ Database Connected Successfully!");
        } else {
            System.out.println("❌ Database Connection Failed!");
        }
    }
}
