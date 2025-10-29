/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

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
                CartItems m = new CartItems(
                        rs.getInt("CartItemID"),
                        rs.getInt("ProductID"),
                        rs.getInt("UserID"),
                        rs.getLong("PriceCart"),
                        rs.getString("size"),
                        rs.getInt("quantityCart"),
                        rs.getBoolean("isSelect")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CartItems> getByCartId(int userId) {
        String sql = "SELECT * FROM CartItems WHERE UserID = ?";
        List<CartItems> list = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    CartItems m = new CartItems();
                    m.setCartItemId(rs.getInt("CartItemID"));
                    m.setProductId(rs.getInt("ProductID"));
                    m.setUserId(rs.getInt("UserID"));
                    m.setPriceCart(rs.getLong("PriceCart"));
                    m.setSizeCart(rs.getString("size"));
                    m.setQuantityCart(rs.getInt("quantityCart"));
                    m.setIsSelect(rs.getBoolean("isSelect"));
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public CartItems getByCartItemID(int cartItem) {
        String sql = "SELECT * FROM CartItems WHERE CartItemID = ?";
        CartItems m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, cartItem);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new CartItems();
                    m.setCartItemId(rs.getInt("CartItemID"));
                    m.setProductId(rs.getInt("ProductID"));
                    m.setUserId(rs.getInt("UserID"));
                    m.setPriceCart(rs.getLong("PriceCart"));
                    m.setSizeCart(rs.getString("size"));
                    m.setQuantityCart(rs.getInt("quantityCart"));
                    m.setIsSelect(rs.getBoolean("isSelect"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public CartItems getByCartIdAndProductID(int userId, int productId, String size) {
        String sql = "SELECT * FROM CartItems WHERE UserID = ? and ProductID = ? and size = ?";
        CartItems m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, productId);
            st.setString(3, size);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new CartItems();
                    m.setCartItemId(rs.getInt("CartItemID"));
                    m.setProductId(rs.getInt("ProductID"));
                    m.setUserId(rs.getInt("UserID"));
                    m.setPriceCart(rs.getLong("PriceCart"));
                    m.setSizeCart(rs.getString("size"));
                    m.setQuantityCart(rs.getInt("quantityCart"));
                    m.setIsSelect(rs.getBoolean("isSelect"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public void insert(CartItems user) {
        String sql = "INSERT INTO CartItems (ProductID, UserID, PriceCart, size, quantityCart, isSelect)"
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getProductId());
            ps.setInt(2, user.getUserId());
            ps.setLong(3, user.getPriceCart());
            ps.setString(4, user.getSizeCart());
            ps.setInt(5, user.getQuantityCart());
            ps.setBoolean(6, false);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int CartItemID) {
        String sql = "DELETE FROM CartItems WHERE CartItemID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, CartItemID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(CartItems user) {
        String sql = "UPDATE CartItems SET ProductID = ?, UserID = ?, PriceCart = ?, size = ?, quantityCart = ?, isSelect = ? WHERE CartItemID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getProductId());
            ps.setInt(2, user.getUserId());
            ps.setLong(3, user.getPriceCart());
            ps.setString(4, user.getSizeCart());
            ps.setInt(5, user.getQuantityCart());
            ps.setBoolean(6, user.isIsSelect());
            ps.setInt(7, user.getCartItemId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
