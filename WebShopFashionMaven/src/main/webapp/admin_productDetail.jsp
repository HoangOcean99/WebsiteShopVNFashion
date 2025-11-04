<%-- 
    Document : admin_product_detail
    Created on : Oct 25, 2025, 5:16:03 PM
    Author : Duong
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
        <title>Chỉnh sửa Sản phẩm | Dashboard</title>
        <script src="https://unpkg.com/lucide@latest"></script>

        <style>
            /* --- COLOR PALETTE --- */
            :root {
                --primary: #3498db;
                --primary-dark: #2980b9;
                --secondary: #1abc9c;
                --secondary-dark: #16a085;
                --background: #f7f9fb;
                --sidebar-bg: #2c3e50;
                --text-dark: #34495e;
                --text-light: #ecf0f1;
                --danger: #e74c3c;
            }

            /* ================= Sidebar & Main Layout ================= */
            .sidebar {
                width: 250px;
                height: 100vh;
                position: fixed;
                left: 0;
                top: 0;
                background-color: var(--sidebar-bg);
                color: white;
                box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
                padding: 20px 0;
                z-index: 1000;
            }
            .sidebar h2 {
                text-align: center;
                color: var(--text-light);
                margin: 20px 0;
                font-size: 1.4em;
            }
            .sidebar nav ul {
                list-style: none;
                padding: 0;
            }
            .sidebar nav ul li a {
                display: block;
                color: var(--text-light);
                text-decoration: none;
                padding: 12px 20px;
                font-size: 1em;
                transition: background-color 0.3s, padding-left 0.2s;
            }
            .sidebar nav ul li a:hover {
                background-color: #34495e;
                padding-left: 28px;
            }
            .sidebar nav ul li a.active {
                background-color: var(--secondary);
                color: white;
                font-weight: 600;
            }
            .back-button {
                display: inline-block;
                color: var(--text-light);
                text-decoration: none;
                padding: 6px 10px;
                border-radius: 5px;
                transition: background-color 0.2s;
                font-size: 0.9em;
            }
            .back-button:hover {
                background-color: #34495e;
                color: white;
            }

            .dashboard-container {
                display: flex;
                min-height: 100vh;
                background-color: var(--background);
                font-family: 'Segoe UI', Tahoma, sans-serif;
            }
            .main-content {
                flex: 1;
                margin-left: 250px;
                padding: 30px 50px;
                transition: margin-left 0.3s;
            }
            .section h3 {
                color: var(--text-dark);
                font-size: 1.8em;
                margin-bottom: 25px;
                padding-bottom: 8px;
            }

            /* ================= Content Styling (Giữ nguyên) ================= */
            .content-box {
                background: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                margin-bottom: 30px;
            }
            .detail-group h4 {
                color: var(--primary);
                font-size: 1.2em;
                margin-top: 20px;
                margin-bottom: 15px;
                padding-bottom: 5px;
                border-bottom: 1px solid #eee;
            }
            .header-actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid var(--secondary);
            }
            .back-button1 {
                display: flex;
                align-items: center;
                gap: 5px;
                text-decoration: none;
                color: var(--primary);
                font-weight: bold;
                padding: 5px 10px;
                transition: color 0.3s;
            }
            .back-button1:hover {
                color: var(--primary-dark);
            }

            .product-info-grid {
                display: grid;
                grid-template-columns: 200px 1fr;
                gap: 15px 25px;
                align-items: center;
            }
            .product-info-grid label {
                text-align: right;
                font-weight: 600;
                color: var(--text-dark);
            }
            .product-info-grid textarea {
                grid-column: 2;
                resize: vertical;
            }
            .product-info-grid label[for="Desctiption"], .product-info-grid label[for="features"], .product-info-grid label[for="items"] {
                align-self: flex-start;
                padding-top: 10px;
            }
            .product-info-grid input:not([type="submit"]), .product-info-grid select, .product-info-grid textarea {
                padding: 10px 15px;
                border: 1px solid #ccc;
                border-radius: 8px;
                transition: border-color 0.3s, box-shadow 0.3s;
                font-size: 1em;
            }
            .product-info-grid input:focus, .product-info-grid select:focus, .product-info-grid textarea:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
                outline: none;
            }
            input[readonly] {
                background-color: #f1f1f1;
                cursor: default;
            }

            .image-gallery {
                display: flex;
                gap: 20px;
                flex-wrap: wrap;
                margin-top: 15px;
            }
            .image-box {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 10px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.05);
                background-color: var(--background);
                width: 180px;
            }
            .image-box img {
                width: 100%;
                height: 120px;
                object-fit: cover;
                border-radius: 4px;
                margin-bottom: 10px;
            }

            .button-base {
                padding: 10px 18px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-weight: bold;
                margin-left: 10px;
                transition: background-color 0.3s, transform 0.1s;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .button-base:active {
                transform: scale(0.98);
            }
            .button-primary {
                background-color: var(--secondary);
                color: white;
            }
            .button-primary:hover {
                background-color: var(--secondary-dark);
            }
            .button-danger {
                background-color: var(--danger);
                color: white;
            }
            .button-danger:hover {
                background-color: #c0392b;
            }
            .button-add {
                background-color: var(--primary);
                color: white;
                margin-top: 15px;
            }
            .button-add:hover {
                background-color: var(--primary-dark);
            }
            .button-remove {
                background-color: #f1f1f1;
                color: var(--text-dark);
                margin: 0 0 0 5px;
                padding: 5px 10px;
                font-size: 0.9em;
            }
            .button-remove:hover {
                background-color: #ddd;
            }

            .data-table-wrapper {
                width: 100%;
                overflow-x: auto;
                margin-bottom: 20px;
            }
            .data-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
                background: white;
                min-width: 500px;
            }
            .data-table th, .data-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #eee;
            }
            .data-table th {
                background-color: #f5f5f5;
                color: var(--text-dark);
                font-weight: bold;
                text-transform: uppercase;
                font-size: 0.9em;
            }
            .data-table input[type="text"], .data-table input[type="number"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }


            /* ================= Responsive Adjustments (Mobile) ================= */

            .menu-toggle {
                display: none;
                position: fixed;
                top: 10px;
                left: 10px;
                z-index: 1001;
                background: var(--sidebar-bg);
                color: white;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 1.2em;
            }
            .sidebar-responsive {
                transform: translateX(-250px);
                transition: transform 0.3s ease-in-out;
            }
            .sidebar-responsive.open {
                transform: translateX(0);
                box-shadow: 2px 0 5px rgba(0,0,0,0.4);
            }

            @media (max-width: 768px) {
                .menu-toggle {
                    display: block;
                }
                .sidebar {
                    position: fixed;
                    z-index: 1000;
                }
                .main-content {
                    margin-left: 0;
                    padding: 60px 15px 20px 15px;
                }

                /* Form Grid Mobile Stack */
                .product-info-grid {
                    grid-template-columns: 1fr;
                    gap: 10px;
                }
                .product-info-grid label {
                    text-align: left;
                    font-weight: bold;
                    margin-top: 10px;
                }
                .product-info-grid textarea, .product-info-grid input, .product-info-grid select {
                    grid-column: 1;
                }
                .product-info-grid label[for="Desctiption"], .product-info-grid label[for="features"], .product-info-grid label[for="items"] {
                    padding-top: 0;
                }

                .content-box {
                    padding: 15px;
                }
                .header-actions {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 10px;
                }
            }
        </style>
    </head>

    <body>
        <div class="dashboard-container">

            <div id="admin-sidebar" class="sidebar sidebar-responsive">
                <div class="sidebar-header">
                    <a href="home.jsp" class="back-button" title="Quay lại trang chính">
                        ← Quay lại
                    </a>
                </div>
                <h2>📊 Dashboard</h2>
                <nav>
                    <ul>
                        <li><a id="product" href="AdminProductServlet">📦 Thông tin Sản phẩm</a></li>
                        <li><a id="order" href="AdminOrderServlet">🛒 Thông tin Đơn hàng</a></li>
                        <li><a id="analysis" href="AnalysisServlet">📈 Phân tích Mua hàng</a></li>
                    </ul>
                </nav>
            </div>

            <button class="menu-toggle" id="menu-toggle">
                <i data-lucide="menu"></i>
            </button>


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
                            <a href="AdminProductServlet" class="back-button1 button-base">
                                <i data-lucide="arrow-left" style="width: 1em; height: 1em;"></i> Quay lại danh sách
                            </a>
                            <div style="flex-grow: 1;"></div>
                            <button type="submit" class="button-primary button-base">💾 Lưu Thay Đổi</button>
                            <button type="button" class="button-danger button-base" onclick="window.location.href = 'AdminDeleteProductServlet?productID=<%= product.getProductID() %>'">🗑️ Xóa Sản Phẩm</button>
                        </div>

                        <h3>📝 Chỉnh sửa Sản phẩm: <%= product.getProductName() %></h3>

                        <div class="content-box">
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
                        </div>

                        <div class="content-box">
                            <div class="detail-group">
                                <h4>Ảnh sản phẩm (Tối đa 3 ảnh)</h4>
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
                        </div>

                        <div class="content-box">
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
                        </div>

                        <div class="content-box">
                            <div class="detail-group">
                                <h4>Chi tiết Chất liệu (Material)</h4>
                                <div class="data-table-wrapper">
                                    <table class="data-table" id="tableMaterial">
                                        <thead>
                                            <tr>
                                                <th>Tên Chất liệu</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% if (productMaterials != null) { 
                                                for(com.diemxua.model.ProductMaterial pm : productMaterials) { %>
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="materialID" value="<%= pm.getMaterialID() %>">
                                                    <input type="text" name="materialName" value="<%= pm.getMaterialName() %>">
                                                </td>
                                                <td><button type="button" class="button-remove button-base" onclick="removeTable(this)">Xóa</button></td>
                                            </tr>
                                            <% } 
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
                                <button type="button" class="button-add button-base" onclick="addRowTableMaterial()">
                                    <i data-lucide="plus" style="width: 1em; height: 1em;"></i> + Thêm Chất liệu
                                </button>
                            </div>
                        </div>

                        <div class="content-box">
                            <div class="detail-group">
                                <h4>Chi tiết Kích cỡ & Tồn kho (Stock Quantity)</h4>
                                <div class="data-table-wrapper">
                                    <table class="data-table" id="tableDetail">
                                        <thead>
                                            <tr>
                                                <th>Kích cỡ</th>
                                                <th>Tồn kho</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% if (productDetails != null) { 
                                                for(com.diemxua.model.ProductDetail pd : productDetails) { %>
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="detailID" value="<%= pd.getProductDetailID() %>">
                                                    <input type="text" name="size" value="<%= pd.getSize() %>" required>
                                                </td>
                                                <td><input type="number" name="stock" value="<%= pd.getStockQuantity() %>" min="0" required></td>
                                                <td><button type="button" class="button-remove button-base" onclick="removeTable(this)">Xóa</button></td>
                                            </tr>
                                            <% } 
                                            } %>
                                        </tbody>
                                    </table>
                                </div>
                                <button type="button" class="button-add button-base" onclick="addRowTableDetail()">
                                    <i data-lucide="plus" style="width: 1em; height: 1em;"></i> + Thêm Kích cỡ/Tồn kho
                                </button>
                            </div>
                        </div>

                        <div style="margin-top: 20px; text-align: right;">
                            <button type="submit" class="button-primary button-base">
                                💾 Lưu Thay Đổi
                            </button>
                            <button type="button" class="button-danger button-base" onclick="window.location.href = 'AdminDeleteProductServlet?productID=<%= product.getProductID() %>'">🗑️ Xóa Sản Phẩm</button>
                        </div>

                    </form>
                    <% } else { %>
                    <div class="content-box" style="text-align: center; color: var(--danger);">
                        <h3>Không tìm thấy sản phẩm.</h3>
                        <a href="AdminProductServlet" class="back-button1 button-base">← Quay lại danh sách</a>
                    </div>
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
                    <td><input type="text" name="materialName" value="" required></td>
                    <td><button type="button" class="button-remove button-base" onclick="removeTable(this)">Xóa</button></td>
                `;
                table.appendChild(newRow);
            }

            function addRowTableDetail() {
                const table = document.querySelector("#tableDetail tbody");
                const newRow = document.createElement("tr");
                newRow.innerHTML = `
                    <td><input type="text" name="size" value="" required></td>
                    <td><input type="number" name="stock" value="" min="0" required></td>
                    <td><button type="button" class="button-remove button-base" onclick="removeTable(this)">Xóa</button></td>
                `;
                table.appendChild(newRow);
            }

            function removeTable(button) {
                const row = button.closest('tr');
                row.parentNode.removeChild(row);
            }

            // Logic đánh dấu Active Link và khởi tạo icons
            document.addEventListener('DOMContentLoaded', function () {
                if (typeof lucide !== 'undefined') {
                    lucide.createIcons();
                }

                // Logic Active Link
                const currentPage = location.pathname.split("/").pop();
                document.querySelectorAll(".sidebar nav ul li a").forEach(a => {
                    const linkHref = a.getAttribute("href");
                    if (linkHref && linkHref.split("/").pop() === currentPage) {
                        a.classList.add("active");
                    }
                });

                // Logic Mobile Toggle
                const sidebar = document.getElementById('admin-sidebar');
                const toggleButton = document.getElementById('menu-toggle');

                toggleButton.addEventListener('click', function () {
                    sidebar.classList.toggle('open');
                    document.body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : 'auto';
                });

                document.addEventListener('click', function (e) {
                    if (window.innerWidth <= 768 && sidebar.classList.contains('open') &&
                            !sidebar.contains(e.target) && !toggleButton.contains(e.target)) {
                        sidebar.classList.remove('open');
                        document.body.style.overflow = 'auto';
                    }
                });

                // Khởi tạo hàng mẫu nếu bảng trống sau khi load dữ liệu
                if (document.querySelector("#tableMaterial tbody").children.length === 0) {
                    addRowTableMaterial();
                }
                if (document.querySelector("#tableDetail tbody").children.length === 0) {
                    addRowTableDetail();
                }
            });
        </script>
    </body>
</html>