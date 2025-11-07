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
        HttpSession session = request.getSession();
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        String recipientName = request.getParameter("newRecipientName");
        String newPhone = request.getParameter("newPhone");
        String newCountry = request.getParameter("newCountry");
        String newCity = request.getParameter("newCity");
        String newDetailAddress = request.getParameter("newDetailAddress");

        AddressService addressService = new AddressService();
        addressService.insert(new Address(recipientName, newPhone, newCountry, newCity, newDetailAddress, (String) session.getAttribute("userUID")));
        response.sendRedirect("CartDetailServlet");
    }

}
