/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

/**
 *
 * @author Duong
 */
public class Address {

    private int addressID;
    private String recipientName;
    private String phone;
    private String country;
    private String city;
    private String addressDetail;
    private boolean isDefault;
    private String userID;

    public Address(String recipientName, String phone, String country, String city, String addressDetail, boolean isDefault, String userID) {
        this.recipientName = recipientName;
        this.phone = phone;
        this.country = country;
        this.city = city;
        this.addressDetail = addressDetail;
        this.isDefault = isDefault;
        this.userID = userID;
    }

    public Address(int addressID, String recipientName, String phone, String country, String city, String addressDetail, boolean isDefault, String userID) {
        this.addressID = addressID;
        this.recipientName = recipientName;
        this.phone = phone;
        this.country = country;
        this.city = city;
        this.addressDetail = addressDetail;
        this.isDefault = isDefault;
        this.userID = userID;
    }

    public Address() {
    }

    public int getAddressID() {
        return addressID;
    }

    public void setAddressID(int addressID) {
        this.addressID = addressID;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

}
