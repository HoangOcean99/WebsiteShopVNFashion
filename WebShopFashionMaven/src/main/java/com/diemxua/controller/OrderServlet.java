/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.OrderDetails;
import com.diemxua.model.Orders;
import com.diemxua.model.Product;
import com.diemxua.services.OrdersService;
import com.diemxua.services.OrderDetailService;
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
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        OrdersService orderService = new OrdersService();
        OrderDetailService orderDetailService = new OrderDetailService();
        ProductService productService = new ProductService();

        int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
        List<Orders> listOrders = orderService.getOrderByUserID(userID);
        ArrayList<ArrayList<OrderDetails>> listOrderDetails = new ArrayList<ArrayList<OrderDetails>>();
        ArrayList<ArrayList<Product>> listProducts = new ArrayList<ArrayList<Product>>();

        for (Orders o : listOrders) {
            int orderID = o.getOrderId();
            ArrayList<OrderDetails> listTemp = (ArrayList<OrderDetails>) orderDetailService.getOrderByOrderID(orderID);
            ArrayList<Product> listTempProduct = new ArrayList<>();
            for (OrderDetails od : listTemp) {
                int productId = od.getProductID();
                Product tempProduct = productService.getProductByProductId(productId);
                listTempProduct.add(tempProduct);
            }
            listProducts.add(listTempProduct);
            listOrderDetails.add(listTemp);
        }

        request.setAttribute("listOrders", listOrders);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("listOrderDetails", listOrderDetails);

        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
