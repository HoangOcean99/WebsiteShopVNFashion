/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Product;
import com.diemxua.model.ProductDetail;
import com.diemxua.model.ProductMaterial;
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
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Duong
 */
public class AdminProductDetailServlet extends HttpServlet {

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
        ProductMaterialsService materialService = new ProductMaterialsService();
        ProductDetailService detailService = new ProductDetailService();
        int productId = Integer.parseInt(request.getParameter("productID"));
        Product product = productService.getProductByProductId(productId);
        List<ProductDetail> productDetails = detailService.getProductMaterialsByProductId(productId);
        List<ProductMaterial> productMaterials = materialService.getProductMaterialsByProductId(productId);

        request.setAttribute("product", product);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("productMaterials", productMaterials);

        request.getRequestDispatcher("admin_productDetail.jsp").forward(request, response);
    }
}
