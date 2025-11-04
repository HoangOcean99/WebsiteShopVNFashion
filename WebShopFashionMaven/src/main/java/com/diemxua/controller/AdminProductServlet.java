/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Product;
import com.diemxua.model.ProductDetail;
import com.diemxua.services.ProductDetailService;
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
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        ProductService productService = new ProductService();
        ProductDetailService productDetailService = new ProductDetailService();
        List<Product> products = productService.getAll();
        List<Integer> quantityStock = new ArrayList<>();
        for (Product p : products) {
            List<ProductDetail> details = productDetailService.getProductMaterialsByProductId(p.getProductID());
            int sum = 0;
            for (ProductDetail d : details) {
                sum += d.getStockQuantity();
            }

            quantityStock.add(sum);
        }
        request.setAttribute("products", products);
        request.setAttribute("quantityStocks", quantityStock);
        request.getRequestDispatcher("admin_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
