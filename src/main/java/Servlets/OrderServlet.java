import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement checkStmt = null, updateStmt = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteenfoodmanagement", "root", "");

            // Start transaction
            conn.setAutoCommit(false);

            // Retrieve cart data from request
            String cartData = request.getParameter("cart");
            JSONArray cartArray = new JSONArray(cartData);

            // Prepare queries outside the loop
            String checkQuery = "SELECT quantity_available FROM available WHERE name = ?";
            String updateQuery = "UPDATE available SET quantity_available = quantity_available - ?, quantity_booked = quantity_booked + ? WHERE name = ?";

            checkStmt = conn.prepareStatement(checkQuery);
            updateStmt = conn.prepareStatement(updateQuery);

            for (int i = 0; i < cartArray.length(); i++) {
                JSONObject item = cartArray.getJSONObject(i);
                String itemName = item.getString("item");
                int quantity = item.getInt("quantity");

                // Check available stock before updating
                checkStmt.setString(1, itemName);
                rs = checkStmt.executeQuery();

                if (rs.next()) {
                    int availableStock = rs.getInt("quantity_available");

                    if (availableStock >= quantity) {
                        // Update available quantity and booked quantity
                        updateStmt.setInt(1, quantity);
                        updateStmt.setInt(2, quantity);
                        updateStmt.setString(3, itemName);
                        updateStmt.executeUpdate();
                    } else {
                        conn.rollback();  // Rollback transaction on failure
                        request.setAttribute("error", "Insufficient stock for " + itemName);
                        request.getRequestDispatcher("order.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // Commit transaction after successful updates
            conn.commit();

            // Forward success message
            request.setAttribute("message", "Order placed successfully!");
            request.getRequestDispatcher("order.jsp").forward(request, response);

        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();  // Rollback transaction on error
            } catch (SQLException ignored) {}
            
            request.setAttribute("error", "Error Processing Order: " + e.getMessage());
            request.getRequestDispatcher("order.jsp").forward(request, response);
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (checkStmt != null) checkStmt.close(); } catch (SQLException ignored) {}
            try { if (updateStmt != null) updateStmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}
