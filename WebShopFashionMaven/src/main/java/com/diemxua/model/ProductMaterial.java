/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

/**
 *
 * @author Duong
 */
public class ProductMaterial {
    private int materialID;
    private String materialName;
    private int productID;

    public ProductMaterial(int materialID, String materialName, int productID) {
        this.materialID = materialID;
        this.materialName = materialName;
        this.productID = productID;
    }

    public ProductMaterial(String materialName, int productID) {
        this.materialName = materialName;
        this.productID = productID;
    }

    public ProductMaterial() {
    }

    public int getMaterialID() {
        return materialID;
    }

    public void setMaterialID(int materialID) {
        this.materialID = materialID;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
    
}
