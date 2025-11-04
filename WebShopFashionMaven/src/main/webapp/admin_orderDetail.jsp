<%-- 
    Document   : admin_orderDetail
    Created on : Oct 25, 2025, 5:43:03 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, 
         com.diemxua.model.Orders, 
         com.diemxua.model.Product,
         java.util.ArrayList, 
         com.diemxua.model.OrderDetails,
         com.diemxua.model.Address" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Detail Dashboard</title>
        <link rel="stylesheet" href="css/admin_home.css" />
        <style>
            /* --- Main Content Area --- */
            .main-content {
                flex-grow: 1;
                padding: 30px;
            }
            .section {
                background-color: white;
                padding: 30px;
                margin-bottom: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            }
            h3 {
                color: #e74c3c; /* Red tone for Order */
                font-size: 1.8em;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 3px solid #e74c3c;
            }

            /* --- Info Card Styling --- */
            .info-cards {
                display: flex;
                gap: 20px;
                margin-bottom: 30px;
            }
            .card {
                flex: 1;
                padding: 20px;
                border-radius: 8px;
                background-color: #f8f9fa;
                border-left: 5px solid #3498db;
                box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            }
            .card h4 {
                color: #3498db;
                margin-top: 0;
                margin-bottom: 10px;
            }
            .card p {
                margin: 5px 0;
                font-size: 1.1em;
            }
            .card strong {
                display: inline-block;
                width: 120px;
                color: #555;
                font-weight: 600;
            }

            /* --- Order Detail List (Table) Styling --- */
            .order-detail-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }
            .order-detail-table th, .order-detail-table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            .order-detail-table th {
                background-color: #2c3e50;
                color: white;
                font-weight: bold;
            }
            .order-detail-table tr:nth-child(even) {
                background-color: #f4f6f9;
            }
            .order-detail-table tfoot td {
                font-size: 1.2em;
                font-weight: bold;
                background-color: #ecf0f1;
            }
            .status-badge {
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
                color: white;
            }
            .status-shipping {
                background-color: #f39c12;
            }
            .status-pending {
                background-color: #3498db;
            }
            .status-completed {
                background-color: #27ae60;
            }
            .status-cancelled {
                background-color: #e74c3c;
            }

            .sidebar {
                /* ... các style sidebar cũ ... */
                width: 250px;
                background-color: #2c3e50; /* Dark blue/gray */
                color: white;
                padding: 20px 0;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            }

            .sidebar h2 {
                text-align: center;
                margin-bottom: 30px;
                /* Điều chỉnh margin-top nếu cần */
                margin-top: 15px;
                color: #ecf0f1;
            }

            /* Vùng chứa nút Back */
            .sidebar-header {
                padding: 0 20px;
            }

            .back-button1 {
                display: inline-block;
                color: #2c3e50;
                text-decoration: none;
                background-color: #ecf0f1;
                padding: 6px 10px;
                border-radius: 5px;
                margin-bottom: 15px;
                transition: all 0.3s;
            }

            .back-button1:hover {
                background-color: #1abc9c;
                color: white;
            }
        </style>
        <style>
            .status-badge {
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
                color: white;
            }

            .status-Cho-xac-nhan {
                background-color: #f39c12;
            }
            .status-Dang-van-chuyen {
                background-color: #3498db;
            }
            .status-Da-giao-hang {
                background-color: #27ae60;
            }
            .status-Huy {
                background-color: #e74c3c;
            }
            .status-Chua-thanh-toan {
                background-color: #9b59b6;
            }

            #statusSelect {
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 5px;
                color: black;
            }
        </style>

    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">
                <%
                    com.diemxua.model.Orders order = (com.diemxua.model.Orders) request.getAttribute("order");
                    com.diemxua.model.Address address = (com.diemxua.model.Address) request.getAttribute("address");
                    List<com.diemxua.model.OrderDetails> orderDetails = (List<com.diemxua.model.OrderDetails>) request.getAttribute("orderDetails");
                    List<com.diemxua.model.Product> products = (List<com.diemxua.model.Product>) request.getAttribute("products");
                    String totalPrice = (String) request.getAttribute("totalPrice");
                %>
                <div class="section">
                    <div class="sidebar-header">
                        <a href="AdminOrderServlet" class="back-button1" title="Quay lại trang trước">
                            ← Quay lại
                        </a>
                    </div>
                    <h3>📝 Chi tiết Đơn hàng #<span id="orderId"><%= order.getOrderId() %></span></h3>

                    <div class="info-cards">
                        <div class="card">
                            <h4>Trạng thái & Thời gian</h4>
                            <p><strong>Trạng thái:</strong> 
                            <form action="AdminUpdateOrderStatusServlet" method="POST" style="display:inline-block; color: black">
                                <input type="hidden" name="orderID" value="<%= order.getOrderId() %>">
                                <select name="status" id="statusSelect" class="status-badge text-black" onchange="this.form.submit()">
                                    <option style="color: black" value="Cho-xac-nhan" <% if("Cho-xac-nhan".equals(order.getStatus())) { %>selected<% } %>>Chờ xác nhận</option>
                                    <option style="color: black" value="Dang-van-chuyen" <% if("Dang-van-chuyen".equals(order.getStatus())) { %>selected<% } %>>Đang vận chuyển</option>
                                    <option style="color: black" value="Da-giao-hang" <% if("Da-giao-hang".equals(order.getStatus())) { %>selected<% } %>>Đã giao hàng</option>
                                    <option style="color: black" value="Huy" <% if("Huy".equals(order.getStatus())) { %>selected<% } %>>Hủy</option>
                                    <option style="color: black" value="Chua-thanh-toan" <% if("Chua-thanh-toan".equals(order.getStatus())) { %>selected<% } %>>Chưa thanh toán</option>
                                </select>
                            </form>                            
                            </p>
                            <p><strong>Ngày Đặt:</strong> <span id="orderDate"><%= order.getOrderDate() %></span></p>
                            <p><strong>Ngày Tạo HĐ:</strong> <span id="createAt"><%= order.getDateSend() %></span></p>
                        </div>

                        <div class="card">
                            <h4>Vận chuyển & Thanh toán</h4>
                            <p><strong>Vận chuyển:</strong> <span id="shipMethod"><%= order.getShipMethod() %></span></p>
                            <p><strong>Thanh toán:</strong> <span id="paymentMethod"><%= order.getPaymentMethod() %></span></p>
                        </div>

                        <div class="card">
                            <h4>Thông tin Khách hàng</h4>
                            <p><strong>User ID:</strong> <span id="userId"><%= order.getUserId() %></span></p>
                            <p><strong>Tên KH:</strong><%= address.getRecipientName() %></p>
                            <p><strong>SĐT:</strong><%= address.getPhone() %></p>
                            <p><strong>Địa chỉ:</strong><%= address.getAddressDetail()+", " + address.getCity()+ ", " + address.getCountry() %></p>
                        </div>
                    </div>
                </div>

                <div class="section">
                    <h3>📦 Sản phẩm trong Đơn hàng</h3>

                    <table class="order-detail-table">
                        <thead>
                            <tr>
                                <th>Mã Chi tiết HĐ</th>
                                <th>Mã SP</th>
                                <th>Tên Sản phẩm</th>
                                <th>Size</th>
                                <th>Số lượng</th>
                                <th>Giá/SP (VND)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i=0;i < Math.min(orderDetails.size(), products.size()); i++){
                                    com.diemxua.model.OrderDetails od = orderDetails.get(i);
                                    com.diemxua.model.Product p = products.get(i);
                            %>
                            <tr>
                                <td><%= od.getOrderDetailID() %></td>
                                <td><%= p.getProductID() %></td>
                                <td><%= p.getProductName()%></td>
                                <td><%= od.getSize()%></td>
                                <td><%= od.getQuantity()%></td>
                                <td><%= p.getFormatPrice()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" style="text-align: right;">Tổng Cộng (Total Price):</td>
                                <td id="totalPrice"><%= totalPrice%></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>
        </div>
        <script>
            function updateStatusColor() {
                const select = document.getElementById("statusSelect");
                const value = select.value;
                select.className = 'status-badge text-black';
                switch (value) {
                    case 'Cho-xac-nhan':
                        select.classList.add('status-Cho-xac-nhan');
                        break;
                    case 'Dang-van-chuyen':
                        select.classList.add('status-Dang-van-chuyen');
                        break;
                    case 'Da-giao-hang':
                        select.classList.add('status-Da-giao-hang');
                        break;
                    case 'Huy':
                        select.classList.add('status-Huy');
                        break;
                    case 'Chua-thanh-toan':
                        select.classList.add('status-Chua-thanh-toan');
                        break;
                }
            }
            window.onload = updateStatusColor;
            document.getElementById("statusSelect").addEventListener("change", updateStatusColor);
        </script>

    </body>
</html>
