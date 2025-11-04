package com.diemxua.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class analysisService extends DBContext {

    // Tổng doanh thu
    public long getTotalRevenue() {
        long total = 0;
        String sql = "SELECT SUM(Total_price) AS totalRevenue FROM Orders WHERE Status = 'Da-giao-hang'";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                total = rs.getLong("totalRevenue");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Tổng số đơn hàng
    public int getTotalOrders() {
        int totalOrders = 0;
        String sql = "SELECT COUNT(*) AS totalOrders FROM Orders";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalOrders = rs.getInt("totalOrders");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOrders;
    }

    // Tổng số user
    public int getTotalUsers() {
        int totalUsers = 0;
        String sql = "SELECT COUNT(*) AS totalUsers FROM Users"; // hoặc bảng TAI_KHOAN / HANH_KHACH
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                totalUsers = rs.getInt("totalUsers");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalUsers;
    }
}
