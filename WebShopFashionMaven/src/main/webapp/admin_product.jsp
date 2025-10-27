<%-- 
    Document   : admin_product
    Created on : Oct 25, 2025, 5:16:03 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@ page import="java.util.List, com.diemxua.model.ProductDetail" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Simple Dashboard</title>
        <link rel="stylesheet" href="css/admin_home.css" />

        <style>
            .main-content {
                flex-grow: 1;
                padding: 30px;
            }
            .section {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            }
            h3 {
                color: #2c3e50;
                font-size: 1.8em;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 3px solid #3498db;
            }

            /* --- Product List Table Styling --- */
            .product-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }
            .product-list-table th, .product-list-table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            .product-list-table th {
                background-color: #3498db; /* Blue header */
                color: white;
                font-weight: bold;
                text-transform: uppercase;
            }
            .product-list-table tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            .product-list-table td a {
                color: #2c3e50;
                font-weight: bold;
                cursor: pointer;
                text-decoration: none;
            }
            .product-list-table td a:hover {
                color: #e74c3c; /* Red hover for visual link */
                text-decoration: underline;
            }
            .badge {
                display: inline-block;
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 0.85em;
                font-weight: 600;
            }
            .badge.low {
                background-color: #f7dddc;
                color: #c0392b;
            }
            .badge.good {
                background-color: #d4edda;
                color: #155724;
            }

            .list-header {
                display: flex;
                justify-content: space-between; /* Đẩy tiêu đề và nút ra hai bên */
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 3px solid #1abc9c; /* Giống với border-bottom của h3 chi tiết */
            }

            .list-header h3 {
                margin: 0;
                color: #2c3e50;
                font-size: 1.5em;
                padding-bottom: 0; /* Đã có border-bottom ở list-header */
                border-bottom: none;
            }

            .button-add-product {
                background-color: #2ecc71; /* Màu xanh lá cây - primary */
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
                text-decoration: none; /* Quan trọng vì đây là thẻ <a> */
                transition: background-color 0.3s;
            }

            .button-add-product:hover {
                background-color: #27ae60;
            }

            /* Căn chỉnh bảng */
            .product-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                background-color: white;
            }

            .product-list-table th, .product-list-table td {
                border: 1px solid #ddd;
                padding: 12px 15px;
                text-align: left;
            }

            .product-list-table th {
                background-color: #f2f2f2;
                color: #34495e;
                font-weight: 600;
            }

            .product-list-table tr:hover {
                background-color: #f7f7f7;
            }

            .product-list-table a {
                color: #3498db;
                text-decoration: none;
                font-weight: 500;
            }

            .product-list-table a:hover {
                text-decoration: underline;
            }

            /* Badge tồn kho */
            .badge {
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 0.8em;
                font-weight: 600;
                margin-left: 5px;
            }

            .badge.good {
                background-color: #e6f7ee;
                color: #2ecc71;
            }
        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">

                <div class="list-header">
                    <h3>📦 Danh sách Sản phẩm Hiện tại</h3>
                    <div>
                        <a href="admin_addProduct.jsp" class="button-add-product">➕ Thêm Sản Phẩm Mới</a>
                    </div>
                </div>

                <div id="product-list-section" class="section">


                    <table class="product-list-table">
                        <thead>
                            <tr>
                                <th>Mã SP</th>
                                <th>Tên Sản phẩm</th>
                                <th>Danh mục</th>
                                <th>Giới tính</th>
                                <th>Giá (VND)</th>
                                <th>Tồn kho TỔNG</th>
                                <th>Ngày tạo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<com.diemxua.model.Product> products = (List<com.diemxua.model.Product>) request.getAttribute("products");
                                List<Integer> quantityStocks = (List<Integer>) request.getAttribute("quantityStocks");
                                int index = 0;
                                if(products != null){
                                    for(int i =0;i < products.size(); i++){
                                        index++;
                                        com.diemxua.model.Product p = products.get(i);
                                        int pd = quantityStocks.get(i);
                                        String categoryName = "";
                                        if(p.getCategoryID() == 1){
                                            categoryName = "Giao Lĩnh";
                                        }
                                        else if(p.getCategoryID() == 2){
                                            categoryName = "Viên Lĩnh";
                                        }
                                        else{
                                            categoryName = "Áo Tấc";
                                        }
                            %>
                            <tr>
                                <td><%= i + 1%></td> <td><a href="AdminProductDetailServlet?productID=<%= p.getProductID() %>"><%= p.getProductName() %></a></td>
                                <td><%= categoryName %></td>
                                <td><%= p.getGender() %></td>
                                <td><%= p.getFormatPrice() %></td>
                                <td><%= pd %><span class="badge good">Tốt</span></td>
                                <td><%= p.getCreateAt() %></td>
                            </tr>
                            <% }  }%>
                        </tbody>
                    </table>

                    <p style="margin-top: 25px; text-align: right; color: #555;">Tổng số sản phẩm: **<%= index %>**</p>
                </div>

            </div>
        </div>
    </body>
</html>
