/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profile.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import profile.bean.ProfileBean;
/**
 *
 * @author muqri
 */
public class DeleteProfileServlet extends HttpServlet {
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the ID parameter from the request
        String idParam = request.getParameter("id");
        
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect("profiles");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
            
            // Query to get a single profile by ID
            String query = "DELETE FROM profiles WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
            response.sendRedirect("profiles");
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("profiles");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
