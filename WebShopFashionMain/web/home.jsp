<%-- 
    Document   : home
    Created on : Oct 3, 2025, 9:11:41 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    rel="stylesheet" href="css/home.css" />
    <script src="main.js"></script>
</head>

<body>
    <nav
        class="fixed top-0 left-0 w-full z-50 bg-[#4B2E17] text-white items-center"
        >
        <div
            class="container mx-auto flex items-center justify-center px-12 py-2"
            >
            <div class="flex gap-20">
                <a href="#" class="hover:text-yellow-400 text-xl">Giới Thiệu</a>
                <a href="#" class="hover:text-yellow-400 text-xl">Danh Mục</a>
            </div>

            <div class="flex-shrink-0">
                <img
                    src="images/lgo.png"
                    alt="Logo"
                    class="w-25 h-20 object-cover items-center justify-center mx-auto rounded-full px-20"
                    />
            </div>

            <div class="flex items-center gap-20">
                <a href="#" class="hover:text-yellow-400 text-xl">Feedback</a>
                <a href="#" class="hover:text-yellow-400 text-xl">Liên Hệ</a>
            </div>

            <div class="flex items-center gap-4 pl-20">
                <i data-lucide="search" class="w-5 h-5 cursor-pointer"></i>
                <i data-lucide="user" class="w-5 h-5 cursor-pointer"></i>
                <i data-lucide="shopping-cart" class="w-5 h-5 cursor-pointer"></i>
            </div>
        </div>
    </nav>

    <section
        class="w-full min-h-screen bg-[url('images/Trangchu.png')] bg-cover bg-center bg-fixed overflow-hidden"
        >
        <div class="flex justify-between w-full h-full fixed z-20 opacity-80">
            <img
                src="images/cloudLeft.png"
                alt="cloundLeft"
                class="absolute top-0 left-0 h-2/3 w-auto animate-cloud-left"
                />

            <img
                src="images/cloudRight.png"
                alt="cloundRight"
                class="absolute top-0 right-0 h-2/3 w-auto animate-cloud-right"
                />
        </div>
    </section>

    <section
        class="w-full min-h-screen bg-[url('images/background.png')] bg-cover bg-center bg-no-repeat shadow-lg bg-fixed"
        >
        <h2
            class="justify-center text-center text-2xl font-bold underline text-brown-800 p-20"
            >
            Danh Mục
        </h2>

        <div class="flex gap-20 justify-center mb-40">
            <div class="text-center">
                <img
                    src="images/AoGiaoLinh.jpg"
                    alt="AoGiaoLinh"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-800">Áo Giao Lĩnh</h3>
            </div>

            <div class="text-center">
                <img
                    src="images/AoTacNu.jpg"
                    alt="AoTacNu"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-800">Áo Tấc Nữ</h3>
            </div>

            <div class="text-center">
                <img
                    src="images/VienLinh.jpg"
                    alt="VienLinh"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-1000">Áo Viên Lĩnh</h3>
            </div>
        </div>

        <div class="relative w-full h-[800px] overflow-hidden object-cover z-10">
            <div class="slide" style="background-image: url('images/f1.jpg')"></div>
            <div class="slide" style="background-image: url('images/f2.jpg')"></div>
            <div class="slide" style="background-image: url('images/f3.jpg')"></div>
            <div class="slide" style="background-image: url('images/f4.jpg')"></div>

            <div
                class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-white text-5xl font-bold drop-shadow-lg"
                >
                FEEDBACK
            </div>
        </div>
    </section>

    <footer class="bg-[#4B2E17] text-white py-10">
        <div
            class="container mx-auto px-6 md:px-12 flex flex-col md:flex-row justify-between items-center gap-6"
            >
            <!-- Cột trái -->
            <div class="text-center md:text-left">
                <img src="images/lgo.png" alt="logo" class="w-30 h-20 object-cover" />
                <p class="text-sm text-gray-300 max-w-sm">
                    Hành trình tìm lại hương sắc Việt
                </p>
            </div>

            <!-- Cột giữa -->
            <div class="flex gap-6 text-sm">
                <a href="# " class="hover:text-yellow-400 transition">Giới thiệu</a>
                <a href="# " class="hover:text-yellow-400 transition">Danh mục</a>
                <a href="# " class="hover:text-yellow-400 transition">Feedback</a>
                <a href="# " class="hover:text-yellow-400 transition">Liên hệ</a>
            </div>

            <!-- Cột phải -->
            <div class="flex gap-4">
                <i
                    data-lucide="facebook "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
                <i
                    data-lucide="instagram "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
                <i
                    data-lucide="mail "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
            </div>
        </div>

        <div
            class="border-t border-gray-600 mt-6 pt-4 text-center text-sm text-gray-400"
            >
            © 2025 Diễm Xưa. All rights reserved.
        </div>
    </footer>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
