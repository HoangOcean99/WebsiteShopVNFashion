/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.ProductDetail;
import com.diemxua.model.ProductMaterial;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duong
 */
public class ProductDetailService extends DBContext {

    public List<ProductDetail> getAll() {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductDetails";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                ProductDetail m = new ProductDetail(
                        rs.getInt("ProductDetailID"),
                        rs.getString("Size"),
                        rs.getLong("Stock_quantity"),
                        rs.getInt("ProductID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductDetail getProductMaterialsByDetailId(int userId) {
        String sql = "SELECT * FROM ProductDetails WHERE ProductDetailID = ?";
        ProductDetail m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new ProductDetail();
                    m.setProductDetailID(rs.getInt("ProductDetailID"));
                    m.setSize(rs.getString("Size"));
                    m.setStockQuantity(rs.getLong("Stock_quantity"));
                    m.setProductID(rs.getInt("ProductID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public List<ProductDetail> getProductMaterialsByProductId(int productId) {
        List<ProductDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductDetails WHERE ProductID = ?";
        ProductDetail m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            try (ResultSet rs = st.executeQuery()) {
               while (rs.next()) {
                    m = new ProductDetail();
                    m.setProductDetailID(rs.getInt("ProductDetailID"));
                    m.setSize(rs.getString("Size"));
                    m.setStockQuantity(rs.getLong("Stock_quantity"));
                    m.setProductID(rs.getInt("ProductID"));
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(ProductDetail user) {
        String sql = "INSERT INTO ProductDetails (Size, Stock_quantity, ProductID)"
                + "VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getSize());
            ps.setLong(2, user.getStockQuantity());
            ps.setInt(3, user.getProductID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDetailID(int medicineId) {
        String sql = "DELETE FROM ProductDetails WHERE ProductDetailID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProductID(int ProductId) {
        String sql = "DELETE FROM ProductDetails WHERE ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, ProductId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(ProductDetail user) {
        String sql = "UPDATE ProductDetails SET Size = ?, Stock_quantity = ?, ProductID = ? WHERE ProductDetailID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, user.getSize());
            ps.setLong(2, user.getStockQuantity());
            ps.setInt(3, user.getProductID());
            ps.setInt(4, user.getProductDetailID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
