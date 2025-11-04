/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Orders;
import com.diemxua.services.OrdersService;
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
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));

        OrdersService orderService = new OrdersService();
        List<Orders> orders = orderService.getAll();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("admin_order.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
