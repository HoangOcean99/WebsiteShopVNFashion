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

/**
 *
 * @author Duong
 */
public class AdminUpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrdersService orderService = new OrdersService();
        int orderId = Integer.parseInt(request.getParameter("orderID"));

        Orders order = orderService.getOrderByOrderId(orderId);
        String status = request.getParameter("status");

        order.setStatus(status);

        orderService.editOrder(order);

        response.sendRedirect("AdminOrderDetailServlet?orderID=" + orderId);
    }

}
