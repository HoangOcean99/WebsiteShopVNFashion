/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.services.analysisService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Map;

/**
 *
 * @author Duong
 */
public class AnalysisServlet extends HttpServlet {

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
        boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin");
        if (!role) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
            return;
        }
        analysisService analysisService = new analysisService();
        long finalPrice = analysisService.getTotalRevenue();
        double tiLeTB = (double) ((double) analysisService.getTotalOrders() / analysisService.getTotalUsers()) * 100;
        Map<Integer, Integer> containCategory = analysisService.getQuantitySoldByCategory();
        Map<Integer, Long> containTotalPrice = analysisService.getRevenueByCategory();

        String resultMax = "Giao Lĩnh";
        int resultKey = -1;
        int max = Integer.MIN_VALUE;
        for (Map.Entry<Integer, Integer> entry : containCategory.entrySet()) {
            int key = entry.getKey();
            int val = entry.getValue();
            if (val > max) {
                max = val;
                resultKey = key;
            }
            request.setAttribute("p" + key, val);
        }
        if (resultKey == 1) {
            resultMax = "Giao Lĩnh";
        } else if (resultKey == 2) {
            resultMax = "Viên Lĩnh";
        } else if (resultKey == 4) {
            resultMax = "Áo Tấc";
        }

        for (Map.Entry<Integer, Long> entry : containTotalPrice.entrySet()) {
            int key = entry.getKey();
            long val = entry.getValue();
            request.setAttribute("price" + key, format(val));
            request.setAttribute("income" + key, format(val / 2));
            double percent = ((double) val / finalPrice) * 100;
            percent = Math.round(percent * 100.0) / 100.0;
            request.setAttribute("TL" + key, percent);
        }
        request.setAttribute("MaxQuantity", resultMax);
        request.setAttribute("finalPrice", format(finalPrice));
        request.setAttribute("avarage", Math.round(tiLeTB * 100.0) / 100.0);
        request.getRequestDispatcher("admin_analysis.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
