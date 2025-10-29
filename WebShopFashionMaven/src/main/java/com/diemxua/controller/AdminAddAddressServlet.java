/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.services.AddressService;
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
public class AdminAddAddressServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recipientName = request.getParameter("newRecipientName");
        String newPhone = request.getParameter("newPhone");
        String newCountry = request.getParameter("newCountry");
        String newCity = request.getParameter("newCity");
        String newDetailAddress = request.getParameter("newDetailAddress");
        
        AddressService addressService = new AddressService();
        HttpSession session = request.getSession();
        addressService.insert(new Address(recipientName, newPhone, newCountry, newCity, newDetailAddress, (String) session.getAttribute("userUID")));
        response.sendRedirect("CartDetailServlet");
    }
    
}
