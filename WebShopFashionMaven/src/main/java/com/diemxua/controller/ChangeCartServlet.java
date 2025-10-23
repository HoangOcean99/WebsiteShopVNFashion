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
public class ChangeCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int cartItemID = Integer.parseInt(request.getParameter("CartItemID"));
        int newQuantity = Integer.parseInt(request.getParameter("inputQuantity"));
        int UserID = (int) session.getAttribute("UserID");
        int ProductID = Integer.valueOf(request.getParameter("ProductID"));
        String newSize = request.getParameter("inputSize");

        CartItemsService cartItemsService = new CartItemsService();
        CartItems currentItem = (CartItems) cartItemsService.getByCartItemID(cartItemID);

        if (newQuantity != currentItem.getQuantityCart()) {
            currentItem.setQuantityCart(newQuantity);
            cartItemsService.editUser(currentItem);
        }

        if (!newSize.equals(currentItem.getSizeCart())) {
            CartItems lastItem = cartItemsService.getByCartIdAndProductID(UserID, ProductID, newSize);
            if (lastItem == null) {
                currentItem.setSizeCart(newSize);
                cartItemsService.editUser(currentItem);
            } else {
                lastItem.setQuantityCart(newQuantity + lastItem.getQuantityCart());
                cartItemsService.editUser(lastItem);
                cartItemsService.deleteUser(cartItemID);
            }
        }
        response.sendRedirect("CartDetailServlet");
    }

}
