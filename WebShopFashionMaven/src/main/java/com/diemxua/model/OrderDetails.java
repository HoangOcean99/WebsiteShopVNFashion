/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Duong
 */
public class OrderDetails {

    private int orderDetailID;
    private int productID;
    private int quantity;
    private long price;
    private int orderID;
    private String size;
    private String formatPrice;

    public OrderDetails() {
    }

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

    public OrderDetails(int productID, int quantity, long price, int orderID, String size) {
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
        this.size = size;
        this.formatPrice = this.format(this.price);

    }

    public OrderDetails(int orderDetailID, int productID, int quantity, long price, int orderID, String size) {
        this.orderDetailID = orderDetailID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
        this.size = size;
        this.formatPrice = this.format(this.price);

    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
        this.formatPrice = this.format(price);
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getFormatPrice() {
        return formatPrice;
    }
}
