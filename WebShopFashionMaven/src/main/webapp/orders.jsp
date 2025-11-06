<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Orders, com.diemxua.model.Product, java.util.ArrayList, com.diemxua.model.OrderDetails" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Diễm Xưa Shop</title>
        <link rel="icon" type="image/png" href="images/watermark2.png">        
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>
    <style>
        .status-button.active {
            background-color: #fdf8f3;
            border: 1px solid #492910;
        }

        .filter-scroll-container::-webkit-scrollbar {
            display: none;
        }
        .filter-scroll-container {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>

    <body>
        <%!
            String normalizeStatus(String status) {
                if (status == null) return "";
                String lowerStatus = status.toLowerCase();
                if (lowerStatus.contains("chờ xác nhận")) return "Cho-xac-nhan";
                if (lowerStatus.contains("đang vận chuyển")) return "Dang-van-chuyen";
                if (lowerStatus.contains("đã giao hàng")) return "Da-giao-hang";
                if (lowerStatus.contains("chưa thanh toán")) return "Chua-thanh-toan";
                if (lowerStatus.contains("đã hủy")) return "Da-huy";
                return ""; 
            }
        %>

        <%@include file="navbar.jsp" %>
        <section>
            <%
                ArrayList<com.diemxua.model.Orders> listOrders = (ArrayList<com.diemxua.model.Orders>) request.getAttribute("listOrders");
                ArrayList<ArrayList<com.diemxua.model.Product>> listProducts = (ArrayList<ArrayList<com.diemxua.model.Product>>) request.getAttribute("listProducts");
                ArrayList<ArrayList<com.diemxua.model.OrderDetails>> listOrderDetails = ( ArrayList<ArrayList<com.diemxua.model.OrderDetails>>) request.getAttribute("listOrderDetails");
            %>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />
            <div class="absolute top-[80px] md:top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 items-stretch pb-20">
                    <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-8 shadow relative z-10">
                        <h1 class ="text-xl sm:text-2xl font-bold font-semibold mb-4">Đơn hàng của tôi</h1>

                        <div class="flex overflow-x-auto filter-scroll-container whitespace-nowrap justify-start md:justify-around
                             font-bold text-sm sm:text-lg bg-[#f8f6ef]/80 px-2 py-1 leading-height rounded-xl gap-2" id="status-filter">

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

                    <% if (listOrders != null && !listOrders.isEmpty()) {
                        for(int i = 0; i< listOrders.size(); i++){
                            com.diemxua.model.Orders indexOrder = listOrders.get(i);
                            
                            String normalizedStatus = normalizeStatus(indexOrder.getStatus());
                            
                            ArrayList<com.diemxua.model.Product> indexProduct = (listProducts != null && i < listProducts.size()) ? listProducts.get(i) : null;
                            ArrayList<com.diemxua.model.OrderDetails> indexOrderDetail = (listOrderDetails != null && i < listOrderDetails.size()) ? listOrderDetails.get(i) : null;
                    %>

                    <div class="order-card bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-6 shadow relative z-10" data-status="<%= indexOrder.getStatus() %>">
                        <div class="flex justify-between items-center text-start mx-2 sm:mx-6 mb-2">
                            <div class="flex text-start gap-2 items-center">
                                <i data-lucide="shopping-bag" class="size-4 sm:size-5"></i>
                                <h2 class="text-sm sm:text-base text-start font-medium">OrderID-<%= indexOrder.getOrderId() %></h2>
                            </div>
                            <span class="text-xs sm:text-sm font-semibold text-[#492910]"><%= indexOrder.getStatus() %></span>
                        </div>

                        <%
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
            const activeClasses = ['active'];

            function filterOrders(status) {
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
                    button.classList.remove(...activeClasses);
                });
                clickedButton.classList.add(...activeClasses);
                const selectedStatus = clickedButton.dataset.status;
                filterOrders(selectedStatus);
            }

            statusButtons.forEach(button => {
                button.addEventListener('click', function () {
                    updateActiveButton(this);
                });
            });

            window.onload = function () {
                const defaultButton = document.querySelector('#status-filter button[data-status="all"]');
                if (defaultButton) {
                    updateActiveButton(defaultButton);
                }
            };
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>