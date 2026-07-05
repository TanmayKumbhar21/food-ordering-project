package DB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        int orderId = Integer.parseInt(request.getParameter("order_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_db", "root", "password");

            String query = "DELETE FROM orders WHERE order_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, orderId);

            int rowsAffected = ps.executeUpdate();
            con.close();

            if (rowsAffected > 0) {
                out.print("Order Deleted Successfully!");
            } else {
                out.print("Failed to Delete Order.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("Error Occurred!");
        }
    }
}
