package DB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
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
            String query = "SELECT * FROM users";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    jsonOutput.append(",");
                }
                jsonOutput.append("{");
                jsonOutput.append("\"id\":").append(rs.getInt("id")).append(",");
                jsonOutput.append("\"name\":\"").append(rs.getString("name")).append("\",");
                jsonOutput.append("\"email\":\"").append(rs.getString("email")).append("\",");
                jsonOutput.append("\"contact\":\"").append(rs.getString("contact")).append("\"");
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
}
