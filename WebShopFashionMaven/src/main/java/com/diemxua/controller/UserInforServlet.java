/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.model.User;
import com.diemxua.model.UserProfile;
import com.diemxua.services.AddressService;
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
import java.util.List;

/**
 *
 * @author Duong
 */
public class UserInforServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService userService = new UserService();
        UserProfileService userProfileService = new UserProfileService();
        AddressService addressService = new AddressService();

        int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
        String firebaseID = String.valueOf(session.getAttribute("userUID"));
        User user = userService.getUserById(userID);
        UserProfile userProfile = userProfileService.getUserByFirebaseId(firebaseID);
        List<Address> addresses = addressService.getUserByFirebaseId(firebaseID);

        request.setAttribute("addresses", addresses);
        request.setAttribute("user", user);
        request.setAttribute("userProfile", userProfile);
        request.getRequestDispatcher("inforCustomer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserService userService = new UserService();
        UserProfileService userProfileService = new UserProfileService();
        AddressService addressService = new AddressService();

        int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
        String firebaseID = String.valueOf(session.getAttribute("userUID"));
        User user = userService.getUserById(userID);
        UserProfile userProfile = userProfileService.getUserByFirebaseId(firebaseID);
        List<Address> addresses = addressService.getUserByFirebaseId(firebaseID);

        request.setAttribute("addresses", addresses);
        request.setAttribute("user", user);
        request.setAttribute("userProfile", userProfile);
        request.getRequestDispatcher("inforCustomer.jsp").forward(request, response);
    }
}
