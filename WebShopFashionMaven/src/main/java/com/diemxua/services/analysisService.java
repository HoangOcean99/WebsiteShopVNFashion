package com.diemxua.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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

    public Map<Integer, Integer> getQuantitySoldByCategory() {
        Map<Integer, Integer> result = new HashMap<>();
        String sql = "SELECT p.CategoryID, SUM(od.Quantity) AS TotalQuantitySold "
                + "FROM OrderDetails od "
                + "JOIN Products p ON od.ProductID = p.ProductID "
                + "JOIN Orders o ON o.OrderID = od.OrderID "
                + "WHERE o.Status = 'Da-giao-hang' "
                + "GROUP BY p.CategoryID "
                + "ORDER BY TotalQuantitySold DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                int totalQty = rs.getInt("TotalQuantitySold");
                result.put(categoryID, totalQty);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        for (int i : new int[]{1, 2, 4}) {
            result.putIfAbsent(i, 0);
        }

        return result;
    }

    public Map<Integer, Long> getRevenueByCategory() {
        Map<Integer, Long> result = new HashMap<>();
        String sql = "SELECT p.CategoryID, SUM(od.Price * od.Quantity) AS TotalRevenue "
                + "FROM OrderDetails od "
                + "JOIN Products p ON od.ProductID = p.ProductID "
                + "JOIN Orders o ON o.OrderID = od.OrderID "
                + "WHERE o.Status = 'Da-giao-hang' "
                + "GROUP BY p.CategoryID "
                + "ORDER BY TotalRevenue DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                long totalRevenue = rs.getLong("TotalRevenue");
                result.put(categoryID, totalRevenue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        for (int i : new int[]{1, 2, 4}) {
            result.putIfAbsent(i, 0L);
        }

        return result;
    }
}
