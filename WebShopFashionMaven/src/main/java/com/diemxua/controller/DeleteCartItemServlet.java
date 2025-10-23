/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.CartItems;
import com.diemxua.services.CartItemsService;
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
public class DeleteCartItemServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cartItemID = Integer.parseInt(request.getParameter("CartItemID"));
        CartItemsService cartItemService = new CartItemsService();
        CartItems item = cartItemService.getByCartItemID(cartItemID);
        if (item != null) {
            cartItemService.deleteUser(cartItemID);
        }
        response.sendRedirect("CartDetailServlet");
    }
    
}
