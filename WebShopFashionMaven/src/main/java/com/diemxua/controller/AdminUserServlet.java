/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.User;
import com.diemxua.model.UserProfile;
import com.diemxua.services.UserProfileService;
import com.diemxua.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duong
 */
public class AdminUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        UserService userService = new UserService();
        UserProfileService userProfileService = new UserProfileService();
        List<User> listUsers = userService.getAll();
        List<UserProfile> userProfile = new ArrayList<>();
        for (User u : listUsers) {
            userProfile.add(userProfileService.getUserByFirebaseId(u.getFirebaseUID()));
        }

        request.setAttribute("listUsers", listUsers);
        request.setAttribute("userProfile", userProfile);
        request.getRequestDispatcher("admin_userInfor.jsp").forward(request, response);
    }
}
