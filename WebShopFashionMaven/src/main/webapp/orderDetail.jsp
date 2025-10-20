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
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <section>
            <div class="absolute top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-4/5 mx-auto items-stretch">
                    <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">
                        <h1 class="text-2xl font-bold mb-4">Order Detail</h1>
                        <div class="flex justify-around items-center"> 
                            <div class="flex items-center gap-2">
                                <i data-lucide="shopping-bag" class="size-5"></i>
                                <h2 class="text-sm">OrderID-CA11</h2>
                            </div>

                            <h2>Hòa lạc, Hà Nội</h2>
                            <h2>Estimated arrival: 30 September 2025</h2>
                            <h2>Ba Vì, Hà Nội</h2>
                        </div>
                        <div class="grid grid-cols-2 gap-2 mt-4 flex align-item"> 
                            <div class="grid grid-rows-2 gap-2 ">
                                <div class="flex gap-[20px] p-4 bg-[#f8f6ef]/80 rounded-lg">
                                    <img src="images/giaolinhtimnhat.jpg" art="timnhat" class="w-15 h-32 bg-gray-400 rounded-2xl" />
                                    <div class="grow block">
                                        <p class="text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                        <p class="text-xl pb-2"> 350.000đ x1</p>
                                        <div class="flex gap-6">
                                            <button class="flex space-x-3 ">
                                                <select class="border border-gray-300 rounded-full px-2 py-1 text-sm focus:outline-none">
                                                    <option>XL</option>
                                                    <option>L</option>
                                                    <option>M</option>
                                                    <option>S</option>
                                                </select>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="flex gap-[20px] p-4 bg-[#f8f6ef]/80 rounded-lg">
                                    <img src="images/giaolinhtimnhat.jpg" art="timnhat" class="w-15 h-32 bg-gray-400 rounded-2xl" />
                                    <div class="grow block">
                                        <p class="text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                        <p class="text-xl pb-2"> 350.000đ x1</p>
                                        <div class="flex gap-6">
                                            <button class="flex space-x-3 ">
                                                <select class="border border-gray-300 rounded-full px-2 py-1 text-sm focus:outline-none">
                                                    <option>XL</option>
                                                    <option>L</option>
                                                    <option>M</option>
                                                    <option>S</option>
                                                </select>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <div class=" gap-[20px] p-4 bg-[#f8f6ef]/80 rounded-lg ">
                                <div class="flex flex-col justify-center h-full px-12">

                                    <div class="flex justify-between mb-4">
                                        <p>Subtotal</p>
                                        <p>350.000đ</p>
                                    </div>

                                    <div class="flex justify-between mb-4">
                                        <p>Discount</p>
                                        <p>(20%) - 15.000đ</p>
                                    </div>

                                    <div class="flex justify-between mb-4">
                                        <p>Delivery</p>
                                        <p>0đ</p>
                                    </div>

                                    <div class="flex justify-between mb-4">
                                        <p>Tax</p>
                                        <p>+14.000đ</p>
                                    </div>
                                    <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4"></div>
                                    <div class="flex justify-between mb-4">
                                        <p class="font-bold size-3xl">Total</p>
                                        <p class="font-bold size-xl">349.000đ</p>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <p class="font-bold size-3xl m-4">Tracking History</p>
                        <div class="flex justify-around items-center text-sm m-4"> 
                            <h2>Order confirming</h2>
                            <h2>Packaging</h2>
                            <h2>Shipping</h2>
                            <h2>Delivered</h2>
                        </div>

                    </div>
                </div>
        </section>
    </body>
    <script>
        lucide.createIcons();
    </script>
</html>