<%-- 
    Document   : admin_product
    Created on : Oct 25, 2025, 5:16:03 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@ page import="java.util.List, com.diemxua.model.ProductDetail" %>
<%@ page import="java.util.List, com.diemxua.model.ProductMaterial" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chi tiết Sản phẩm | Dashboard</title>

        <!-- CSS giữ nguyên -->
        <style>
            /* ================= Sidebar ================= */
            .sidebar {
                width:250px;
                height:100vh;
                position:fixed;
                left:0;
                top:0;
                background-color:#2c3e50;
                color:white;
                box-shadow:2px 0 10px rgba(0,0,0,0.2);
                padding:20px 0;
            }
            .sidebar h2 {
                text-align:center;
                color:#ecf0f1;
                margin:20px 0;
                font-size:1.4em;
            }
            .sidebar nav ul {
                list-style:none;
                padding:0;
                margin:0;
            }
            .sidebar nav ul li a {
                display:block;
                color:#ecf0f1;
                text-decoration:none;
                padding:12px 20px;
                font-size:1em;
                transition: background-color 0.3s, padding-left 0.2s;
            }
            .sidebar nav ul li a:hover {
                background-color:#34495e;
                padding-left:28px;
            }
            .sidebar nav ul li a.active {
                background-color:#1abc9c;
                color:white;
                font-weight:600;
            }
            .sidebar-header {
                padding:0 20px;
            }
            .back-button {
                display:inline-block;
                color:#ecf0f1;
                text-decoration:none;
                padding:6px 10px;
                border-radius:5px;
                transition:background-color 0.2s;
                font-size:0.9em;
            }
            .back-button:hover {
                background-color:#34495e;
                color:white;
            }

            /* ================= Main Layout ================= */
            .dashboard-container {
                display:flex;
                min-height:100vh;
                background-color:#f7f9fb;
                font-family:'Segoe UI', Tahoma, sans-serif;
            }
            .main-content {
                flex:1;
                margin-left:250px;
                padding:30px 50px;
            }
            .section h3 {
                color:#2c3e50;
                font-size:1.5em;
                margin-bottom:20px;
                border-bottom:3px solid #1abc9c;
                padding-bottom:8px;
            }
            .back-button1 {
                display:inline-block;
                color:#2c3e50;
                text-decoration:none;
                background-color:#ecf0f1;
                padding:6px 10px;
                border-radius:5px;
                margin-bottom:15px;
                transition:all 0.3s;
            }
            .back-button1:hover {
                background-color:#1abc9c;
                color:white;
            }

            .product-info-grid {
                display:grid;
                grid-template-columns:200px 1fr;
                gap:10px 20px;
                align-items:center;
            }
            .product-info-grid label {
                text-align:right;
                font-weight:500;
                color:#34495e;
            }
            .product-info-grid input[type="text"], .product-info-grid input[type="number"], .product-info-grid input[type="date"], .product-info-grid select, .product-info-grid textarea {
                width:100%;
                padding:8px 12px;
                border:1px solid #ccc;
                border-radius:6px;
                box-sizing:border-box;
            }
            .product-info-grid textarea {
                grid-column:2;
                resize:vertical;
            }
            .product-info-grid label[for="description"] {
                align-self:flex-start;
                padding-top:8px;
            }

            .data-table input {
                border:1px solid #eee;
                padding:5px;
                width:100%;
                box-sizing:border-box;
            }

            .button-primary, .button-danger, .button-add, .button-remove {
                padding:10px 15px;
                border:none;
                border-radius:6px;
                cursor:pointer;
                font-weight:bold;
                margin-left:10px;
                transition:background-color 0.3s;
            }
            .button-primary {
                background-color:#2ecc71;
                color:white;
            }
            .button-primary:hover {
                background-color:#27ae60;
            }
            .button-danger {
                background-color:#e74c3c;
                color:white;
            }
            .button-danger:hover {
                background-color:#c0392b;
            }
            .button-add {
                background-color:#3498db;
                color:white;
                margin-top:10px;
            }
            .button-add:hover {
                background-color:#2980b9;
            }
            .button-remove {
                background-color:#bdc3c7;
                color:#333;
                margin:0;
                padding:5px 8px;
                font-size:0.9em;
            }
            .button-remove:hover {
                background-color:#95a5a6;
            }

            input[readonly] {
                background-color:#ecf0f1;
                cursor:default;
            }

            .image-gallery {
                display:flex;
                gap:20px;
                flex-wrap:wrap;
                justify-content:flex-start;
                margin-top:15px;
            }
            .image-box {
                border:1px solid #ddd;
                border-radius:8px;
                padding:10px;
                display:flex;
                flex-direction:column;
                align-items:center;
                box-shadow:0 2px 5px rgba(0,0,0,0.05);
                background-color:white;
                width:200px;
                min-width:150px;
            }
            .image-box img {
                width:100%;
                height:150px;
                object-fit:cover;
                border-radius:4px;
                margin-bottom:10px;
                border:1px solid #eee;
            }
            .image-box input[type="file"] {
                width:100%;
                padding:8px;
                border:1px solid #ced4da;
                border-radius:5px;
                background-color:#f8f9fa;
                cursor:pointer;
                font-size:0.9em;
                color:#495057;
            }
            .image-box input[type="file"]::-webkit-file-upload-button {
                visibility:hidden;
                width:0;
                padding:0;
                margin:0;
            }
            .image-box input[type="file"]::before {
                content:'Chọn ảnh';
                display:inline-block;
                background:#3498db;
                color:white;
                border:1px solid #3498db;
                border-radius:5px;
                padding:8px 12px;
                outline:none;
                white-space:nowrap;
                cursor:pointer;
                font-weight:700;
                font-size:0.9em;
                width:100%;
                text-align:center;
                box-sizing:border-box;
            }
            .image-box input[type="file"]:hover::before, .image-box input[type="file"]:active::before {
                background:#2980b9;
            }
        </style>
    </head>

    <body>
        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">
                <div id="product-detail" class="section">
                    <% 
                        com.diemxua.model.Product product = (com.diemxua.model.Product) request.getAttribute("product");
                        List<com.diemxua.model.ProductDetail> productDetails = (List<com.diemxua.model.ProductDetail>) request.getAttribute("productDetails");
                        List<com.diemxua.model.ProductMaterial> productMaterials = (List<com.diemxua.model.ProductMaterial>) request.getAttribute("productMaterials");
                        if(product != null){
                    %>
                    <form action="AdminUpdateProductServlet" method="POST"  enctype="multipart/form-data">
                        <input type="hidden" name="productID" value="<%= product.getProductID() %>">

                        <div class="header-actions">
                            <a href="AdminProductServlet" class="back-button1">← Quay lại danh sách</a>
                            <div style="flex-grow: 1;"></div>
                            <button type="submit" class="button-primary">💾 Lưu Thay Đổi</button>
                            <button type="button" class="button-danger" onclick="window.location.href = 'AdminDeleteProductServlet?productID=<%= product.getProductID() %>'">🗑️ Xóa Sản Phẩm</button>
                        </div>

                        <h3>📝 Chi tiết Sản phẩm: Áo Sơ Mi Linen Cao Cấp</h3>

                        <div class="detail-group">
                            <h4>Thông tin Cơ bản</h4>
                            <div class="product-info-grid">

                                <label for="productName"><strong>Tên Sản phẩm:</strong></label>
                                <input type="text" id="productName" name="productName" value="<%= product.getProductName() %>" required>

                                <label for="Desctiption"><strong>Mô tả Sản phẩm:</strong></label>
                                <textarea type="text" id="Desctiption" name="Desctiption" rows="3"><%= product.getDescription() %></textarea>

                                <label for="gender"><strong>Giới tính áp dụng:</strong></label>
                                <select id="gender" name="gender">
                                    <option value="Male" <% if("Male".equals(product.getGender())){ %>selected <% } %>>Nam</option>
                                    <option value="Female" <% if("Female".equals(product.getGender())){ %>selected <% } %>>Nữ</option>
                                    <option value="Unisex" <% if("Unisex".equals(product.getGender())){ %>selected <% } %>>Unisex</option>
                                </select>

                                <label for="category"><strong>Danh mục:</strong></label>
                                <select id="category" name="categoryID">
                                    <option value="1" <% if(product.getCategoryID() == 1){ %>selected <% } %>>Giao Lĩnh</option>
                                    <option value="2" <% if(product.getCategoryID() == 2){ %>selected <% } %>>Viên Lĩnh</option>
                                    <option value="4" <% if(product.getCategoryID() == 4){ %>selected <% } %>>Áo Tấc</option>
                                </select>

                                <label for="createDate"><strong> Ngày tạo:</strong></label>
                                <input type="text" id="createDate" name="createDate" value="<%= product.getCreateAt() %>" readonly>
                            </div>
                        </div>

                        <div class="detail-group">
                            <h4>Ảnh sản phẩm (Liên kết)</h4>
                            <div class="image-gallery">
                                <div class="image-box">
                                    <img src="<%= product.getImageProduct1() %>" alt="Ảnh 1" id="preview1">
                                    <input type="file" id="fileInput1" accept="image/*" name="image1">
                                </div>

                                <div class="image-box">
                                    <img src="<%= product.getImageProduct2() %>" alt="Ảnh 2" id="preview2">
                                    <input type="file" id="fileInput2" accept="image/*" name="image2">
                                </div>

                                <div class="image-box">
                                    <img src="<%= product.getImageProduct3() %>" alt="Ảnh 3" id="preview3">
                                    <input type="file" id="fileInput3" accept="image/*" name="image3">
                                </div>
                            </div>

                        </div>

                        <div class="detail-group">
                            <h4>Thông tin Mô tả & Giá</h4>
                            <div class="product-info-grid">
                                <label for="price"><strong>Giá (VND):</strong></label>
                                <input type="number" id="price" name="price" value="<%= product.getPrice() %>" required min="0">

                                <label for="features"><strong>Đặc điểm nổi bật:</strong></label>
                                <textarea type="text" id="features" name="features" rows="3"><%= product.getTrait() %></textarea>

                                <label for="items"><strong>Các phụ kiện đi kèm:</strong></label>
                                <textarea type="text" id="items" name="items" rows="3"><%= product.getItems () %></textarea>
                            </div>
                        </div>

                        <h4>Thành phần sản phẩm</h4>
                        <table class="data-table" id="tableMaterial">
                            <thead>
                                <tr>
                                    <th>Tên Chất liệu</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(int i =0 ;i< productMaterials.size(); i++) { %>
                                <tr>
                                    <td>
                                        <input type="hidden" name="materialID" value="<%= productMaterials.get(i).getMaterialID() %>">
                                        <input type="text" name="materialName" value="<%= productMaterials.get(i).getMaterialName() %>">
                                    </td>
                                    <td><button type="button" class="button-remove" onclick="removeTable(this)">Xóa</button></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <button type="button" class="button-add" onclick="addRowTableMaterial()">+ Thêm Chất liệu</button>

                        <h4>Chi tiết sản phẩm</h4>
                        <table class="data-table" id="tableDetail">
                            <thead>
                                <tr>
                                    <th>Kích cỡ</th>
                                    <th>Tồn kho</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(int i =0 ;i< productDetails.size(); i++) { %>
                                <tr>
                                    <td>
                                        <input type="hidden" name="detailID" value="<%= productDetails.get(i).getProductDetailID() %>">
                                        <input type="text" name="size" value="<%= productDetails.get(i).getSize() %>" required>
                                    </td>
                                    <td><input type="number" name="stock" value="<%= productDetails.get(i).getStockQuantity() %>" min="0" required></td>
                                    <td><button type="button" class="button-remove" onclick="removeTable(this)">Xóa</button></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <button type="button" class="button-add" onclick="addRowTableDetail()">+ Thêm Kích cỡ/Tồn kho</button>
                </div>
                </form>
                <% } %>
            </div>
        </div>
    </div>
    <script>
        function setUpPreview(inputId, imageId) {
            document.getElementById(inputId).addEventListener("change", function (event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById(imageId).src = e.target.result;
                    }
                    reader.readAsDataURL(file);
                }
            });
        }

        setUpPreview("fileInput1", "preview1");
        setUpPreview("fileInput2", "preview2");
        setUpPreview("fileInput3", "preview3");

        function addRowTableMaterial() {
            const table = document.querySelector("#tableMaterial tbody");
            const newRow = document.createElement("tr");
            newRow.innerHTML = `
    <td><input type="text" name="materialName" value=""></td>
    <td><button type="button" class="button-remove" onclick="removeTable(this)">Xóa</button></td>
`;
            table.appendChild(newRow);
        }

        function addRowTableDetail() {
            const table = document.querySelector("#tableDetail tbody");
            const newRow = document.createElement("tr");
            newRow.innerHTML = `
    <td><input type="text" name="size" value="" required></td>
    <td><input type="number" name="stock" value="" min="0" required></td>
    <td><button type="button" class="button-remove" onclick="removeTable(this)">Xóa</button></td>
`;
            table.appendChild(newRow);
        }

        function removeTable(button) {
            const row = button.closest('tr');
            row.parentNode.removeChild(row);
        }

    </script>
</body>
</html>
