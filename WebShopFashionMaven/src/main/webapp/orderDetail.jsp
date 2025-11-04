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
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Chi tiết đơn hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <section>
            <%
                com.diemxua.model.Orders order = (com.diemxua.model.Orders) request.getAttribute("orderDetaill");
                ArrayList<com.diemxua.model.Product> listProducts = (ArrayList<com.diemxua.model.Product>) request.getAttribute("listProducts");
                ArrayList<com.diemxua.model.OrderDetails> listOrderDetails = ( ArrayList<com.diemxua.model.OrderDetails>) request.getAttribute("listOrderDetails");
                com.diemxua.model.Address address  = ( com.diemxua.model.Address) request.getAttribute("address");
            %>

            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

            <div class="relative mt-[100px] md:pt-[60px] pb-10 min-h-screen">
                <div class="grid gap-6 w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 items-stretch">

                    <% if (order != null && address != null) { %>
                    <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-6 shadow relative z-10">
                        <h1 class="text-xl sm:text-2xl font-bold mb-4">Chi tiết Đơn hàng</h1>

                        <div class="flex flex-wrap justify-start sm:justify-between items-center text-sm sm:text-base border-b border-[#492910]/20 pb-3 mb-3 gap-y-2">  
                            <div class="flex items-center gap-2 w-full sm:w-auto">
                                <i data-lucide="shopping-bag" class="size-4 sm:size-5"></i>
                                <h2 class="font-semibold">OrderID-<%= order.getOrderId() %></h2>
                            </div>

                            <div class="w-full sm:w-auto">
                                <p class="text-sm font-medium">Trạng thái: <span class="text-[#492910] font-bold"><%= order.getStatus() %></span></p>
                            </div>

                            <div class="w-full sm:w-auto">
                                <p class="text-sm">Giao hàng dự kiến: <%= order.getDateSend() %></p>
                            </div>
                            <div class="w-full sm:w-auto">
                                <p class="text-sm">Địa chỉ: **<%= address.getAddressDetail() +", " + address.getCity()%>**</p>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4 items-start">  

                            <div class="grid grid-rows-none gap-4">
                                <h2 class="text-lg font-bold border-b pb-2 mb-2">Sản phẩm đã đặt</h2>
                                <%
                                    if(listProducts!=null && listOrderDetails!=null){
                                    for(int j = 0; j< Math.min(listProducts.size(),listOrderDetails.size()) ; j++){
                                        com.diemxua.model.Product product = listProducts.get(j);
                                        com.diemxua.model.OrderDetails orderDetail = listOrderDetails.get(j);
                                %>
                                <div class="flex gap-4 p-3 sm:p-4 bg-[#f8f6ef]/80 rounded-lg items-center">
                                    <img src="<%= product.getImageProduct1() %>" alt="<%= product.getProductName()%>" class="w-16 h-16 sm:w-20 sm:h-20 object-cover rounded-lg flex-shrink-0" />
                                    <div class="grow block text-left">
                                        <p class="text-base sm:text-lg font-bold mb-1"><%= product.getProductName() %> </p>
                                        <div class="flex justify-between items-center">
                                            <p class="text-sm sm:text-base"> <%= product.getFormatPrice() %>đ x<%= orderDetail.getQuantity()%></p>
                                            <p class="border border-gray-300 rounded-full px-2 py-0.5 text-xs sm:text-sm font-semibold">
                                                Size: <%= orderDetail.getSize()%>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <% } } %>
                            </div>

                            <div class="p-4 bg-[#f8f6ef]/80 rounded-2xl flex flex-col justify-start">
                                <div class="flex flex-col justify-start h-full px-4 sm:px-8 py-4">
                                    <h2 class="text-lg font-bold border-b pb-2 mb-4">Tóm tắt Thanh toán</h2>
                                    <%
                                        String priceOrigin = (String) request.getAttribute("priceOrigin");
                                        String tax = (String) request.getAttribute("tax") ;
                                    %>
                                    <div class="flex justify-between mb-3 text-sm sm:text-base">
                                        <p>Tổng tiền hàng</p>
                                        <p><%= priceOrigin%>đ</p>
                                    </div>

                                    <div class="flex justify-between mb-3 text-sm sm:text-base">
                                        <p>Phí vận chuyển</p>
                                        <%
                                            String deliver = "25.000";
                                            if(order.getShipMethod().equals("free")){
                                                deliver = "0";
                                            }
                                        %>
                                        <p><%= deliver %>đ</p>
                                    </div>

                                    <div class="flex justify-between mb-3 text-sm sm:text-base">
                                        <p>Thuế (VAT)</p>
                                        <p>+<%= tax%>đ</p>
                                    </div>
                                    <div class="block border-b border-dotted border-[#492910]/30 pb-4 mb-4"></div>
                                    <div class="flex justify-between mb-4 text-base sm:text-xl">
                                        <p class="font-bold">Tổng cộng</p>
                                        <p class="font-bold text-[#492910]"><%= order.getFormatPrice() %>đ</p>
                                    </div>

                                    <% if (order.getStatus().toLowerCase().contains("chờ xác nhận")) { %>
                                    <button class="w-full py-2 bg-red-600 text-white font-semibold rounded-lg hover:bg-red-700 transition duration-200 shadow-md mt-4" 
                                            onclick="window.location.href = 'CancelOrderServlet?OrderID=<%= order.getOrderId()%>'">
                                        Hủy Đơn hàng
                                    </button>
                                    <% } %>

                                </div>
                            </div>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="text-center text-xl font-semibold p-6 bg-[#fdf8f3]/90 rounded-2xl shadow">
                        Không tìm thấy chi tiết đơn hàng.
                    </div>
                    <% } %>
                </div>
            </div>
        </section>
    </body>
    <script>
        lucide.createIcons();
    </script>
</html>