<%-- 
    Document   : admin_order
    Created on : Oct 25, 2025, 5:42:45 PM
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
        <title>Order List Dashboard</title>
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

            /* --- Order List Table Styling --- */
            .order-list-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }
            .order-list-table th, .order-list-table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
                font-size: 0.95em;
            }
            .order-list-table th {
                background-color: #e74c3c; /* Red header */
                color: white;
                font-weight: bold;
                text-transform: uppercase;
            }
            .order-list-table tr:nth-child(even) {
                background-color: #fef0f0; /* Light red/pink stripe */
            }
            .order-list-table td a {
                color: #2c3e50;
                font-weight: bold;
                cursor: pointer;
                text-decoration: none;
            }
            .order-list-table td a:hover {
                color: #3498db;
                text-decoration: underline;
            }

            /* Status Badges */
            .status-badge {
                padding: 4px 8px;
                border-radius: 4px;
                font-weight: 600;
                font-size: 0.85em;
                color: white;
                white-space: nowrap; /* Keep badge on one line */
            }
            .status-pending {
                background-color: #f39c12;
            } /* Orange */
            .status-processing {
                background-color: #3498db;
            } /* Blue */
            .status-shipping {
                background-color: #2ecc71;
            } /* Green */
            .status-delivered {
                background-color: #27ae60;
            } /* Dark Green */
            .status-cancelled {
                background-color: #c0392b;
            } /* Dark Red */
            .status-badge {
                display:inline-block;
                padding:4px 8px;
                border-radius:6px;
                font-size:0.9em;
                color:white;
                font-weight:bold;
                text-align:center;
            }

            /* Màu theo trạng thái */
            .status-cho-xac-nhan {
                background-color:#f39c12;
            } /* cam */
            .status-dang-giao-hang {
                background-color:#3498db;
            } /* xanh dương */
            .status-da-giao {
                background-color:#2ecc71;
            }       /* xanh lá */
            .status-huy {
                background-color:#e74c3c;
            }           /* đỏ */
            .status-chua-thanh-toan {
                background-color:#9b59b6;
            }      /* tím */

        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">

                <div id="order-list-section" class="section">
                    <h3>📋 Danh sách Đơn hàng</h3>
                    <%
                        List<com.diemxua.model.Orders> orders = (List<com.diemxua.model.Orders>) request.getAttribute("orders");

                    %>

                    <table class="order-list-table">
                        <thead>
                            <tr>
                                <th>Mã HĐ</th>
                                <th>Ngày Đặt</th>
                                <th>Khách hàng (User ID)</th>
                                <th>Trạng thái</th>
                                <th>PT Thanh toán</th>
                                <th>Tổng tiền (VND)</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(com.diemxua.model.Orders o : orders){
                            %>
                            <tr>
                                <td><%= o.getOrderId()%></td>
                                <td><%= o.getOrderDate() %></td>
                                <td><%= o.getUserId() %></td>
                                <td>
                                    <%
                                        String status = o.getStatus();
                                        String statusClass = "";
                                        String displayText = "";

                                        switch(status) {
                                            case "Cho-xac-nhan":
                                                statusClass = "status-cho-xac-nhan";
                                                displayText = "Chờ Xác Nhận";
                                                break;
                                            case "Dang-van-chuyen":
                                                statusClass = "status-dang-giao-hang";
                                                displayText = "Đang Vận Chuyển";
                                                break;
                                            case "Da-giao-hang":
                                                statusClass = "status-da-giao";
                                                displayText = "Đã Giao hàng";
                                                break;
                                            case "Huy":
                                                statusClass = "status-huy";
                                                displayText = "Hủy";
                                                break;
                                            case "Chua-thanh-toan":
                                                statusClass = "status-chua-thanh-toan";
                                                displayText = "Chưa thanh toán";
                                                break;
                                            default:
                                                statusClass = "status-cho-xac-nhan";
                                                displayText = status; 
                                        }
                                    %>
                                    <span class="status-badge <%= statusClass %>"><%= displayText %></span>
                                </td>

                                <td><%= o.getPaymentMethod() %></td>
                                <td><%= o.getFormatPrice() %></td>
                                <td><a href="AdminOrderDetailServlet?orderID=<%= o.getOrderId() %>">Xem</a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <p style="margin-top: 25px; text-align: right; color: #555;">Tổng số đơn hàng: **<%= orders.size() %>** </p>
                </div>

            </div>
        </div>

    </body>
</html>
