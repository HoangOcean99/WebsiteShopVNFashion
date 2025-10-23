/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

import java.util.*;
import java.lang.*;
import java.io.*;
import java.text.NumberFormat;

public class CartItems {

    private int cartItemId;
    private int productId;
    private int userId;
    private long priceCart;
    private String sizeCart;
    private int quantityCart;
    private String formatPriceCart;

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

    public CartItems() {
    }

    public CartItems(int cartItemId, int productId, int userId, long priceCart, String sizeCart, int quantityCart) {
        this.cartItemId = cartItemId;
        this.productId = productId;
        this.userId = userId;
        this.priceCart = priceCart;
        this.sizeCart = sizeCart;
        this.quantityCart = quantityCart;
        this.formatPriceCart = this.format(this.priceCart);
    }

    public CartItems(int productId, int userId, long priceCart, String sizeCart, int quantityCart) {
        this.productId = productId;
        this.userId = userId;
        this.priceCart = priceCart;
        this.sizeCart = sizeCart;
        this.quantityCart = quantityCart;
        this.formatPriceCart = this.format(this.priceCart);
    }

    public CartItems(int productId, int userId, String sizeCart, int quantityCart) {
        this.productId = productId;
        this.userId = userId;
        this.sizeCart = sizeCart;
        this.quantityCart = quantityCart;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getPriceCart() {
        return priceCart;
    }

    public void setPriceCart(long priceCart) {
        this.priceCart = priceCart;
        this.formatPriceCart = this.format(this.priceCart);
    }

    public String getSizeCart() {
        return sizeCart;
    }

    public void setSizeCart(String sizeCart) {
        this.sizeCart = sizeCart;
    }

    public int getQuantityCart() {
        return quantityCart;
    }

    public void setQuantityCart(int quantityCart) {
        this.quantityCart = quantityCart;
    }

    public String getFormatPriceCart() {
        return formatPriceCart;
    }
    

}
