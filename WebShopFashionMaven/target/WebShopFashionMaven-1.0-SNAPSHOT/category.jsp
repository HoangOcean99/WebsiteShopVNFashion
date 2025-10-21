<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/category.css" />

        <script>
            // KHỞI TẠO FIREBASE (Cần chạy sớm)
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
        <section class="relative w-full h-screen overflow-hidden bg-[#f5f0e8]">
            <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover fixed top-0" />
            <div class="absolute text-center top-[120px] left-0 w-full h-full">
                <div class="flex text-center items-center justify-center gap-36">
                    <h1 class="font-bold mb-5 text-xl cursor-pointer"><a href="ProductServlet?categoryId=1">GIAO LĨNH</a></h1>
                    <h1 class="font-bold mb-5 text-xl cursor-pointer"><a href="ProductServlet?categoryId=2">VIÊN LĨNH</a></h1>
                    <h1 class="font-bold mb-5 text-xl cursor-pointer"><a href="ProductServlet?categoryId=4">ÁO TẤC</a></h1>
                </div>
                <div class="grid grid-cols-3 grid-rows-2 gap-y-5 w-1/2 mx-auto">
                    <% 
                        List<com.diemxua.model.Product> productList = 
                            (List<com.diemxua.model.Product>) request.getAttribute("listProducts");

                        if (productList != null) {
                            for (com.diemxua.model.Product p : productList) {
                    %>
                    <div class="cursor-pointer" 
                         onclick="window.location.href = 'ProductDetailServlet?ProductId=<%= p.getProductID() %>'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg">
                            <img src="<%= p.getImageProduct1() %>" alt="<%= p.getProductName() %>" class="w-full h-full object-cover rounded-lg">
                        </div>

                        <p class="mt-2"><%= p.getProductName() %></p>
                        <p class="font-semibold"><%= p.getFormatPrice() %>đ</p>
                    </div>
                    <% 
                }  
            } 
            else{
                    %>
                    <h1>Chưa có sản phẩm nào</h1>
                    <%
            }
                    %>
                </div>
            </div>
        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;

        </script>z
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>
