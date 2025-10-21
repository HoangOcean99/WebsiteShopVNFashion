/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

/**
 *
 * @author Duong
 */
public class ProductDetail {
    private int productDetailID;
    private String size;
    private long stockQuantity;
    private int productID;

    public ProductDetail(int productDetailID, String size, long stockQuantity, int productID) {
        this.productDetailID = productDetailID;
        this.size = size;
        this.stockQuantity = stockQuantity;
        this.productID = productID;
    }

    public ProductDetail(String size, long stockQuantity, int productID) {
        this.size = size;
        this.stockQuantity = stockQuantity;
        this.productID = productID;
    }

    public ProductDetail() {
    }

    public int getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(int productDetailID) {
        this.productDetailID = productDetailID;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public long getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(long stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
    
}
