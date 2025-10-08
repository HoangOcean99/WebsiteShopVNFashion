<%-- 
    Document   : home
    Created on : Oct 3, 2025, 9:11:41 AM
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
        <link rel="stylesheet" href="css/home.css" />
        <!--<script src="main.js"></script>-->
    </head>

    <body>
        <jsp:include page="navbar.jsp" />
        <section class="relative w-full h-screen overflow-hidden bg-[#f5f0e8]">
            <img src="images/Trang chủ.png" alt="Trang chủ" class="w-full h-full object-cover" />
            <div class="gap-20">
                <img src="images/cloudLeft.png" alt="cloundLeft" class="absolute top-0 left-0 h-2/3 w-auto animate-cloud-left" />
                <img src="images/cloudRight.png" alt="cloundRight" class="absolute top-0 right-0 h-2/3 w-auto animate-cloud-right" />
            </div>
        </section>
        <script>
            lucide.createIcons();
        </script>
</html>
