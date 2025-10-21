/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.services;

import com.diemxua.model.Address;
import com.diemxua.model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duong
 */
public class ProductService extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                // SỬA: Bổ sung 2 Khóa ngoại vào Constructor
                Product m = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("Product_name"),
                        rs.getString("Description"),
                        rs.getString("Gender"),
                        rs.getInt("CategoryID"),
                        rs.getString("CreateAt"),
                        rs.getLong("Price"),
                        rs.getString("Trait"),
                        rs.getString("Items"),
                        rs.getString("ImageProduct1"),
                        rs.getString("ImasgeProduct2"),
                        rs.getString("ImageProduct3")
                );
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByProductId(int userId) {
        String sql = "SELECT * FROM Products WHERE ProductID = ?";
        Product m = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    m = new Product();
                    m.setProductID(rs.getInt("ProductID"));
                    m.setProductName(rs.getString("Product_name"));
                    m.setDescription(rs.getString("Description"));
                    m.setGender(rs.getString("Gender"));
                    m.setCategoryID(rs.getInt("CategoryID"));
                    m.setCreateAt(rs.getString("CreateAt"));
                    m.setPrice(rs.getLong("Price"));
                    m.setTrait(rs.getString("Trait"));
                    m.setItems(rs.getString("Items"));
                    m.setImageProduct1(rs.getString("ImageProduct1"));
                    m.setImageProduct2(rs.getString("ImageProduct2"));
                    m.setImageProduct3(rs.getString("ImageProduct3"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return m;
    }

    public List<Product> getProductByCategoryID(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE CategoryID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, categoryID);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Product m = new Product(
                            rs.getInt("ProductID"),
                            rs.getString("Product_name"),
                            rs.getString("Description"),
                            rs.getString("Gender"),
                            rs.getInt("CategoryID"),
                            rs.getString("CreateAt"),
                            rs.getLong("Price"),
                            rs.getString("Trait"),
                            rs.getString("Items"),
                            rs.getString("ImageProduct1"),
                            rs.getString("ImageProduct2"),
                            rs.getString("ImageProduct3")
                    );
                    list.add(m);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insert(Product product) {
        // SỬA: Thêm 2 cột GroupID, SupplierID vào SQL INSERT
        String sql = "INSERT INTO Products (Product_name, Description, Gender, CategoryID, CreateAt, Price, Trait, Items, ImageProduct1, ImageProduct2, ImageProduct3) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setString(3, product.getGender());
            ps.setInt(4, product.getCategoryID());
            ps.setString(5, product.getCreateAt());
            ps.setLong(6, product.getPrice());
            ps.setString(7, product.getTrait());
            ps.setString(8, product.getItems());
            ps.setString(9, product.getImageProduct1());
            ps.setString(10, product.getImageProduct2());
            ps.setString(11, product.getImageProduct3());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int medicineId) {
        String sql = "DELETE FROM Products WHERE ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, medicineId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editProduct(Product product) {
        String sql = "UPDATE Products SET Product_name = ?, Description = ?, Gender = ?, CategoryID = ?, CreateAt = ?, Price = ?, Trait = ?, Items = ?, ImageProduct1 = ?, ImageProduct2 = ?, ImageProduct3 = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setString(3, product.getGender());
            ps.setInt(4, product.getCategoryID());
            ps.setString(5, product.getCreateAt());
            ps.setLong(6, product.getPrice());
            ps.setString(7, product.getTrait());
            ps.setString(8, product.getItems());
            ps.setString(9, product.getImageProduct1());
            ps.setString(10, product.getImageProduct2());
            ps.setString(11, product.getImageProduct3());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
