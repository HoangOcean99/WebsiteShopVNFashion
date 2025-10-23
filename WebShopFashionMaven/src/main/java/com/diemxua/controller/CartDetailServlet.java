/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.CartItems;
import com.diemxua.model.Product;
import com.diemxua.services.CartItemsService;
import com.diemxua.services.ProductService;
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
public class CartDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CartItemsService cartItemService = new CartItemsService();
        ProductService productService = new ProductService();
        HttpSession session = request.getSession();
        int userId = Integer.valueOf(String.valueOf(session.getAttribute("UserID")));
        List<CartItems> cartItems = (List<CartItems>) cartItemService.getByCartId(userId);
        List<Product> productsCart = new ArrayList<>();
        for (CartItems cartItem : cartItems) {
            Product p = productService.getProductByProductId(cartItem.getProductId());
            cartItem.setPriceCart(p.getPrice() * cartItem.getQuantityCart());
            productsCart.add(p);
        }
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("listProductCart", productsCart);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

}
