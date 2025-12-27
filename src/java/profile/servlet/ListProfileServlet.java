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
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author muqri
 */
public class ListProfileServlet extends HttpServlet {
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
        List<ProfileBean> profiles = new ArrayList<>();
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
            
            String query = "SELECT * FROM profiles ORDER BY fullname";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
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
                
                profiles.add(profile);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Set the list of profiles as an attribute
        request.setAttribute("profiles", profiles);
        
        // Forward to viewProfiles.jsp
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }
}
