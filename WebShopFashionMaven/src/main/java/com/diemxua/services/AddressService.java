/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.Address;
import com.diemxua.model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duong
 */
public class AddressService extends DBContext {

    public List<Address> getAll() {
        List<Address> list = new ArrayList<>();
        String sql = "SELECT * FROM Address";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                Address m = new Address(
                        rs.getInt("AddressID"),
                        rs.getString("RecipientName"),
                        rs.getString("Phone"),
                        rs.getString("Country"),
                        rs.getString("City"),
                        rs.getString("AddressDetail"),
                        rs.getString("UserID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Address> getUserByFirebaseId(String userId) {
        String sql = "SELECT * FROM Address WHERE UserID = ?";
        List<Address> list = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Address m = new Address();
                    m.setAddressID(rs.getInt("AddressID"));
                    m.setRecipientName(rs.getString("RecipientName"));
                    m.setPhone(rs.getString("Phone"));
                    m.setCountry(rs.getString("Country"));
                    m.setCity(rs.getString("City"));
                    m.setAddressDetail(rs.getString("AddressDetail"));
                    m.setUserID(rs.getString("UserID"));
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Address getAddressByAddressId(int addressID) {
        String sql = "SELECT * FROM Address WHERE AddressID = ?";
        Address m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, addressID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    m = new Address();
                    m.setAddressID(rs.getInt("AddressID"));
                    m.setRecipientName(rs.getString("RecipientName"));
                    m.setPhone(rs.getString("Phone"));
                    m.setCountry(rs.getString("Country"));
                    m.setCity(rs.getString("City"));
                    m.setAddressDetail(rs.getString("AddressDetail"));
                    m.setUserID(rs.getString("UserID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public void insert(Address user) {
        // SỬA: Thêm 2 cột GroupID, SupplierID vào SQL INSERT
        String sql = "INSERT INTO Address (RecipientName, Phone, Country, City, AddressDetail, UserID) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getRecipientName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getCountry());
            ps.setString(4, user.getCity());
            ps.setString(5, user.getAddressDetail());
            ps.setString(6, user.getUserID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String medicineId) {
        String sql = "DELETE FROM Address WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, medicineId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(Address user) {
        String sql = "UPDATE Address SET RecipientName = ?, Phone = ?, Country = ?, City = ?, AddressDetail = ? WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getRecipientName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getCountry());
            ps.setString(4, user.getCity());
            ps.setString(5, user.getAddressDetail());
            ps.setString(7, user.getUserID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
