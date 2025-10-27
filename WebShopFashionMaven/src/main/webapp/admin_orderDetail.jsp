<%-- 
    Document   : admin_orderDetail
    Created on : Oct 25, 2025, 5:43:03 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">

                <div class="section">
                    <div class="sidebar-header">
                        <a href="javascript:history.back()" class="back-button1" title="Quay lại trang trước">
                            ← Quay lại
                        </a>
                    </div>
                    <h3>📝 Chi tiết Đơn hàng #<span id="orderId">O10085</span></h3>

                    <div class="info-cards">
                        <div class="card">
                            <h4>Trạng thái & Thời gian</h4>
                            <p><strong>Trạng thái:</strong> 
                                <span id="status" class="status-badge status-shipping">Đang Giao hàng</span>
                            </p>
                            <p><strong>Ngày Đặt:</strong> <span id="orderDate">2025-10-25</span></p>
                            <p><strong>Ngày Tạo HĐ:</strong> <span id="createAt">2025-10-25 10:30 AM</span></p>
                        </div>

                        <div class="card">
                            <h4>Vận chuyển & Thanh toán</h4>
                            <p><strong>Vận chuyển:</strong> <span id="shipMethod">Giao hàng Tiêu chuẩn</span></p>
                            <p><strong>Thanh toán:</strong> <span id="paymentMethod">COD (Thanh toán khi nhận hàng)</span></p>
                            <p><strong>Địa chỉ ID:</strong> <span id="addressId">A901</span></p>
                            <p><strong>Ghi chú:</strong> <span id="Note">Gọi trước 30 phút khi giao.</span></p>
                        </div>

                        <div class="card">
                            <h4>Thông tin Khách hàng</h4>
                            <p><strong>User ID:</strong> <span id="userId">U5543</span></p>
                            <p><strong>Tên KH:</strong> Nguyễn Văn An</p>
                            <p><strong>SĐT:</strong> 090xxxx999</p>
                            <p><strong>Địa chỉ:</strong> Số 10, Đường ABC, Phường 2, TP.HCM</p>
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
                                <th>Chi tiết SP (Size)</th>
                                <th>Số lượng</th>
                                <th>Giá/SP (VND)</th>
                                <th>Thành tiền (VND)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>OD2001</td>
                                <td>P105</td>
                                <td>Áo Sơ Mi Linen Cao Cấp</td>
                                <td>PD105M (M)</td>
                                <td>1</td>
                                <td>499,000</td>
                                <td>499,000</td>
                            </tr>
                            <tr>
                                <td>OD2002</td>
                                <td>P210</td>
                                <td>Quần Jeans Slim Fit Xám</td>
                                <td>PD210_27 (27)</td>
                                <td>2</td>
                                <td>750,000</td>
                                <td>1,500,000</td>
                            </tr>
                            <tr>
                                <td>OD2003</td>
                                <td>P098</td>
                                <td>Áo Hoodie Cotton Xanh</td>
                                <td>PD098L (L)</td>
                                <td>1</td>
                                <td>320,000</td>
                                <td>320,000</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" style="text-align: right;">Tổng Cộng (Total Price):</td>
                                <td id="totalPrice">2,319,000</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>
        </div>

    </body>
</html>
