<%-- 
    Document   : orders
    Created on : Oct 12, 2025, 5:01:16 PM
    Author     : Admin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Orders, com.diemxua.model.Product, java.util.ArrayList, com.diemxua.model.OrderDetails" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>
    <style>
        .status-button.active {
            background-color: #fdf8f3cc;
            border: 1px solid #492910;
        }
    </style>

    <body>
        <%@include file="navbar.jsp" %>
        <section>
            <%
                ArrayList<com.diemxua.model.Orders> listOrders = (ArrayList<com.diemxua.model.Orders>) request.getAttribute("listOrders");
                ArrayList<ArrayList<com.diemxua.model.Product>> listProducts = (ArrayList<ArrayList<com.diemxua.model.Product>>) request.getAttribute("listProducts");
                ArrayList<ArrayList<com.diemxua.model.OrderDetails>> listOrderDetails = ( ArrayList<ArrayList<com.diemxua.model.OrderDetails>>) request.getAttribute("listOrderDetails");

            %>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />
            <div class="absolute top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-4/5 mx-auto items-stretch">
                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-8 shadow relative z-10">
                        <h1 class ="text-2xl font-bold font-semibold">Đơn hàng</h1>
                        <div class="flex justify-around font-bold text-xl bg-[#f8f6ef]/60 px-2 py-1 leading-height rounded-xl" id="status-filter">
                            <button class="status-button active
                                    hover:bg-[#ffffff]/80 px-20 py-1 rounded-xl leading-height"
                                    data-status="Cho-xac-nhan">
                                Chờ xác nhận
                            </button>
                            <button class="status-button hover:bg-[#ffffff]/80 px-20 py-1 rounded-xl leading-height"
                                    data-status="Dang-van-chuyen">
                                Đang vận chuyển
                            </button>
                            <button class="status-button hover:bg-[#ffffff]/80 px-20 py-1 rounded-xl leading-height"
                                    data-status="Da-giao-hang">
                                Đã giao
                            </button>
                            <button class="status-button
                                    hover:bg-[#ffffff]/80 px-20 py-1 rounded-xl leading-height"
                                    data-status="Chua-thanh-toan">
                                Chưa thanh toán
                            </button>
                            <button class="status-button hover:bg-[#ffffff]/80 px-20 py-1 rounded-xl leading-height"
                                    data-status="Da-huy">
                                Đã hủy
                            </button>
                        </div>
                    </div>

                    <% if (listOrders != null && !listOrders.isEmpty()) {
                        for(int i = 0; i< listOrders.size(); i++){
                            com.diemxua.model.Orders indexOrder = listOrders.get(i);
                            ArrayList<com.diemxua.model.Product> indexProduct = listProducts.get(i);
                            ArrayList<com.diemxua.model.OrderDetails> indexOrderDetail = listOrderDetails.get(i);
                    %>
                    <div class="order-card bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10" data-status="<%= indexOrder.getStatus() %>">
                        <div class="flex justify-start text-start mx-6"> 
                            <div class="flex text-start gap-2">
                                <i data-lucide="shopping-bag" class="size-5"></i>
                                <h2 class="text-sm text-start">OrderID-<%= indexOrder.getOrderId() %></h2>
                            </div>
                        </div>
                        <%
                            if(indexProduct!=null && indexOrderDetail!=null){
                            for(int j = 0; j< Math.min(indexProduct.size(),indexOrderDetail.size()) ; j++){
                                com.diemxua.model.Product product = indexProduct.get(j);
                                com.diemxua.model.OrderDetails orderDetail = indexOrderDetail.get(j);
                        %>
                        <div class="flex gap-[20px] p-4 border border-[#4B2E17]-2000 rounded-lg m-6">
                            <img src="<%= product.getImageProduct1() %>" alt="<%= product.getProductName()%>" class="w-15 h-32 bg-gray-400 rounded-2xl" />
                            <div class="grow block">
                                <p class="text-2xl font-bold pb-2"><%= product.getProductName() %> </p>
                                <p class="text-xl pb-2"> <%= product.getFormatPrice() %>đ x<%= orderDetail.getQuantity()%></p>
                                <div class="flex gap-6">
                                    <button class="flex space-x-3 ">
                                        <p class="border border-gray-300 rounded-full py-1 text-sm focus:outline-none">
                                            <span class="font-semibold">Size:</span> <%= orderDetail.getSize()%>
                                        </p>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <% } } %>

                        <div class="flex justify-between items-center ml-6 mr-6">
                            <h1 class="text-xl font-bold text-center ">Total: <%= indexOrder.getFormatPrice() %>đ</h1>
                            <div onclick="window.location.href = 'OrderDetailServlet?OrderID=<%= indexOrder.getOrderId() %>'">
                                <button class=" w-fit text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-1
                                        hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                        focus:outline-none focus:ring-1 focus:ring-[#492910] cursor-pointer" 
                                        onclick="window.location.href = 'OrderDetailServlet?OrderID=<%= indexOrder.getOrderId()%>'">
                                    Detail
                                </button>
                            </div>
                        </div>
                    </div>
                    <% } } else {%>
                    <div class="text-center text-xl font-semibold p-6">
                        Bạn chưa có đơn hàng nào
                    </div>
                    <% } %>
                </div>
            </div>
        </section>
    </body>
    <script>
        lucide.createIcons();
    </script>
    <script>
        const statusButtons = document.querySelectorAll('#status-filter .status-button');

        const activeClasses = ['active', 'bg-[#fdf8f3]/80', 'ring-1', 'ring-[#492910]'];
        function filterOrders(status) {
            document.querySelectorAll('.order-card').forEach(card => {
                card.style.display =
                        (status === 'all' || card.dataset.status === status)
                        ? 'block'
                        : 'none';
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
            const defaultButton = document.querySelector('#status-filter .status-button.active');
            if (defaultButton) {
                defaultButton.classList.add(...activeClasses);
                filterOrders(defaultButton.dataset.status);
            }
        };
    </script>
</html>
