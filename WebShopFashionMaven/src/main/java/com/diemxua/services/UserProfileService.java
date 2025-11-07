/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.UserProfile;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Duong
 */
public class UserProfileService extends DBContext {

    public List<UserProfile> getAll() {
        List<UserProfile> list = new ArrayList<>();
        String sql = "SELECT * FROM UserProfile";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                UserProfile m = new UserProfile(
                        rs.getInt("ProfileID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getDate("DateOfBirth"),
                        rs.getString("Gender"),
                        rs.getString("AvatarURL"),
                        rs.getString("UserID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public UserProfile getUserByFirebaseId(String userId) {
        String sql = "SELECT * FROM UserProfile WHERE UserID = ?";
        UserProfile m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new UserProfile();
                    m.setProfileID(rs.getInt("ProfileID"));
                    m.setFullName(rs.getString("FullName"));
                    m.setPhone(rs.getString("Phone"));
                    m.setDateOfBirth(rs.getDate("DateOfBirth"));
                    m.setGender(rs.getString("Gender"));
                    m.setAvatarURL(rs.getString("AvatarURL"));
                    m.setUserID(rs.getString("UserID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public void insert(UserProfile user) {
        String sql = "INSERT INTO UserProfile (FullName, Phone, DateOfBirth, Gender, AvatarURL, UserID) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            Date date = user.getDateOfBirth();
            java.sql.Date mainDate = new java.sql.Date(date.getTime());
            ps.setDate(3, mainDate);
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAvatarURL());
            ps.setString(6, user.getUserID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        String sql = "DELETE FROM UserProfile WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(UserProfile user) {
        String sql = "UPDATE UserProfile SET FullName = ?, Phone = ?, DateOfBirth = ?, Gender = ? WHERE UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            java.sql.Date date = new java.sql.Date(user.getDateOfBirth().getTime());
            ps.setDate(3, date);
            ps.setString(4, user.getGender());
            ps.setString(5, user.getUserID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
