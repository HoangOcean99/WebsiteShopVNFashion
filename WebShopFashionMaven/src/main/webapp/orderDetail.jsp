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
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
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
            <div class="absolute top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-4/5 mx-auto items-stretch">
                    <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">
                        <h1 class="text-2xl font-bold mb-4">Order Detail</h1>
                        <div class="flex justify-around items-center"> 
                            <div class="flex items-center gap-2">
                                <i data-lucide="shopping-bag" class="size-5"></i>
                                <h2 class="text-sm">OrderID-<%= order.getOrderId() %></h2>
                            </div>

                            <h2>Hòa lạc, Hà Nội</h2>
                            <h2>Estimated arrival: <%= order.getDateSend() %></h2>
                            <h2><%= address.getAddressDetail() +", " + address.getCity()%></h2>
                        </div>
                        <div class="grid grid-cols-2 gap-2 mt-4 flex align-item"> 
                            <div class="grid grid-rows-2 gap-2 ">
                                <%
                                    if(listProducts!=null && listOrderDetails!=null){
                                    for(int j = 0; j< Math.min(listProducts.size(),listOrderDetails.size()) ; j++){
                                        com.diemxua.model.Product product = listProducts.get(j);
                                        com.diemxua.model.OrderDetails orderDetail = listOrderDetails.get(j);
                                %>
                                <div class="flex gap-[20px] p-4 bg-[#f8f6ef]/80 rounded-lg">
                                    <img src="<%= product.getImageProduct1() %>" alt="<%= product.getProductName()%>" class="w-15 h-32 bg-gray-400 rounded-2xl" />
                                    <div class="grow block">
                                        <p class="text-2xl font-bold pb-2"><%= product.getProductName() %> </p>
                                        <p class="text-xl pb-2"> <%= product.getFormatPrice() %>đ x<%= orderDetail.getQuantity()%></p>
                                        <div class="flex gap-6">
                                            <button class="flex space-x-3 ">
                                                <p class="rounded-full py-1 text-sm focus:outline-none">
                                                    <span class="font-semibold">Size:</span> <%= orderDetail.getSize()%>
                                                </p>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <% } } %>

                            </div>




                            <div class=" gap-[20px] p-4 bg-[#f8f6ef]/80 rounded-lg ">
                                <div class="flex flex-col justify-start h-full px-12 py-8">
                                    <%
                                        String priceOrigin = (String) request.getAttribute("priceOrigin");
                                        String tax = (String) request.getAttribute("tax") ;

                                    %>
                                    <div class="flex justify-between mb-4">
                                        <p>Subtotal</p>
                                        <p><%= priceOrigin%>đ</p>
                                    </div>

                                    <div class="flex justify-between mb-4">
                                        <p>Delivery</p>
                                        <%
                                            String deliver = "";
                                            if(order.getShipMethod().equals("free")){
                                                deliver = "0";
                                            }else{
                                                deliver = "25.000";
                                            }
                                        %>
                                        <p><%= deliver %>đ</p>
                                    </div>

                                    <div class="flex justify-between mb-4">
                                        <p>Tax</p>
                                        <p>+<%= tax%>đ</p>
                                    </div>
                                    <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4"></div>
                                    <div class="flex justify-between mb-4">
                                        <p class="font-bold size-3xl">Total</p>
                                        <p class="font-bold size-xl"><%= order.getFormatPrice() %>đ</p>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
        </section>
    </body>
    <script>
        lucide.createIcons();
    </script>
</html>