<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Danh Mục Sản Phẩm</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/category.css" />
        <style>
            .scroll-hide::-webkit-scrollbar {
                display: none;
            }
            .scroll-hide {
                -ms-overflow-style: none; /* IE and Edge */
                scrollbar-width: none; /* Firefox */
            }
        </style>

        <script>
            // KHỞI TẠO FIREBASE
            const firebaseConfig = {
                // ... (chi tiết config của bạn)
                apiKey: "AIzaSyBKJjw6QbT3vJKt3jL86bvG3wCvyma5lMQ",
                authDomain: "diemxua-8f674.firebaseapp.com",
                projectId: "diemxua-8f674",
                storageBucket: "diemxua-8f674.firebasestorage.app",
                messagingSenderId: "327215765829",
                appId: "1:327215765829:web:2f1fad3037b2dcd3d0c62c",
                measurementId: "G-VLJJY4SERC"
            };
            const app = firebase.initializeApp(firebaseConfig);
            const auth = firebase.auth();
        </script>
    </head>

    <body>
        <%
            boolean isAuthenticated = session.getAttribute("isAuthenticated") != null && (Boolean) session.getAttribute("isAuthenticated");
        %>
        <%@include file="navbar.jsp" %>

        <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover fixed top-0 -z-10" />

        <section class="relative w-full min-h-screen pt-[100px] pb-10">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">

                <div class="flex overflow-x-auto scroll-hide whitespace-nowrap justify-start lg:justify-center mb-8 gap-4 sm:gap-8 lg:gap-36 p-2 bg-white/70 rounded-lg shadow-lg">
                    <h1 class="font-bold text-lg sm:text-xl flex-shrink-0 cursor-pointer hover:text-[#4B2E17]"><a href="ProductServlet?categoryId=1">GIAO LĨNH</a></h1>
                    <h1 class="font-bold text-lg sm:text-xl flex-shrink-0 cursor-pointer hover:text-[#4B2E17]"><a href="ProductServlet?categoryId=2">VIÊN LĨNH</a></h1>
                    <h1 class="font-bold text-lg sm:text-xl flex-shrink-0 cursor-pointer hover:text-[#4B2E17]"><a href="ProductServlet?categoryId=4">ÁO TẤC</a></h1>
                </div>

                <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-4 gap-y-8 max-w-5xl mx-auto p-4 bg-white/70 rounded-lg shadow-lg">
                    <% 
                        List<com.diemxua.model.Product> productList = 
                            (List<com.diemxua.model.Product>) request.getAttribute("listProducts");

                        if (productList != null && !productList.isEmpty()) {
                            for (com.diemxua.model.Product p : productList) {
                    %>
                    <div class="cursor-pointer text-center" 
                         onclick="window.location.href = 'ProductDetailServlet?ProductId=<%= p.getProductID() %>'">

                        <div class="w-full h-48 sm:h-56 bg-gray-300 mx-auto rounded-lg overflow-hidden shadow-md">
                            <img src="<%= p.getImageProduct1() %>" alt="<%= p.getProductName() %>" class="w-full h-full object-cover rounded-lg transition duration-300 hover:scale-[1.02]">
                        </div>

                        <p class="mt-2 text-sm sm:text-base truncate px-1"><%= p.getProductName() %></p>
                        <p class="font-bold text-base sm:text-lg text-[#4B2E17]"><%= p.getFormatPrice() %>đ</p>
                    </div>
                    <%  
                        } 
                    } 
                    else{
                    %>
                    <h1 class="col-span-full text-center text-xl font-semibold p-10 text-[#4B2E17]">Chưa có sản phẩm nào</h1>
                    <%
                    }
                    %>
                </div>
            </div>
        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>