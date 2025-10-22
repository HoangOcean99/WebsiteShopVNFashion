/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.Address;
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
public class ProductMaterialsService extends DBContext {

    public List<ProductMaterial> getAll() {
        List<ProductMaterial> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductMaterials";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                ProductMaterial m = new ProductMaterial(
                        rs.getInt("MaterialID"),
                        rs.getString("MaterialName"),
                        rs.getInt("ProductID")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public ProductMaterial getProductMaterialsByMaterialId(int userId) {
        String sql = "SELECT * FROM ProductMaterials WHERE MaterialID = ?";
        ProductMaterial m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new ProductMaterial();
                    m.setMaterialID(rs.getInt("MaterialID"));
                    m.setMaterialName(rs.getString("MaterialName"));
                    m.setProductID(rs.getInt("ProductID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public List<ProductMaterial> getProductMaterialsByProductId(int productId) {
        List<ProductMaterial> list = new ArrayList<>();
        String sql = "SELECT * FROM ProductMaterials WHERE ProductID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    ProductMaterial m = new ProductMaterial();
                    m.setMaterialID(rs.getInt("MaterialID"));
                    m.setMaterialName(rs.getString("MaterialName"));
                    m.setProductID(rs.getInt("ProductID"));
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(ProductMaterial user) {
        String sql = "INSERT INTO ProductMaterials (MaterialID, MaterialName, ProductID)"
                + "VALUES (?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, user.getMaterialID());
            ps.setString(2, user.getMaterialName());
            ps.setInt(3, user.getProductID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteMaterialID(int medicineId) {
        String sql = "DELETE FROM ProductMaterials WHERE MaterialID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProductID(int ProductId) {
        String sql = "DELETE FROM ProductMaterials WHERE ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, ProductId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editUser(ProductMaterial user) {
        String sql = "UPDATE ProductMaterials SET MaterialName = ?, ProductID = ? WHERE MaterialID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(3, user.getMaterialID());
            ps.setString(1, user.getMaterialName());
            ps.setInt(2, user.getProductID());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
