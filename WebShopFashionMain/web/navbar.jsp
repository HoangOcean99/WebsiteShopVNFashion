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
        <link rel="stylesheet" href="css/home.css" />
    </head>
    <body>
        <nav class="fixed top-0 left-0 w-full z-50 bg-[#4B2E17] text-white items-center">
            <div
                class="container mx-auto flex items-center justify-center px-12 py-2"
                >
                <div class="flex gap-20">
                    <a href="#home" class="hover:text-yellow-400 text-xl ">Giới Thiệu</a>
                    <a href="#category" class="hover:text-yellow-400 text-xl">Danh Mục</a>
                </div>

                <div class="flex-shrink-0">
                    <img
                        src="images/lgo.png"
                        alt="Logo"
                        class="w-25 h-20 object-cover items-center justify-center mx-auto rounded-full px-20"
                        />
                </div>

                <div class="flex items-center gap-20">
                    <a href="#feedback" class="hover:text-yellow-400 text-xl">Feedback</a>
                    <a href="#footer" class="hover:text-yellow-400 text-xl">Liên Hệ</a>
                </div>

                <div class="flex items-center gap-4 pl-20">
                    <i data-lucide="search" class="w-5 h-5 cursor-pointer"></i>
                    <i data-lucide="user" class="w-5 h-5 cursor-pointer"></i>
                    <i data-lucide="shopping-cart" class="w-5 h-5 cursor-pointer"></i>
                </div>
            </div>
        </nav>
    </body>
</html>
