/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assignment.profile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

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

        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String strengths = request.getParameter("strengths");
        String ambition = request.getParameter("ambition");
        String quote = request.getParameter("quote");
        String intro = request.getParameter("intro");

        // Send data to JSP
        request.setAttribute("name", name);
        request.setAttribute("studentId", studentId);
        request.setAttribute("program", program);
        request.setAttribute("email", email);
        request.setAttribute("hobbies", hobbies);
        request.setAttribute("strengths", strengths);
        request.setAttribute("ambition", ambition);
        request.setAttribute("quote", quote);
        request.setAttribute("intro", intro);

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

}
