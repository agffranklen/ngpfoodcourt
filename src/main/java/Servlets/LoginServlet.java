package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String uname = request.getParameter("email");
	        String pass = request.getParameter("password");
	        boolean isValidUser = false;

	        // Database connection details
	        String dbURL = "jdbc:mysql://localhost:3306/canteenfoodmanagement";
	        String dbUsername = "root";
	        String dbPassword = "";  // Use your database password

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            // Establishing connection to the database
	            Connection con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

	            // Query to check the user credentials
	            String sql = "SELECT * FROM register WHERE email = ? AND password = ?";
	            PreparedStatement pst = con.prepareStatement(sql);
	            pst.setString(1, uname);
	            pst.setString(2, pass);

	            // Executing the query
	            ResultSet rs = pst.executeQuery();

	            // Check if the result set has data (i.e., user exists and credentials are correct)
	            if (rs.next()) {
	                isValidUser = true;
	            }

	            // Closing resources
	            rs.close();
	            pst.close();
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        // Redirecting based on the validation result
	        if (isValidUser) {
	            
	            response.sendRedirect("Dashboard.jsp?username="+uname);
	        } else {
	            // If login fails, redirect to the Register page with an error message
	            request.setAttribute("errorMessage", "Invalid username or password!");
	            RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");  // Assuming Register.jsp is your registration page
	            rd.forward(request, response);
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
