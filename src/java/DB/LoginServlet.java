package DB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Declare connection and other variables
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Get database connection
            conn = DBconnection.getConnection();  // Removed re-declaration error
            
            // SQL Query to Check User
            String query = "SELECT name FROM users WHERE email = ? AND password = ?";
            pst = conn.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            
            rs = pst.executeQuery();
            
            if (rs.next()) {
                // Session तयार करणे
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("name")); // Store user name

                // Menu page वर redirect करणे
                response.sendRedirect("menu.html");
            } else {
                out.println("<h3>Invalid Email or Password! <a href='login.jsp'>Try Again</a></h3>");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error Occurred! Please try again later.</h3>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
