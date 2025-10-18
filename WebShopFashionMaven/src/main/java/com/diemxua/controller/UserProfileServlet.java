/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.UserProfile;
import com.diemxua.services.UserProfileService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duong
 */
public class UserProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String firebaseID = (String) session.getAttribute("userUID");

        UserProfileService dao = new UserProfileService();
        UserProfile userProfile = dao.getUserById(firebaseID);
        if (userProfile != null) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("formUserDetail.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String firebaseID = (String) session.getAttribute("userUID");
            String firebaseImage = (String) session.getAttribute("userImage");
            UserProfileService dao = new UserProfileService();
            String fullName = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String dateOB = request.getParameter("dateOfBirth");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date mainDate = format.parse(dateOB);
            String gender = request.getParameter("gender");

            UserProfile UserProfile = new UserProfile(fullName, phone, mainDate, gender, firebaseImage, firebaseID);
            dao.insert(UserProfile);

            session.setAttribute("doneUserDetail", true);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UserProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
