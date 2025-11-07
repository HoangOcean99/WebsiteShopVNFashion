/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.model.UserProfile;
import com.diemxua.services.AddressService;
import com.diemxua.services.UserProfileService;
import com.diemxua.services.UserService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duong
 */
public class UpdateInforCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();
            UserProfileService userProfileService = new UserProfileService();
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String gender = request.getParameter("gender");
            String uid = (String) session.getAttribute("userUID");

            UserProfile userprofile = userProfileService.getUserByFirebaseId(uid);
            userprofile.setFullName(fullname);
            userprofile.setPhone(phone);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            userprofile.setDateOfBirth(format.parse(dateOfBirth));
            userprofile.setGender(gender);

            userProfileService.editUser(userprofile);

            response.sendRedirect("UserInforServlet");
        } catch (ParseException ex) {
            Logger.getLogger(UpdateInforCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        String recipientName = request.getParameter("recipientName");
        String shippingPhone = request.getParameter("shippingPhone");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String addressDetail = request.getParameter("addressDetail");

        AddressService addressService = new AddressService();
        Address address = addressService.getAddressByAddressId(addressId);
        address.setRecipientName(recipientName);
        address.setPhone(shippingPhone);
        address.setAddressDetail(addressDetail);
        address.setCity(city);
        address.setCountry(country);
        addressService.editUser(address);

        response.sendRedirect("UserInforServlet");
    }

}
