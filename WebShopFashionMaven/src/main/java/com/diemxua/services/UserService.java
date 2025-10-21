/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

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
public class UserService extends DBContext {

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT UserID, Email, Role, FirebaseUID FROM Users";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                User m = new User(
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Role"),
                        rs.getString("FirebaseUID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        User m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new User();
                    m.setEmail(rs.getString("Email"));
                    m.setRole(rs.getString("Role"));
                    m.setFirebaseUID(rs.getString("FirebaseUID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public User getUserByFirebaseUId(String firebaseUID) {
        String sql = "SELECT * FROM Users WHERE FirebaseUID = ?";
        User m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, firebaseUID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new User();
                    m.setEmail(rs.getString("Email"));
                    m.setRole(rs.getString("Role"));
                    m.setFirebaseUID(rs.getString("FirebaseUID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public void insert(User user) {
        // SỬA: Thêm 2 cột GroupID, SupplierID vào SQL INSERT
        String sql = "INSERT INTO Users (Email, Role, FirebaseUID) "
                + "VALUES (?, ?, ?)"; // SỬA: Đủ 8 dấu ?

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getRole());
            ps.setString(3, user.getFirebaseUID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int medicineId) {
        String sql = "DELETE FROM Users WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(User user) {
        String sql = "UPDATE Users SET Email = ?, Role = ?, FirebaseUID = ? WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getRole());
            ps.setString(3, user.getFirebaseUID());
            ps.setInt(4, user.getUserID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
