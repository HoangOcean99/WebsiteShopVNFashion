/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.services.ProductDetailService;
import com.diemxua.services.ProductMaterialsService;
import com.diemxua.services.ProductService;
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
public class AdminDeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService();
            ProductMaterialsService productMaterialService = new ProductMaterialsService();
            ProductDetailService productDetailService = new ProductDetailService();

            int productID = Integer.parseInt(request.getParameter("productID"));

            productDetailService.deleteProductID(productID);
            productMaterialService.deleteProductID(productID);
            productService.deleteProduct(productID);

            response.sendRedirect("AdminProductServlet");
        } catch (Exception e) {
        }

    }
}
