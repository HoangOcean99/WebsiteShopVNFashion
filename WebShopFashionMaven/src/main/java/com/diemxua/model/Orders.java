/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.diemxua.model;

import java.util.*;
import java.lang.*;
import java.io.*;

public class Orders {
    private int orderId;
    private Date orderDate;
    private String status;
    private String shipMethod;
    private String paymentMethod;
    private String Note;
    private float totalPrice;
    private int addressId;
    private int userId;
    private Date createAt;

    public Orders() {
    }

    public Orders(int orderId, Date orderDate, String status, String shipMethod, String paymentMethod, String Note, float totalPrice, int addressId, int userId, Date createAt) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.Note = Note;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.createAt = createAt;
    }

    public Orders(Date orderDate, String status, String shipMethod, String paymentMethod, String Note, float totalPrice, int addressId, int userId, Date createAt) {
        this.orderDate = orderDate;
        this.status = status;
        this.shipMethod = shipMethod;
        this.paymentMethod = paymentMethod;
        this.Note = Note;
        this.totalPrice = totalPrice;
        this.addressId = addressId;
        this.userId = userId;
        this.createAt = createAt;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
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

    public String getNote() {
        return Note;
    }

    public void setNote(String Note) {
        this.Note = Note;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
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

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

   
    
}
