/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profile.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import profile.bean.ProfileBean;
import java.sql.*;

/**
 *
 * @author muqri
 */
public class ProfileServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProfileBean profile = new ProfileBean();
        
        profile.setFullName(request.getParameter("name"));
        profile.setStudentId(request.getParameter("studentId"));
        profile.setProgram(request.getParameter("program"));
        profile.setEmail(request.getParameter("email"));
        profile.setHobbies(request.getParameter("hobbies"));
        profile.setStrengths(request.getParameter("strengths"));
        profile.setAmbition(request.getParameter("ambition"));
        profile.setQuotes(request.getParameter("quotes"));
        profile.setIntro(request.getParameter("intro"));
        
        try {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/StudentProfiles", "app", "app");
            String query = "INSERT INTO profiles (fullname, student_id, program, email, hobbies, strengths, ambition, quotes, intro) VALUES "
                    + "(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, profile.getFullName());
            stmt.setString(2, profile.getStudentId());
            stmt.setString(3, profile.getProgram());
            stmt.setString(4, profile.getEmail());
            stmt.setString(5, profile.getHobbies());
            stmt.setString(6, profile.getStrengths());
            stmt.setString(7, profile.getAmbition());
            stmt.setString(8, profile.getQuotes());
            stmt.setString(9, profile.getIntro());
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Send data to JSP
        request.setAttribute("profile", profile);
//        request.setAttribute("name", name);
//        request.setAttribute("studentId", studentId);
//        request.setAttribute("program", program);
//        request.setAttribute("email", email);
//        request.setAttribute("hobbies", hobbies);
//        request.setAttribute("strengths", strengths);
//        request.setAttribute("ambition", ambition);
//        request.setAttribute("quote", quote);
//        request.setAttribute("intro", intro);

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

}
