/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.Address;
import com.diemxua.model.Orders;
import com.diemxua.model.Product;
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
public class OrdersService extends DBContext {

    public List<Orders> getAll() {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                Orders m = new Orders(
                        rs.getInt("OrderID"),
                        rs.getDate("Order_date"),
                        rs.getString("Status"),
                        rs.getString("Ship_method"),
                        rs.getString("Payment_method"),
                        rs.getLong("Total_price"),
                        rs.getInt("addressId"),
                        rs.getInt("userId"),
                        rs.getString("dateOrder")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Orders getOrderByOrderId(int userId) {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        Orders m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new Orders();
                    m.setOrderId(rs.getInt("OrderID"));
                    m.setOrderDate(rs.getDate("Order_date"));
                    m.setStatus(rs.getString("Status"));
                    m.setShipMethod(rs.getString("Ship_method"));
                    m.setPaymentMethod(rs.getString("Payment_method"));
                    m.setTotalPrice(rs.getLong("Total_price"));
                    m.setAddressId(rs.getInt("addressId"));
                    m.setUserId(rs.getInt("userId"));
                    m.setDateSend(rs.getString("dateOrder"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public List<Orders> getOrderByUserID(int UserID) {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE UserID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, UserID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Orders m = new Orders(
                            rs.getInt("OrderID"),
                            rs.getDate("Order_date"),
                            rs.getString("Status"),
                            rs.getString("Ship_method"),
                            rs.getString("Payment_method"),
                            rs.getLong("Total_price"),
                            rs.getInt("addressId"),
                            rs.getInt("userId"),
                            rs.getString("dateOrder")
                    );
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int insert(Orders order) {
        String sql = "INSERT INTO Orders (Status, Ship_method, Payment_method, AddressID, UserID, Total_price, dateOrder)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?)";

        int generatedId = -1;

        try (
                PreparedStatement ps = connection.prepareStatement(
                        sql,
                        java.sql.Statement.RETURN_GENERATED_KEYS
                )) {
                    ps.setString(1, order.getStatus());
                    ps.setString(2, order.getShipMethod());
                    ps.setString(3, order.getPaymentMethod());
                    ps.setLong(4, order.getAddressId());
                    ps.setInt(5, order.getUserId());
                    ps.setLong(6, order.getTotalPrice());
                    ps.setString(7, order.getDateSend());

                    int affectedRows = ps.executeUpdate();

                    if (affectedRows > 0) {
                        try (java.sql.ResultSet rs = ps.getGeneratedKeys()) {
                            if (rs.next()) {
                                generatedId = rs.getInt(1);
                            }
                        }
                    }
                } catch (java.sql.SQLException e) {
                    e.printStackTrace();
                }

                return generatedId;
    }

    public void deleteOrder(int OrderId) {
        String sql = "DELETE FROM Orders WHERE OrderID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, OrderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editOrder(Orders product) {
        String sql = "UPDATE Orders SET Status = ?, Ship_method = ?, Payment_method = ?, AddressID = ?, UserID = ?, Total_price = ?, dateOrder= ? WHERE OrderID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getStatus());
            ps.setString(2, product.getShipMethod());
            ps.setString(3, product.getPaymentMethod());
            ps.setInt(4, product.getAddressId());
            ps.setInt(5, product.getUserId());
            ps.setLong(6, product.getTotalPrice());
            ps.setString(7, product.getDateSend());
            ps.setInt(8, product.getOrderId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
