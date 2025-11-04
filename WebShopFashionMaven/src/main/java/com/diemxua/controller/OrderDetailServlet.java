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
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Duong
 */
public class OrderDetailServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        OrdersService orderService = new OrdersService();
        OrderDetailService orderDetailService = new OrderDetailService();
        ProductService productService = new ProductService();
        AddressService addressService = new AddressService();

        int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
        int orderID = Integer.parseInt(request.getParameter("OrderID"));

        Orders order = orderService.getOrderByOrderId(orderID);
        ArrayList<OrderDetails> listOrderDetails = (ArrayList<OrderDetails>) orderDetailService.getOrderByOrderID(orderID);
        ArrayList<Product> listProducts = new ArrayList<Product>();
        Address address = addressService.getAddressByAddressId(order.getAddressId());

        for (OrderDetails od : listOrderDetails) {
            int productId = od.getProductID();
            Product tempProduct = productService.getProductByProductId(productId);
            listProducts.add(tempProduct);
        }
        if (order != null) {
            double priceTotalDouble = order.getTotalPrice();

            final double VAT_RATE = 1.015; // 203 / 200 = 1.015
            final long SHIPPING_FAST = 25000;

            double priceTotalAfterShipping = priceTotalDouble;
            double shippingFee = 0;

            if (order.getShipMethod() != null && order.getShipMethod().equals("fast")) {
                shippingFee = SHIPPING_FAST;
                priceTotalAfterShipping -= shippingFee;
            }

            double priceOriginDouble = priceTotalAfterShipping / VAT_RATE;

            long taxDouble = Math.round(priceTotalAfterShipping - priceOriginDouble);

            request.setAttribute("priceOrigin", format((long) priceOriginDouble));
            request.setAttribute("shippingFee", format((long) shippingFee));
            request.setAttribute("tax", format(taxDouble));

            request.setAttribute("address", address);
            request.setAttribute("orderDetaill", order);
            request.setAttribute("listOrderDetails", listOrderDetails);
            request.setAttribute("listProducts", listProducts);
        }

        request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
    }

}
