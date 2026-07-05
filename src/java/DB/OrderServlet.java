package DB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        StringBuilder jsonOutput = new StringBuilder();
        jsonOutput.append("[");

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddb", "root", "root");

            // Query execution
            String query = "SELECT order_id, user_email, full_name, address, city, payment_method, items, total_price, order_date FROM orders";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    jsonOutput.append(",");
                }
                jsonOutput.append("{");
                jsonOutput.append("\"order_id\":").append(rs.getInt("order_id")).append(",");
                jsonOutput.append("\"user_email\":\"").append(rs.getString("user_email")).append("\",");
                jsonOutput.append("\"full_name\":\"").append(rs.getString("full_name")).append("\",");
                jsonOutput.append("\"address\":\"").append(rs.getString("address")).append("\",");
                jsonOutput.append("\"city\":\"").append(rs.getString("city")).append("\",");
                jsonOutput.append("\"payment_method\":\"").append(rs.getString("payment_method")).append("\",");
                jsonOutput.append("\"items\":\"").append(rs.getString("items")).append("\",");
                jsonOutput.append("\"total_price\":").append(rs.getDouble("total_price")).append(",");
                jsonOutput.append("\"order_date\":\"").append(rs.getString("order_date")).append("\"");
                jsonOutput.append("}");
                first = false;
            }

            jsonOutput.append("]");

            // Closing resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            jsonOutput = new StringBuilder("[]"); // If error, return empty array
        }

        // Send JSON response
        out.print(jsonOutput.toString());
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("order_id"));

        try {
            // Database Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddb", "root", "root");

            // Delete Query Execution
            String query = "DELETE FROM orders WHERE order_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, orderId);
            int rowsDeleted = stmt.executeUpdate();

            // Closing resources
            stmt.close();
            conn.close();

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            if (rowsDeleted > 0) {
                out.print("Order deleted successfully.");
            } else {
                out.print("Failed to delete order.");
            }
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
