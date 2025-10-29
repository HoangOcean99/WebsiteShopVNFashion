/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.diemxua.controller;

import com.diemxua.model.Address;
import com.diemxua.model.CartItems;
import com.diemxua.model.Product;
import com.diemxua.services.AddressService;
import com.diemxua.services.CartItemsService;
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
public class BuyDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CartItemsService cartItemService = new CartItemsService();
        ProductService productService = new ProductService();
        AddressService addressService = new AddressService();
        HttpSession session = request.getSession();
        int userId = Integer.valueOf(String.valueOf(session.getAttribute("UserID")));
        List<CartItems> cartItems = (List<CartItems>) cartItemService.getByCartId(userId);
        List<Product> productsCart = new ArrayList<>();
        long mainPrice = 0;
        for (CartItems cartItem : cartItems) {
            Product p = productService.getProductByProductId(cartItem.getProductId());
            long priceMini = p.getPrice() * cartItem.getQuantityCart();
            cartItem.setPriceCart(priceMini);
            if (cartItem.isIsSelect()) {
                mainPrice += priceMini;
            }
            productsCart.add(p);
        }
        List<Address> listAddress = addressService.getUserByFirebaseId(String.valueOf(session.getAttribute("userUID")));
        request.setAttribute("listAddress", listAddress);

        request.setAttribute("mainPrice", mainPrice);
        request.setAttribute("priceString", format(mainPrice));

        request.setAttribute("tax", mainPrice * 3 / 200);
        request.setAttribute("taxString", format(mainPrice * 3 / 200));

        request.setAttribute("totalPrice", mainPrice + mainPrice * 3 / 200);

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("listProductCart", productsCart);
        request.getRequestDispatcher("buy.jsp").forward(request, response);
    }

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

}
