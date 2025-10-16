/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.model;

/**
 *
 * @author Duong
 */
public class User {

    private int userID;
    private String email;
    private String role;
    private String firebaseUID;

    public User(int userID, String email, String role, String firebaseUID) {
        this.userID = userID;
        this.email = email;
        this.role = role;
        this.firebaseUID = firebaseUID;
    }

    public User() {
    }

    public User(String email, String role, String firebaseUID) {
        this.email = email;
        this.role = role;
        this.firebaseUID = firebaseUID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirebaseUID() {
        return firebaseUID;
    }

    public void setFirebaseUID(String firebaseUID) {
        this.firebaseUID = firebaseUID;
    }

    
}
