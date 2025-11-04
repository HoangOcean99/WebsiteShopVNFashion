/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

import java.util.Date;

/**
 *
 * @author Duong
 */
public class ProductSalesSummary {

    private int productSaleSummaryID;
    private int productID;
    private Date dateSold;
    private int quantitySold;
    private long priceSold;

    public ProductSalesSummary(int productSaleSummaryID, int productID, Date dateSold, int quantitySold, long priceSold) {
        this.productSaleSummaryID = productSaleSummaryID;
        this.productID = productID;
        this.dateSold = dateSold;
        this.quantitySold = quantitySold;
        this.priceSold = priceSold;
    }

    public ProductSalesSummary(int productID, Date dateSold, int quantitySold, long priceSold) {
        this.productID = productID;
        this.dateSold = dateSold;
        this.quantitySold = quantitySold;
        this.priceSold = priceSold;
    }

    public ProductSalesSummary(int productSaleSummaryID, int productID, int quantitySold, long priceSold) {
        this.productSaleSummaryID = productSaleSummaryID;
        this.productID = productID;
        this.quantitySold = quantitySold;
        this.priceSold = priceSold;
    }

    public ProductSalesSummary(int productID, int quantitySold, long priceSold) {
        this.productID = productID;
        this.quantitySold = quantitySold;
        this.priceSold = priceSold;
    }

    public ProductSalesSummary() {
    }

    public int getProductSaleSummaryID() {
        return productSaleSummaryID;
    }

    public void setProductSaleSummaryID(int productSaleSummaryID) {
        this.productSaleSummaryID = productSaleSummaryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Date getDateSold() {
        return dateSold;
    }

    public void setDateSold(Date dateSold) {
        this.dateSold = dateSold;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public long getPriceSold() {
        return priceSold;
    }

    public void setPriceSold(long priceSold) {
        this.priceSold = priceSold;
    }

}
