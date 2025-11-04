<%-- 
    Document : admin_sidebar
    Created on : Oct 25, 2025, 5:19:41 PM
    Author : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Sidebar</title>
        <style>
            /* === BASE STYLES & MOBILE FIRST (Fixed/Hidden) === */
            .sidebar {
                width: 250px;
                background-color: #2c3e50;
                color: white;
                padding: 20px 0;
                box-shadow: 2px 0 5px rgba(0,0,0,0.1);

                /* Mặc định trên Mobile: Cố định và ẩn */
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                z-index: 1000;
                transform: translateX(-250px);
                transition: transform 0.3s ease-in-out;
            }
            .sidebar.open {
                transform: translateX(0);
                box-shadow: 2px 0 5px rgba(0,0,0,0.4);
            }

            /* Style Menu Items (Giữ nguyên) */
            .sidebar h2 {
                text-align: center;
                margin-bottom: 30px;
                margin-top: 15px;
                color: #ecf0f1;
            }
            .sidebar nav ul {
                list-style: none;
                padding: 0;
            }
            .sidebar nav ul li a {
                display: block;
                padding: 12px 20px;
                color: #ecf0f1;
                text-decoration: none;
                font-size: 1em;
                transition: background-color 0.2s, padding-left 0.2s;
            }
            .sidebar nav ul li a:hover {
                background-color: #34495e;
                padding-left: 25px;
            }
            .sidebar nav ul li a.active {
                background-color: #1abc9c;
                color: white;
                font-weight: bold;
            }

            /* Header và nút Back */
            .sidebar-header {
                padding: 0 20px;
            }
            .back-button {
                display: inline-block;
                color: #ecf0f1;
                text-decoration: none;
                padding: 8px 12px;
                border-radius: 5px;
                font-size: 0.9em;
                transition: background-color 0.2s;
                margin-left: -10px;
            }
            .back-button:hover {
                background-color: #34495e;
            }


            /* Nút Toggle (Hamburger) - Chỉ hiển thị trên mobile */
            .menu-toggle {
                display: block;
                position: fixed;
                top: 10px;
                left: 10px;
                z-index: 1001;
                background: #2c3e50;
                color: white;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 1.2em;
            }

            /* === DESKTOP STYLES (Min-width: 769px) === */
            @media (min-width: 769px) {

                /* Sidebar nằm trong luồng tài liệu (Flexbox) */
                .sidebar {
                    position: static; /* Khóa fixed */
                    height: auto; /* Chiều cao tự co theo nội dung (hoặc 100vh nếu cần) */
                    min-height: 100vh; /* Đảm bảo nó cao hết màn hình */
                    transform: translateX(0); /* Luôn hiển thị */
                    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
                    /* Thiết lập kích thước tĩnh để đẩy nội dung */
                    flex-shrink: 0;
                    width: 250px;
                }

                /* Ẩn nút toggle trên Desktop */
                .menu-toggle {
                    display: none;
                }
            }
        </style>
    </head>
    <body>

        <button class="menu-toggle" id="menu-toggle">☰ Menu</button>

        <div class="sidebar" id="admin-sidebar">
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

        <script>
            // Logic Javascript cho Mobile Toggle
            const sidebar = document.getElementById('admin-sidebar');
            const toggleButton = document.getElementById('menu-toggle');

            // Hàm kiểm tra xem có ở Mobile không (<= 768px)
            function isMobileView() {
                return window.innerWidth <= 768;
            }

            // Toggle sidebar khi nhấn nút
            toggleButton.addEventListener('click', function () {
                sidebar.classList.toggle('open');
            });

            // Đóng sidebar khi click vào bất kỳ liên kết nào (chỉ áp dụng cho mobile)
            document.querySelectorAll('.sidebar nav ul li a').forEach(link => {
                link.addEventListener('click', function () {
                    if (isMobileView()) {
                        sidebar.classList.remove('open');
                    }
                });
            });

            // Logic đánh dấu Active Link
            window.onload = function () {
                const pathParts = location.pathname.split("/");
                const currentPage = pathParts[pathParts.length - 1];

                document.querySelectorAll(".sidebar nav ul li a").forEach(a => {
                    const linkHref = a.getAttribute("href");
                    if (linkHref && linkHref.split("/").pop() === currentPage) {
                        a.classList.add("active");
                    }
                });
            };
        </script>
    </body>
</html>