/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duong
 */
public class FirebaseLogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String uid = (String) session.getAttribute("userUID");
            if (uid != null) {
                try {
                    FirebaseAuth.getInstance().revokeRefreshTokens(uid);
                    System.out.println("Đã thu hồi token làm mới cho UID: " + uid);
                } catch (FirebaseAuthException e) {
                    System.err.println("Lỗi khi thu hồi token: " + e.getMessage());
                }
            }

            session.invalidate();
            System.out.println("Session Server đã được hủy.");
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }

}
