package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CartServlet
 */

public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from order.jsp
        String itemName = request.getParameter("itemname");
       
        double price = Double.parseDouble(request.getParameter("price"));
        
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/canteen_db";
        String user = "root";
        String password = "";
        
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection
            Connection conn = DriverManager.getConnection(url, user, password);
            
            // SQL query to insert data into cart table
            String sql = "INSERT INTO cart (itemname, price) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, itemName);
            stmt.setInt(2, quantity);
            stmt.setDouble(3, price);
            
            // Execute query
            int rowsInserted = stmt.executeUpdate();
            
            // Close resources
            stmt.close();
            conn.close();
            
            if (rowsInserted > 0) {
                response.sendRedirect("orderSuccess.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("orderFailure.jsp"); // Redirect to failure page
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}


