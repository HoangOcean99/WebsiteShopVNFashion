<%-- 
    Document   : cart
    Created on : Oct 9, 2025, 8:51:03 PM
    Author     : Admin
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
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
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
        <section>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />
            <div class="absolute top-[120px] left-0 w-full h-full">
                <div class="grid grid-cols-[2fr_1fr] gap-6 w-4/5 mx-auto items-stretch">
                    <!-- Bảng 1 -->
                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-8 shadow relative z-10">
                        <h2 class="text-2xl font-bold mb-4">CART</h2>
                        <!-- nội dung giỏ hàng -->
                        <div>
                            <div class="flex gap-[20px] p-2 border border-[#4B2E17]-2000 rounded-lg mb-2">
                                <img src="images/giaolinhtimnhat.jpg" art="timnhat" class="w-25 h-52 bg-gray-400 rounded-2xl" />
                                <div class="grow block">
                                    <p class="text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                    <p class="text-xl pb-2"> 350.000đ </p>
                                    <div class="flex gap-6">
                                        <button class="flex space-x-3 ">
                                            <select class="border border-gray-300 rounded-full px-2 py-1 text-sm focus:outline-none">
                                                <option>XL</option>
                                                <option>L</option>
                                                <option>M</option>
                                                <option>S</option>
                                            </select>
                                        </button>
                                        <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-2 py-1 space-x-2">
                                            <button class="text-lg leading-none px-2 select-none" onclick="decrease(this)">-</button>
                                            <input type="number" value="1" min="1" class="w-8 text-center bg-transparent" />
                                            <button class="text-lg leading-none select-none" onclick="increase(this)">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-2xl font-bold pb-12">350.000đ</p>
                                    <div class="flex gap-2 ">
                                        <i data-lucide="trash-2" class="size-5"></i>
                                        <p class="text-md"> Deleted</p>
                                    </div>

                                </div>
                            </div>

                            <div class="flex gap-[20px] p-2 border border-[#4B2E17]-2000 rounded-lg mb-2">
                                <img src="images/giaolinhtimnhat.jpg" art="timnhat" class="w-25 h-52 bg-gray-400 rounded-2xl" />
                                <div class="grow block">
                                    <p class="text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                    <p class="text-xl pb-2"> 350.000đ </p>
                                    <div class="flex gap-6">
                                        <button class="flex space-x-3 ">
                                            <select class="border border-gray-300 rounded-full px-2 py-1 text-sm focus:outline-none">
                                                <option>XL</option>
                                                <option>L</option>
                                                <option>M</option>
                                                <option>S</option>
                                            </select>
                                        </button>
                                        <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-2 py-1 space-x-2">
                                            <button class="text-lg leading-none px-2 select-none" onclick="decrease(this)">-</button>
                                            <input type="number" value="1" min="1" class="w-8 text-center bg-transparent" />
                                            <button class="text-lg leading-none select-none" onclick="increase(this)">+</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-2xl font-bold pb-12">350.000đ</p>
                                    <div class="flex gap-2 ">
                                        <i data-lucide="trash-2" class="size-5"></i>
                                        <p class="text-md"> Deleted</p>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>

                    <!-- Bảng 2 -->
                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">
                        <h2 class="text-xl font-bold mb-4">Delivery</h2>
                        <!-- nội dung bên phải -->
                        <div class="block border-b border-dotted border-[#492910]/100 pb-4">
                            <div class="border border-[#492910]/60  bg-[#a29992]/80 rounded-xl flex w-fit leading-height space-x-3 px-2 py-1 mb-2 ">
                                <button class=" hover:bg-[#ffffff]/80 focus:bg-[#fdf8f3]/80
                                        focus:ring-1 focus:ring-[#492910] px-3 py-1 rounded-xl leading-height ">Free</button>
                                <button class=" hover:bg-[#ffffff]/80  focus:bg-[#fdf8f3]/80
                                        focus:ring-1 focus:ring-[#492910]  px-3 py-1 rounded-xl leading-height ">Express:25.000d</button>
                            </div>
                            <p>Delivery date: September 30, 2025</p>
                        </div>

                        <div class="block border-b border-dotted border-[#492910]/100 pb-4">
                            <div class="flex border border-[#492910]/60 rounded-2xl w-fit leading-height px-2 py-1 mb-2 space-x-[200px] my-4">
                                <p class="px-3 py-1 leading-height">Promocode</p>
                                <button class="  border border-[#492910]/60 hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                        focus:ring-1 focus:ring-[#492910] px-3 py-1 rounded-xl leading-height">Apply</button>
                            </div>
                            <p>20% off discount</p>
                        </div>

                        <div class="block border-b border-dotted border-[#492910]/100 pb-4">
                            <div class="flex space-x-[250px]">
                                <p>Subtotal</p>
                                <p>700.000đ</p>
                            </div>

                            <div class="flex space-x-[200px]">
                                <p>Discount</p>
                                <p>(20%) - 15.000đ</p>
                            </div>

                            <div class="flex space-x-[290px]">
                                <p>Delivery</p>
                                <p>0đ</p>
                            </div>

                            <div class="flex space-x-[280px]">
                                <p>Tax</p>
                                <p>+14.000đ</p>
                            </div>
                        </div>

                        <div>
                            <div class="flex space-x-[260px] text-md font-bold">
                                <p>Tottal</p>
                                <p>740.000đ</p>
                            </div>
                            <button class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-1 mb-2 my-4
                                    hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                    focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                Buy
                            </button>

                            <button onclick="window.location.href = 'category.jsp'"  class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-1 mb-2 my-4
                                    hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                    focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                Continue Shopping
                            </button>

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