<%-- 
    Document   : admin_sidebar
    Created on : Oct 25, 2025, 5:19:41 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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

            /* Style cho nút Back */
            .back-button {
                display: inline-block;
                color: #ecf0f1; /* Light color */
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 5px;
                font-size: 0.9em;
                transition: background-color 0.2s;
                /* Đặt nút ở góc trái trên cùng */
                margin-left: -10px; /* Di chuyển nhẹ sang trái */
            }

            .back-button:hover {
                background-color: #34495e; /* Màu hover nhẹ */
                color: white;
            }
            .sidebar nav ul li a.active {
                background-color: #1abc9c; /* Màu nổi bật khi chọn */
                color: white;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <div class="sidebar-header">
                <a href="home.jsp" class="back-button" title="Quay lại trang trước">
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

        <script>
            window.onload = function () {
                const currentPage = location.pathname.split("/").pop();
                document.querySelectorAll(".sidebar nav ul li a").forEach(a => {
                    if (a.getAttribute("href") === currentPage) {
                        a.classList.add("active");
                    }
                });
            };
        </script>
    </body>
</html>
