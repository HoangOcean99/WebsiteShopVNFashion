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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Duong
 */
public class CartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int UserID = (int) session.getAttribute("UserID");
        int ProductID = Integer.valueOf(request.getParameter("ProductID"));
        int quantityCart = Integer.parseInt(request.getParameter("quantityCart"));
        String sizeCart = String.valueOf(request.getParameter("sizeCart"));
        
        CartItemsService cartItemService = new CartItemsService();
        CartItems cartItem = cartItemService.getByCartIdAndProductID(UserID, ProductID, sizeCart);
        if (cartItem == null) {
            cartItemService.insert(new CartItems(ProductID, UserID, sizeCart, quantityCart));
        } else {
            cartItem.setQuantityCart(cartItem.getQuantityCart() + quantityCart);
            cartItemService.editUser(cartItem);
        }
        response.sendRedirect("CartDetailServlet");
    }
    
}
