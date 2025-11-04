/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.model.CartItems;
import com.diemxua.model.Product;
import com.diemxua.services.AddressService;
import com.diemxua.services.CartItemsService;
import com.diemxua.services.ProductService;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Duong
 */
public class BuyDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
//        int UserID = Integer.parseInt(session.getAttribute("UserID"));
        int ProductID = Integer.valueOf(request.getParameter("ProductID"));
        int quantityCart = Integer.parseInt(request.getParameter("quantityCart"));
        String sizeCart = String.valueOf(request.getParameter("sizeCart"));

        ProductService productService = new ProductService();
        AddressService addressService = new AddressService();
        int userId = Integer.valueOf(String.valueOf(session.getAttribute("UserID")));
        List<Address> listAddress = addressService.getUserByFirebaseId(String.valueOf(session.getAttribute("userUID")));

        request.setAttribute("listAddress", listAddress);
        Product productBuy = productService.getProductByProductId(ProductID);
        long mainPrice = productBuy.getPrice() * quantityCart;
        String priceString = format(mainPrice);

        request.setAttribute("mainPrice", mainPrice);
        request.setAttribute("priceString", priceString);
        request.setAttribute("tax", mainPrice * 3 / 200);
        request.setAttribute("taxString", format(mainPrice * 3 / 200));
        request.setAttribute("productBuy", productBuy);
        request.setAttribute("quantityBuy", quantityCart);
        request.setAttribute("sizeBuy", sizeCart);
        request.setAttribute("totalPrice", mainPrice + mainPrice * 3 / 200);

        request.getRequestDispatcher("buy.jsp").forward(request, response);
    }

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

}
