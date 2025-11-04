/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.model.OrderDetails;
import com.diemxua.model.Orders;
import com.diemxua.model.Product;
import com.diemxua.services.AddressService;
import com.diemxua.services.OrderDetailService;
import com.diemxua.services.OrdersService;
import com.diemxua.services.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Duong
 */
public class AdminOrderDetailServlet extends HttpServlet {
    
    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);
        
        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);
        
        return currencyFormatter.format(price);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderID"));
        OrdersService orderService = new OrdersService();
        AddressService addressService = new AddressService();
        ProductService productService = new ProductService();
        OrderDetailService orderDetailService = new OrderDetailService();
        
        Orders order = orderService.getOrderByOrderId(orderId);
        Address address = addressService.getAddressByAddressId(order.getAddressId());
        List<OrderDetails> orderDetails = orderDetailService.getOrderByOrderID(orderId);
        List<Product> products = new ArrayList<>();
        for (OrderDetails orderDetail : orderDetails) {
            Product pr = productService.getProductByProductId(orderDetail.getProductID());
            products.add(pr);
        }
        
        request.setAttribute("totalPrice", format(order.getTotalPrice()));
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("products", products);
        request.setAttribute("address", address);
        request.setAttribute("order", order);
        request.getRequestDispatcher("admin_orderDetail.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
}
