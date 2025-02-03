package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

//@WebServlet("/DashboardServlet")
class FoodItem {
    private String itemname;
    private String quantity;
    private int rate;

    public FoodItem(String itemname, String quantity, int rate) {
        this.itemname = itemname;
        this.quantity = quantity;
        this.rate = rate;
    }

    public String getItemname() {
        return itemname;
    }

    public String getQuantity() {
        return quantity;
    }

    public double getRate() {
        return rate;
    }
}
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DashboardServlet() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<FoodItem> foodItems = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/canteenfoodmanagement", "root", "");

            String query = "SELECT itemname, quantity, rate FROM available";
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                String itemname = rs.getString("itemname");
                String quantity = rs.getString("quantity");
                int rate = rs.getInt("rate");

                foodItems.add(new FoodItem(itemname, quantity, rate));
            }

            request.setAttribute("foodItems", foodItems);
            System.out.println(foodItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
