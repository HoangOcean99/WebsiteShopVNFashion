<%-- 
    Document   : navbar
    Created on : Oct 3, 2025, 9:12:36 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    </body>
</html>
