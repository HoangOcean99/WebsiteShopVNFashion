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
public class ChangeBuyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int ProductID = -1;
        int cartItemID = -1;
        int UserID = (int) session.getAttribute("UserID");
        if (request.getParameter("ProductID") != null) {
            ProductID = Integer.valueOf(request.getParameter("ProductID"));
        }
        if (request.getParameter("CartItemID") != null) {
            cartItemID = Integer.parseInt(request.getParameter("CartItemID"));
        }
        CartItemsService cartItemsService = new CartItemsService();
        CartItems currentItem = (CartItems) cartItemsService.getByCartItemID(cartItemID);
        boolean newIsSelect = currentItem.isIsSelect();
        int newQuantity = currentItem.getQuantityCart();
        String newSize = currentItem.getSizeCart();
        
        newIsSelect = (request.getParameter("selectProduct") != null);
        
        if (request.getParameter("inputQuantity") != null) {
            newQuantity = Integer.parseInt(request.getParameter("inputQuantity"));
        }
        if (request.getParameter("inputSize") != null) {
            newSize = request.getParameter("inputSize");
        }
        boolean changed = false;

        if (newQuantity != currentItem.getQuantityCart()) {
            currentItem.setQuantityCart(newQuantity);
            changed = true;
        }
        if (newIsSelect != currentItem.isIsSelect()) {
            currentItem.setIsSelect(newIsSelect);
            changed = true;
        }

        if (!newSize.equals(currentItem.getSizeCart())) {
            CartItems lastItem = cartItemsService.getByCartIdAndProductID(UserID, ProductID, newSize);
            if (lastItem == null) {
                currentItem.setSizeCart(newSize);
                changed = true;
            } else {
                lastItem.setQuantityCart(newQuantity + lastItem.getQuantityCart());
                cartItemsService.editUser(lastItem);
                cartItemsService.deleteUser(cartItemID);
                changed = false;
            }
        }

        if (changed) {
            cartItemsService.editUser(currentItem);
        }
        response.sendRedirect("CartDetailServlet");
    }

}
