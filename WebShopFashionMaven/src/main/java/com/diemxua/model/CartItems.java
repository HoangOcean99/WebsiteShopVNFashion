/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.diemxua.model;

import java.util.*;
import java.lang.*;
import java.io.*;

public class CartItems {
    private int cartItemId;
    private int productId;
    private int quanity;
    private float price;
    private int cartId;
    private int productDetailId;

    public CartItems() {
    }

    public CartItems(int cartItemId, int productId, int quanity, float price, int cartId, int productDetailId) {
        this.cartItemId = cartItemId;
        this.productId = productId;
        this.quanity = quanity;
        this.price = price;
        this.cartId = cartId;
        this.productDetailId = productDetailId;
    }

    public CartItems(int productId, int quanity, float price, int cartId, int productDetailId) {
        this.productId = productId;
        this.quanity = quanity;
        this.price = price;
        this.cartId = cartId;
        this.productDetailId = productDetailId;
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

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(int productDetailId) {
        this.productDetailId = productDetailId;
    }
    
    
}
