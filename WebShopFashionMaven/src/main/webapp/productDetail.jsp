<%-- 
    Document   : productDetail
    Created on : Oct 8, 2025, 10:04:12 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Product Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
        <link rel="stylesheet" href="css/category.css" />
        <script src="main.js"></script>
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
        <%@include file="navbar.jsp" %>
        <%
            boolean isAuthenticated = session.getAttribute("isAuthenticated") != null && (Boolean) session.getAttribute("isAuthenticated");
        %>
        <section class="relative w-full h-screen overflow-hidden bg-[#f5f0e8] top-[40px]">
            <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover" />
            <div class="absolute text-center top-[50px] left-0 w-full h-full">
                <div class="bg-transparent min-h-screen py-8">
                    <div class="max-w-6xl mx-auto">
                        <header class="text-center mb-8">
                            <h1 class="text-xl font-serif font-bold text-[#352F29] border-b border-b-[#352F29] inline-block tracking-widest">
                                GIAO LINH
                            </h1>
                        </header>

                        <div class=" w-full flex flex-col mx-16 md:flex-row gap-[100px]">
                            <div class="md:w-2/5">
                                <div class="w-full h-[420px] bg-[#8FA79D] rounded-lg shadow-xl mb-4">
                                </div>

                                <div class="flex gap-4 justify-start">
                                    <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer"></div>
                                    <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer"></div>
                                    <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer"></div>
                                </div>
                            </div>

                            <div class="md:w-2/5 p-0">
                                <h2 class="text-4xl font-serif text-[#352F29] mb-2 text-start">
                                    Giao lĩnh tơ xước tím nhạt
                                </h2>
                                <p class="text-3xl font-bold text-[#352F29] mb-6 text-start">
                                    350.000₫
                                </p>

                                <div class="text-[#352F29] space-y-2 mb-8">
                                    <p class="font-semibold text-start">Mã sản phẩm: C06: Fullset áo Giao lĩnh quần thường tơ xước tím nhạt</p>
                                    <p class="font-semibold text-start">Set đồ thuê gồm:</p>
                                    <ul class="list-none pl-4 space-y-1 text-sm">
                                        <li class="text-start relative before:content-['-'] before:absolute before:left-[-1rem]">Áo Giao lĩnh dáng dài vải tơ xước tím</li>
                                        <li class="text-start relative before:content-['-'] before:absolute before:left-[-1rem]">Quần trắng</li>
                                        <li class="text-start relative before:content-['-'] before:absolute before:left-[-1rem]">Xiêm thường quây (dạng váy) bên dưới</li>
                                    </ul>
                                    <p class="pt-2 text-start">
                                        • Vải áo mềm mại, nhẹ nhàng mặc mát, set đồ dịu dàng, trang nhã phù hợp chụp ảnh, concept.
                                    </p>
                                </div>

                                <div class="flex items-center gap-4">
                                    <div class="flex border border-gray-300 rounded-lg overflow-hidden w-40">
                                        <button class="w-1/3 py-2 text-xl bg-white hover:bg-gray-100 transition duration-150 border-r border-gray-300 text-[#352F29] font-bold">
                                            -
                                        </button>
                                        <input type="text" value="1" readonly class="w-1/3 text-center text-xl py-2 border-none focus:outline-none text-[#352F29] font-semibold">
                                        <button class="w-1/3 py-2 text-xl bg-white hover:bg-gray-100 transition duration-150 border-l border-gray-300 text-[#352F29] font-bold">
                                            +
                                        </button>
                                    </div>

                                    <button class="flex-1 py-3 px-6 bg-[#6B4B38] text-white font-semibold rounded-lg hover:bg-[#5A3F2F] transition duration-200 shadow-md">
                                        Add to Cart
                                    </button>
                                </div>

                                <button class="mt-4 w-full py-3 bg-[#C0A785] text-[#352F29] font-semibold rounded-lg hover:bg-[#B3997A] transition duration-200 shadow-md">
                                    Buy Now
                                </button>
                            </div>
                        </div>
                    </div>
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
