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
public class ViewProfileServlet extends HttpServlet {
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
            response.sendRedirect("listProfiles");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
            
            // Query to get a single profile by ID
            String query = "SELECT * FROM profiles WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                ProfileBean profile = new ProfileBean();
                profile.setId(rs.getInt("id"));
                profile.setFullName(rs.getString("fullname"));
                profile.setStudentId(rs.getString("student_id"));
                profile.setProgram(rs.getString("program"));
                profile.setEmail(rs.getString("email"));
                profile.setHobbies(rs.getString("hobbies"));
                profile.setStrengths(rs.getString("strengths"));
                profile.setAmbition(rs.getString("ambition"));
                profile.setQuotes(rs.getString("quotes"));
                profile.setIntro(rs.getString("intro"));
                
                // Set the single profile as attribute
                request.setAttribute("profile", profile);
                
                // Forward to profile.jsp
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                // Profile not found, redirect to list
                response.sendRedirect("profiles");
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("profiles");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
