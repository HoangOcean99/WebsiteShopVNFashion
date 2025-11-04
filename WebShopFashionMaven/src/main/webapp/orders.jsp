<%--
    Document : orders
    Created on : Nov 5, 2025
    Author : Admin (Đã được tối ưu hóa bởi Gemini)
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Orders, com.diemxua.model.Product, java.util.ArrayList, com.diemxua.model.OrderDetails" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Đơn hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>
    <style>
        /* Tùy chỉnh CSS cho trạng thái Active */
        .status-button.active {
            background-color: #fdf8f3; /* Màu nền nhạt */
            border: 1px solid #492910; /* Border đậm */
        }

        /* Ẩn thanh cuộn trên các trình duyệt */
        .filter-scroll-container::-webkit-scrollbar {
            display: none;
        }
        .filter-scroll-container {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>

    <body>
        <%-- Helper để chuẩn hóa trạng thái từ DB sang format dùng cho data-status --%>
        <%!
            String normalizeStatus(String status) {
                if (status == null) return "";
                String lowerStatus = status.toLowerCase();
                if (lowerStatus.contains("chờ xác nhận")) return "Cho-xac-nhan";
                if (lowerStatus.contains("đang vận chuyển")) return "Dang-van-chuyen";
                if (lowerStatus.contains("đã giao hàng")) return "Da-giao-hang";
                if (lowerStatus.contains("chưa thanh toán")) return "Chua-thanh-toan";
                if (lowerStatus.contains("đã hủy")) return "Da-huy";
                return ""; // Mặc định trả về rỗng nếu không khớp
            }
        %>

        <%@include file="navbar.jsp" %>
        <section>
            <%
                // Lấy dữ liệu từ Request
                ArrayList<com.diemxua.model.Orders> listOrders = (ArrayList<com.diemxua.model.Orders>) request.getAttribute("listOrders");
                ArrayList<ArrayList<com.diemxua.model.Product>> listProducts = (ArrayList<ArrayList<com.diemxua.model.Product>>) request.getAttribute("listProducts");
                ArrayList<ArrayList<com.diemxua.model.OrderDetails>> listOrderDetails = ( ArrayList<ArrayList<com.diemxua.model.OrderDetails>>) request.getAttribute("listOrderDetails");
            %>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />
            <div class="absolute top-[80px] md:top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 items-stretch pb-20">
                    <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-8 shadow relative z-10">
                        <h1 class ="text-xl sm:text-2xl font-bold font-semibold mb-4">Đơn hàng của tôi</h1>

                        <%-- Bộ lọc Trạng thái (Tối ưu độ cân đối) --%>
                        <div class="flex overflow-x-auto filter-scroll-container whitespace-nowrap justify-start md:justify-around
                             font-bold text-sm sm:text-lg bg-[#f8f6ef]/80 px-2 py-1 leading-height rounded-xl gap-2" id="status-filter">

                            <%-- Nút TẤT CẢ (Đặt mặc định active) --%>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="all">
                                Tất cả
                            </button>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="Cho-xac-nhan">
                                Chờ xác nhận
                            </button>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="Dang-van-chuyen">
                                Đang vận chuyển
                            </button>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="Da-giao-hang">
                                Đã giao
                            </button>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="Chua-thanh-toan">
                                Chưa thanh toán
                            </button>
                            <button class="status-button flex-shrink-0 hover:bg-[#ffffff]/80 px-4 py-1 rounded-xl leading-height"
                                    data-status="Da-huy">
                                Đã hủy
                            </button>
                        </div>
                    </div>

                    <%-- Danh sách đơn hàng --%>
                    <% if (listOrders != null && !listOrders.isEmpty()) {
                        for(int i = 0; i< listOrders.size(); i++){
                            com.diemxua.model.Orders indexOrder = listOrders.get(i);
                            
                            // Lấy trạng thái đã được chuẩn hóa để lọc bằng JS
                            String normalizedStatus = normalizeStatus(indexOrder.getStatus());
                            
                            // Đảm bảo listProducts và listOrderDetails không bị NullPointerException
                            ArrayList<com.diemxua.model.Product> indexProduct = (listProducts != null && i < listProducts.size()) ? listProducts.get(i) : null;
                            ArrayList<com.diemxua.model.OrderDetails> indexOrderDetail = (listOrderDetails != null && i < listOrderDetails.size()) ? listOrderDetails.get(i) : null;
                    %>

                    <%-- Thẻ Order Card --%>
                    <div class="order-card bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-6 shadow relative z-10" data-status="<%= indexOrder.getStatus() %>">
                        <div class="flex justify-between items-center text-start mx-2 sm:mx-6 mb-2">
                            <div class="flex text-start gap-2 items-center">
                                <i data-lucide="shopping-bag" class="size-4 sm:size-5"></i>
                                <h2 class="text-sm sm:text-base text-start font-medium">OrderID-<%= indexOrder.getOrderId() %></h2>
                            </div>
                            <span class="text-xs sm:text-sm font-semibold text-[#492910]"><%= indexOrder.getStatus() %></span>
                        </div>

                        <%
                            // Hiển thị danh sách sản phẩm trong đơn hàng
                            if(indexProduct!=null && indexOrderDetail!=null){
                            for(int j = 0; j< Math.min(indexProduct.size(),indexOrderDetail.size()) ; j++){
                                com.diemxua.model.Product product = indexProduct.get(j);
                                com.diemxua.model.OrderDetails orderDetail = indexOrderDetail.get(j);
                        %>
                        <div class="flex gap-4 sm:gap-[20px] p-2 sm:p-4 border-t border-[#4B2E17]/20 mx-2 sm:mx-6">
                            <img src="<%= product.getImageProduct1() %>" alt="<%= product.getProductName()%>" class="w-16 h-16 sm:w-20 sm:h-20 bg-gray-400 rounded-lg object-cover flex-shrink-0" />
                            <div class="grow block text-left">
                                <p class="text-base sm:text-lg font-bold pb-1"><%= product.getProductName() %> </p>
                                <p class="text-sm sm:text-base pb-1"> <%= product.getFormatPrice() %>đ x<%= orderDetail.getQuantity()%></p>
                                <div class="flex gap-4">
                                    <p class="border border-gray-300 rounded-full px-2 py-0.5 text-xs sm:text-sm focus:outline-none">
                                        <span class="font-semibold">Size:</span> <%= orderDetail.getSize()%>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <% } } %>

                        <%-- Tổng tiền và nút Chi tiết --%>
                        <div class="flex justify-between items-center mt-4 pt-4 border-t border-[#4B2E17]/20 mx-2 sm:mx-6">
                            <h1 class="text-lg sm:text-xl font-bold text-center ">Tổng cộng: <%= indexOrder.getFormatPrice() %>đ</h1>
                            <div>
                                <button class=" w-fit text-center font-bold border border-[#492910]/60 rounded-xl px-3 py-1 sm:px-4 sm:py-2
                                        hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                        focus:outline-none focus:ring-1 focus:ring-[#492910] cursor-pointer text-sm sm:text-base" 
                                        onclick="window.location.href = 'OrderDetailServlet?OrderID=<%= indexOrder.getOrderId()%>'">
                                    Chi tiết
                                </button>
                            </div>
                        </div>
                    </div>
                    <% } } else {%>

                    <%-- Không có đơn hàng --%>
                    <div class="text-center text-xl font-semibold p-6 bg-[#fdf8f3]/90 rounded-2xl shadow">
                        Bạn chưa có đơn hàng nào
                    </div>
                    <% } %>
                </div>
            </div>
        </section>

        <script>
            lucide.createIcons();

            const statusButtons = document.querySelectorAll('#status-filter .status-button');
            // Định nghĩa các class cần thiết cho trạng thái active
            const activeClasses = ['active'];

            function filterOrders(status) {
                // Đảm bảo tất cả các thẻ order-card hiển thị đúng cấu trúc (block)
                document.querySelectorAll('.order-card').forEach(card => {
                    const cardStatus = card.dataset.status;

                    if (status === 'all' || cardStatus === status) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            }

            function updateActiveButton(clickedButton) {
                statusButtons.forEach(button => {
                    // Loại bỏ lớp active khỏi tất cả các nút
                    button.classList.remove(...activeClasses);
                });

                // Thêm lớp active cho nút được click
                clickedButton.classList.add(...activeClasses);

                const selectedStatus = clickedButton.dataset.status;
                filterOrders(selectedStatus);
            }

            // Gán sự kiện click cho các nút lọc
            statusButtons.forEach(button => {
                button.addEventListener('click', function () {
                    updateActiveButton(this);
                });
            });

            // Thực thi khi trang được tải xong
            window.onload = function () {
                // Mặc định chọn nút "Tất cả" khi tải trang
                const defaultButton = document.querySelector('#status-filter button[data-status="all"]');
                if (defaultButton) {
                    // Thiết lập trạng thái active và lọc
                    updateActiveButton(defaultButton);
                }
            };
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>