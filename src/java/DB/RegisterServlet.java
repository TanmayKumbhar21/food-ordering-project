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

@WebServlet("/RegisterServlet")  // ✅ अयोग्य स्पेस काढली
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // 📝 Form मधून डेटा घेणे (register.jsp नुसार)
        String name = request.getParameter("name");
        String contact = request.getParameter("contact"); // ✅ register.jsp मध्ये "phone" आहे, "contact" नव्हे
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // ✅ Database कनेक्शन
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddb", "root", "root");

            // ✅ Insert Query तयार करणे
            String query = "INSERT INTO users(name, contact, email, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, contact);
            ps.setString(3, email);
            ps.setString(4, password); 

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<h3>Registration Successful!</h3>");
            } else {
                out.println("<h3>Registration Failed!</h3>");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
