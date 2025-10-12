<%-- 
    Document   : category
    Created on : Oct 3, 2025, 9:29:39 AM
    Author     : Duong
--%>

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
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
        <link rel="stylesheet" href="css/category.css" />
        <script src="main.js"></script>
    </head>

    <body>
        <%@include file="navbar.jsp" %>

        <section class="relative w-full h-screen overflow-hidden bg-[#f5f0e8]">
            <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover" />
            <div class="absolute text-center top-[70px] left-0 w-full h-full">
                <div class="flex text-center items-center justify-center gap-36">
                    <h1 class="font-bold mb-5 text-xl">GIAO LĨNH</h1>
                    <h1 class="font-bold mb-5 text-xl">VIÊN LĨNH</h1>
                    <h1 class="font-bold mb-5 text-xl">ÁO TẮC</h1>
                </div>
                <div class="grid grid-cols-3 grid-rows-2 gap-y-5 w-1/2 mx-auto">
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính tơ xước tím nhạt</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52  bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính xanh ngọc</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính tơ xước hồng</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính xanh ngọc</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính sa hàn xanh lá</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div class="cursor-pointer" onclick="window.location.href = 'productDetail.jsp'">
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính xanh ngọc</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                </div>
            </div>
        </section>
        <script>
            lucide.createIcons();
        </script>
    </body>
</html>
