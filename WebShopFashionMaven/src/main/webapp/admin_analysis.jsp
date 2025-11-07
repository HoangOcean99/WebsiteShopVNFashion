<%-- 
    Document   : admin_analysis
    Created on : Oct 25, 2025, 5:43:26 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Purchase Analytics Dashboard</title>
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
                display: none; /* Hidden by default, controlled by JS */
            }
            h3 {
                color: #27ae60; /* Green tone for Analytics */
                font-size: 1.8em;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 3px solid #27ae60;
            }

            /* --- Stats Cards --- */
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }
            .stat-card {
                padding: 20px;
                background-color: #ecf0f1;
                border-radius: 8px;
                border-left: 4px solid #3498db;
            }
            .stat-card p {
                margin: 0;
                font-size: 0.9em;
                color: #555;
            }
            .stat-card strong {
                display: block;
                font-size: 2em;
                color: #2c3e50;
                margin-top: 5px;
            }

            /* --- Table Styling --- */
            .data-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            .data-table th, .data-table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
                font-size: 0.95em;
            }
            .data-table th {
                background-color: #34495e;
                color: white;
                font-weight: bold;
                text-transform: uppercase;
            }
            .data-table tr:nth-child(even) {
                background-color: #f4f6f9;
            }

            /* --- Chart Placeholder --- */
            .chart-placeholder {
                height: 300px;
                background-color: #f9f9f9;
                border: 1px dashed #ccc;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #777;
                font-style: italic;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>
            <div class="sidebar">
                <h2>📈 Phân tích Mua hàng</h2>
                <nav>
                    <ul>
                        <li><a href="#" id="link-category" class="active" onclick="showAnalyticsSection('category-analysis-section')">Theo Loại Sản phẩm</a></li>
                        <!--<li><a href="#" id="link-time" onclick="showAnalyticsSection('time-analysis-section')">Theo Thời gian</a></li>-->
                    </ul>
                </nav>
            </div>

            <div class="main-content">
                <% String finalPrice = (String) request.getAttribute("finalPrice");
                    double avarage = Double.parseDouble(request.getAttribute("avarage").toString());
                    String MaxQuantity = (String) request.getAttribute("MaxQuantity");
                %>
                <!-- 1. Phân tích theo Loại Sản phẩm (Category Analysis) -->
                <div id="category-analysis-section" class="section">
                    <h3>Phân tích theo Loại Sản phẩm</h3>

                    <div class="stats-grid">
                        <div class="stat-card">
                            <p>Tổng Doanh thu:</p>
                            <strong><%=finalPrice %></strong>
                        </div>
                        <div class="stat-card" style="border-left-color: #2ecc71;">
                            <p>Danh mục bán chạy nhất</p>
                            <strong><%= MaxQuantity %></strong>
                        </div>
                        <div class="stat-card" style="border-left-color: #e74c3c;">
                            <p>Tỷ lệ chuyển đổi TB</p>
                            <strong><%= avarage%>%</strong>
                        </div>
                    </div>
                    <%
                        Integer p1 = (Integer) request.getAttribute("p1");
                        Integer p2 = (Integer) request.getAttribute("p2");
                        Integer p4 = (Integer) request.getAttribute("p4");
                        
                        String price1 = (String) request.getAttribute("price1");
                        String price2 = (String) request.getAttribute("price2");
                        String price4 = (String) request.getAttribute("price4");
                        
                        String income1 = (String) request.getAttribute("income1");
                        String income2 = (String) request.getAttribute("income2");
                        String income4 = (String) request.getAttribute("income4");
                        
                        Double TL1 = (Double) request.getAttribute("TL1");
                        Double TL2 = (Double) request.getAttribute("TL2");
                        Double TL4 = (Double) request.getAttribute("TL4");    

                    %>
                    <h4>Thống kê chi tiết theo Danh mục</h4>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Danh mục</th>
                                <th>Doanh thu (VND)</th>
                                <th>Tỷ trọng (%)</th>
                                <th>SL Sản phẩm bán</th>
                                <th>Lợi nhuận ước tính</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Giao Lĩnh</td>
                                <td><%= price1 %>đ</td>
                                <td><%= TL1%>%</td>
                                <td><%= p1%></td>
                                <td><%= income1%></td>
                            </tr>
                            <tr>
                                <td>Viên Lĩnh</td>
                                <td><%= price2 %>đ</td>
                                <td><%= TL2%>%</td>
                                <td><%= p2%></td>
                                <td><%= income2%></td>
                            </tr>
                            <tr>
                                <td>Áo Tấc</td>
                                <td><%= price4 %>đ</td>
                                <td><%= TL4%>%</td>
                                <td><%= p4%></td>
                                <td><%= income4%></td>
                            </tr>
                        </tbody>
                    </table>

                    <!--                    <div class="chart-placeholder">
                                            [Placeholder Biểu đồ tròn (Pie Chart) thể hiện Tỷ trọng Doanh thu theo Danh mục]
                                        </div>-->
                </div>

                <!-- 2. Phân tích theo Thời gian (Time Analysis) -->
                <!--                <div id="time-analysis-section" class="section">
                                    <h3>Phân tích Doanh số theo Thời gian (Theo Tuần)</h3>
                
                                    <div class="stats-grid">
                                        <div class="stat-card">
                                            <p>Doanh thu Tuần trước</p>
                                            <strong>85.2 Triệu</strong>
                                        </div>
                                        <div class="stat-card" style="border-left-color: #f1c40f;">
                                            <p>Tổng Đơn hàng Tuần này</p>
                                            <strong>250 Đơn</strong>
                                        </div>
                                        <div class="stat-card" style="border-left-color: #9b59b6;">
                                            <p>Giá trị Đơn hàng TB (AOV)</p>
                                            <strong>340,800 VND</strong>
                                        </div>
                                    </div>
                
                                    <h4>Phân tích Doanh thu hàng Tuần</h4>
                                    <table class="data-table">
                                        <thead>
                                            <tr>
                                                <th>Tuần</th>
                                                <th>Tổng Doanh thu (VND)</th>
                                                <th>Tổng Đơn hàng</th>
                                                <th>AOV (VND)</th>
                                                <th>So với Tuần trước</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tuần 43 (2025-10-21)</td>
                                                <td>88,500,000</td>
                                                <td>260</td>
                                                <td>340,384</td>
                                                <td style="color: #27ae60;">+3.8%</td>
                                            </tr>
                                            <tr>
                                                <td>Tuần 42 (2025-10-14)</td>
                                                <td>85,200,000</td>
                                                <td>255</td>
                                                <td>334,117</td>
                                                <td style="color: #c0392b;">-1.5%</td>
                                            </tr>
                                            <tr>
                                                <td>Tuần 41 (2025-10-07)</td>
                                                <td>86,500,000</td>
                                                <td>280</td>
                                                <td>308,928</td>
                                                <td style="color: #27ae60;">+6.2%</td>
                                            </tr>
                                            <tr>
                                                <td>Tuần 40 (2025-09-30)</td>
                                                <td>81,500,000</td>
                                                <td>245</td>
                                                <td>332,653</td>
                                                <td>0%</td>
                                            </tr>
                                        </tbody>
                                    </table>-->

                <!--                    <div class="chart-placeholder">
                                        [Placeholder Biểu đồ đường (Line Chart) thể hiện Doanh thu theo Tuần/Tháng]
                                    </div>-->
                <!--</div>-->

            </div>
        </div>

        <script>
            // JavaScript để xử lý việc chuyển đổi giữa các phần phân tích
            function showAnalyticsSection(sectionId) {
                // Lấy tất cả các phần nội dung và ẩn chúng
                document.querySelectorAll('.section').forEach(section => {
                    section.style.display = 'none';
                });

                // Lấy tất cả các liên kết trong sidebar và bỏ active
                document.querySelectorAll('.sidebar nav ul li a').forEach(link => {
                    link.classList.remove('active');
                });

                // Hiển thị phần nội dung được chọn
                const activeSection = document.getElementById(sectionId);
                if (activeSection) {
                    activeSection.style.display = 'block';
                }

                // Đặt active cho liên kết trong sidebar
                const activeLink = document.getElementById('link-' + sectionId.replace('-analysis-section', ''));
                if (activeLink) {
                    activeLink.classList.add('active');
                }
            }

            // Khởi tạo: Hiển thị trang Phân tích theo Loại Sản phẩm mặc định khi tải trang
            window.onload = function () {
                showAnalyticsSection('category-analysis-section');
            };
        </script>

    </body>
</html>
