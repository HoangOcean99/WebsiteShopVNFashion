/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.ProductSalesSummary;
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
public class ProductSalesSummaryService extends DBContext {

    public List<ProductSalesSummary> getAll() {
        List<ProductSalesSummary> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductSalesSummary";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                ProductSalesSummary m = new ProductSalesSummary(
                        rs.getInt("ProductSalesSummaryID"),
                        rs.getInt("ProductID"),
                        rs.getDate("DateSold"),
                        rs.getInt("QuantitySold"),
                        rs.getLong("PriceSold")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductSalesSummary> getOrderByProductID(int ProductID) {
        List<ProductSalesSummary> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductSalesSummary WHERE ProductID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, ProductID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    ProductSalesSummary m = new ProductSalesSummary(
                            rs.getInt("ProductSalesSummaryID"),
                            rs.getInt("ProductID"),
                            rs.getDate("DateSold"),
                            rs.getInt("QuantitySold"),
                            rs.getLong("PriceSold")
                    );
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(ProductSalesSummary product) {
        String sql = "INSERT INTO ProductSalesSummary (ProductID, QuantitySold, PriceSold)"
                + "VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getQuantitySold());
            ps.setLong(3, product.getPriceSold());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOrder(int OrderId) {
        String sql = "DELETE FROM ProductSalesSummary WHERE ProductSalesSummaryID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, OrderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editOrder(ProductSalesSummary product) {
        String sql = "UPDATE ProductSalesSummary SET ProductID = ?, QuantitySold = ?, PriceSold = ? WHERE ProductSalesSummaryID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, product.getProductID());
            ps.setInt(2, product.getQuantitySold());
            ps.setLong(3, product.getPriceSold());
            ps.setInt(4, product.getProductSaleSummaryID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
