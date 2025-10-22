/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.diemxua.services;

import com.diemxua.model.Address;
import com.diemxua.model.CartItems;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemsService extends DBContext {
    public List<CartItems> getAll() {
        List<CartItems> list = new ArrayList<>();
        String sql = "SELECT * FROM CartItems";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                CartItems m = new CartItems(
                        rs.getInt("CartItemID"),
                        rs.getInt("ProductID"),
                        rs.getInt("Quantity"),
                        rs.getFloat("Price"),
                        rs.getInt("CartID"),
                        rs.getInt("ProductDetailID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public CartItems getCartItemId(String userId) {
        String sql = "SELECT * FROM CartItems WHERE CartItemID = ?";
        CartItems m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new CartItems();
                    m.setCartItemId(rs.getInt("CartItemID"));
                    m.setProductId(rs.getInt("ProductID"));
                    m.setQuanity(rs.getInt("Quanity"));
                    m.setPrice(rs.getFloat("Price"));
                    m.setCartId(rs.getInt("CartID"));
                    m.setProductDetailId(rs.getInt("ProductDetailID"));                                                                                                           
                   
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public void insert(CartItems user) {
        // SỬA: Thêm 2 cột GroupID, SupplierID vào SQL INSERT
        String sql = "INSERT INTO CartItems (CartItemID, ProductID, Quanity, Price, CartID, ProductDetailID) "
                + "VALUES (?, ?, ?, ?, ?, ?)"; // SỬA: Đủ 6 dấu ?

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getCartItemId());
            ps.setInt(2, user.getProductId());
            ps.setInt(3, user.getQuanity());
            ps.setFloat(4, user.getPrice());
            ps.setInt(5, user.getCartId());
            ps.setInt(6, user.getProductDetailId());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String CartItemID) {
        String sql = "DELETE FROM CartItems WHERE CartItemID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, CartItemID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(CartItems user) {
        String sql = "UPDATE CartItems SET CartItemID = ?, ProductID = ?, Quantity = ?, Price = ?, CartID = ?, ProductDetailID = ? WHERE CartItemID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getCartItemId());
            ps.setInt(2, user.getProductId());
            ps.setInt(3, user.getQuanity());
            ps.setFloat(4, user.getPrice());
            ps.setInt(5, user.getCartId());
            ps.setInt(6, user.getProductDetailId());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
