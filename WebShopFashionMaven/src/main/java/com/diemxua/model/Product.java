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
public class Product {

    private int productID;
    private String productName;
    private String description;
    private String gender;
    private int categoryID;
    private String createAt;
    private long price;
    private String formatPrice;
    private String trait;
    private String items;
    private String imageProduct1;
    private String imageProduct2;
    private String imageProduct3;

    private String format(long price) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getNumberInstance(localeVN);

        currencyFormatter.setMaximumFractionDigits(0);
        currencyFormatter.setMinimumFractionDigits(0);

        return currencyFormatter.format(price);
    }

    public Product(int productID, String productName, String description, String gender, int categoryID, String createAt, long price, String trait, String items, String imageProduct1, String imageProduct2, String imageProduct3) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.gender = gender;
        this.categoryID = categoryID;
        this.createAt = createAt;
        this.price = price;
        this.formatPrice = this.format(this.price);
        this.trait = trait;
        this.items = items;
        this.imageProduct1 = imageProduct1;
        this.imageProduct2 = imageProduct2;
        this.imageProduct3 = imageProduct3;
    }

    public Product(String productName, String description, String gender, int categoryID, long price, String trait, String items, String imageProduct1, String imageProduct2, String imageProduct3) {
        this.productName = productName;
        this.description = description;
        this.gender = gender;
        this.categoryID = categoryID;
        this.price = price;
        this.formatPrice = this.format(this.price);
        this.trait = trait;
        this.items = items;
        this.imageProduct1 = imageProduct1;
        this.imageProduct2 = imageProduct2;
        this.imageProduct3 = imageProduct3;
    }

    public Product() {
    }

    public String getFormatPrice() {
        return formatPrice;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
        this.formatPrice = this.format(price);
    }

    public String getTrait() {
        return trait;
    }

    public void setTrait(String trait) {
        this.trait = trait;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public String getImageProduct1() {
        return imageProduct1;
    }

    public void setImageProduct1(String imageProduct1) {
        this.imageProduct1 = imageProduct1;
    }

    public String getImageProduct2() {
        return imageProduct2;
    }

    public void setImageProduct2(String imageProduct2) {
        this.imageProduct2 = imageProduct2;
    }

    public String getImageProduct3() {
        return imageProduct3;
    }

    public void setImageProduct3(String imageProduct3) {
        this.imageProduct3 = imageProduct3;
    }

}
