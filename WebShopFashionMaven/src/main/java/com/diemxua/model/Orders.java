/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

import java.util.*;
import java.lang.*;
import java.text.NumberFormat;

public class Orders {

    private int orderId;
    private Date orderDate;
    private String status;
    private String shipMethod;
    private String paymentMethod;
    private long totalPrice;
    private int addressId;
    private int userId;
    private String formatPrice;
    private String dateSend;

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

    public Orders() {
    }

    public Orders(int orderId, String status, String shipMethod, String paymentMethod, long totalPrice, int addressId, int userId, String dateSend) {
        this.orderId = orderId;
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.formatPrice = this.format(this.totalPrice);
        this.dateSend = dateSend;
    }

    public Orders(String status, String shipMethod, String paymentMethod, long totalPrice, int addressId, int userId, String dateSend) {
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.formatPrice = this.format(this.totalPrice);
        this.dateSend = dateSend;
    }

    public Orders(int orderId, Date orderDate, String status, String shipMethod, String paymentMethod, long totalPrice, int addressId, int userId, String dateSend) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.formatPrice = this.format(this.totalPrice);
        this.dateSend = dateSend;
    }

    public Orders(Date orderDate, String status, String shipMethod, String paymentMethod, long totalPrice, int addressId, int userId, String dateSend) {
        this.orderDate = orderDate;
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.formatPrice = this.format(this.totalPrice);
        this.dateSend = dateSend;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShipMethod() {
        return shipMethod;
    }

    public void setShipMethod(String shipMethod) {
        this.shipMethod = shipMethod;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
        this.formatPrice = this.format(totalPrice);

    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getFormatPrice() {
        return formatPrice;
    }

    public String getDateSend() {
        return dateSend;
    }

    public void setDateSend(String dateSend) {
        this.dateSend = dateSend;
    }

}
