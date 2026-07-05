package DB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 1️⃣ User कडून Data घेणे
        String fullName = request.getParameter("full_name");
        
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String paymentMethod = request.getParameter("payment_method");
        String items = request.getParameter("items"); // हे JSON format मध्ये असू शकते
        String totalPrice = request.getParameter("total_price");

        // Database Connection Setup
        Connection conn = null;
        PreparedStatement pst = null;

        try {
            conn = DBconnection.getConnection(); // Database Connect करणे

            // 2️⃣ SQL Query तयार करणे
            String query = "INSERT INTO orders (user_email, full_name, address, city, payment_method, items, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, fullName);
            pst.setString(3, address);
            pst.setString(4, city);
            pst.setString(5, paymentMethod);
            pst.setString(6, items);
            pst.setString(7, totalPrice);

            // 3️⃣ Query Execute करणे
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                out.println("<h3>Order Placed Successfully!</h3>");
            } else {
                out.println("<h3>Order Failed. Please Try Again.</h3>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>Database Error! " + e.getMessage() + "</h3>");
        } finally {
            // 4️⃣ Resources बंद करणे
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
