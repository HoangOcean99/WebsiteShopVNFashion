/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.OrderDetails;
import com.diemxua.model.Orders;
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
public class OrderDetailService extends DBContext {

    public List<OrderDetails> getAll() {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetails";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                OrderDetails m = new OrderDetails(
                        rs.getInt("OrderDetailID"),
                        rs.getInt("ProductID"),
                        rs.getInt("Quantity"),
                        rs.getInt("OrderID"),
                        rs.getString("size")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public OrderDetails getOrderByOrderDetailId(int OrderDetailID) {
        String sql = "SELECT * FROM OrderDetails WHERE OrderDetailID = ?";
        OrderDetails m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, OrderDetailID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new OrderDetails(
                            rs.getInt("OrderDetailID"),
                            rs.getInt("ProductID"),
                            rs.getInt("Quantity"),
                            rs.getInt("OrderID"),
                            rs.getString("size")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public List<OrderDetails> getOrderByOrderID(int OrderID) {
        List<OrderDetails> list = new ArrayList<>();
        String sql = "SELECT * FROM OrderDetails WHERE OrderID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, OrderID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    OrderDetails m = new OrderDetails(
                            rs.getInt("OrderDetailID"),
                            rs.getInt("ProductID"),
                            rs.getInt("Quantity"),
                            rs.getInt("Quantity"),
                            rs.getInt("OrderID"),
                            rs.getString("size")
                    );
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(OrderDetails product) {
        String sql = "INSERT INTO OrderDetails (ProductID, Quantity, OrderID, size, Price)"
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getQuantity());
            ps.setInt(3, product.getOrderID());
            ps.setString(4, product.getSize());
            ps.setLong(5, product.getPrice());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOrder(int OrderId) {
        String sql = "DELETE FROM OrderDetails WHERE OrderID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, OrderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editOrder(OrderDetails product) {
        String sql = "UPDATE OrderDetails SET ProductID = ?, Quantity = ?, OrderID = ?, size = ? WHERE OrderDetailID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getQuantity());
            ps.setInt(3, product.getOrderID());
            ps.setString(4, product.getSize());
            ps.setInt(5, product.getOrderDetailID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
