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
        <nav class="fixed top-0 left-0 w-full z-50 bg-[#4B2E17] text-white">
            <div class="container mx-auto flex items-center justify-center">
                <div class="flex gap-20 font-semibold">
                    <a href="#" class="hover:text-yellow-400">Giới Thiệu</a>
                    <a href="#" class="hover:text-yellow-400">Danh Mục</a>
                </div>

                <div class="flex-shrink-0">
                    <img src="images/watermark2.png" alt="Logo" class="h-12 w-12 items-center justify-center mx-20 bg-white" />
                </div>

                <div class="flex gap-20">
                    <a href="#" class="hover:text-yellow-400">Feedback</a>
                    <a href="#" class="hover:text-yellow-400">Liên Hệ</a>
                </div>

                <div class="flex items-center gap-4 ml-6 px-12">
                    <i data-lucide="search" class="w-5 h-5 cursor-pointer"></i>
                    <i data-lucide="user" class="w-5 h-5 cursor-pointer"></i>
                    <i data-lucide="shopping-cart" class="w-5 h-5 cursor-pointer"></i>
                </div>
            </div>
        </nav>

        <section class="relative w-full h-screen overflow-hidden bg-[#f5f0e8]">
            <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover" />
            <div class="absolute text-center top-[70px] left-0 w-full h-full">
                <div class="flex text-center items-center justify-center gap-36">
                    <h1 class="font-bold mb-5 text-xl">GIAO LĨNH</h1>
                    <h1 class="font-bold mb-5 text-xl">VIÊN LĨNH</h1>
                    <h1 class="font-bold mb-5 text-xl">ÁO TẮC</h1>
                </div>
                <div class="grid grid-cols-3 grid-rows-2 gap-y-5 w-1/2 mx-auto">
                    <div>
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính tơ xước tím nhạt</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div>
                        <div class="w-44 h-52  bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính xanh ngọc</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div>
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính tơ xước hồng</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div>
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính xanh ngọc</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div>
                        <div class="w-44 h-52 bg-gray-400 mx-auto rounded-lg"></div>
                        <p class="mt-2">Giao lính sa hàn xanh lá</p>
                        <p class="font-semibold">350.000đ</p>
                    </div>
                    <div>
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
