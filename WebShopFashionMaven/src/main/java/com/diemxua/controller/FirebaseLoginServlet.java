/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.User;
import com.diemxua.services.UserService;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Duong
 */
public class FirebaseLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idToken = request.getParameter("idToken");

        if (idToken == null || idToken.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ID Token");
            return;
        }

        try {
            FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdToken(idToken);

            String uid = decodedToken.getUid();
            String email = decodedToken.getEmail();
            String name = decodedToken.getName();

            userService = new UserService();
            User user = userService.getUserByFirebaseUId(uid);
            if (user == null) {
                user = new User(email, "client", uid);
                userService.insert(user);
            }

            request.getSession().setAttribute("userUID", uid);
            request.getSession().setAttribute("userEmail", email);
            request.getSession().setAttribute("userName", name);
            request.getSession().setAttribute("isAuthenticated", true);

            response.setStatus(HttpServletResponse.SC_OK);

        } catch (FirebaseAuthException e) {
            System.err.println("Xác minh Token Firebase thất bại: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid Firebase ID Token.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Server error during authentication.");
        }
    }
}
