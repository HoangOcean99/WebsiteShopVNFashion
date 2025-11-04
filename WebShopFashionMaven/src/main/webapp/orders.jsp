<%-- 
    Document   : orders
    Created on : Oct 12, 2025, 5:01:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Orders</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>

    <body>
        <%@include file="navbar.jsp" %>
        <section>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />
            
            <div class="absolute top-[120px] left-0 w-full h-full pb-10">
                
                <div class="grid gap-6 w-[95%] sm:w-4/5 mx-auto items-stretch">
                    
                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-4 sm:p-8 shadow relative z-10">
                        <h1 class="text-2xl font-bold mb-4">Orders</h1> <div class="flex flex-col sm:flex-row justify-around font-bold text-lg sm:text-xl bg-[#f8f6ef]/60 px-2 py-2 sm:py-1 leading-height rounded-xl gap-2">
                            <button class="w-full sm:w-auto hover:bg-[#ffffff]/80 focus:bg-[#fdf8f3]/80
                                   focus:ring-1 focus:ring-[#492910] px-4 py-2 sm:px-10 md:px-20 sm:py-1 rounded-xl leading-height">On Shipping</button>
                            <button class="w-full sm:w-auto hover:bg-[#ffffff]/80 focus:bg-[#fdf8f3]/80
                                   focus:ring-1 focus:ring-[#492910] px-4 py-2 sm:px-10 md:px-20 sm:py-1 rounded-xl leading-height">Arrived</button>
                            <button class="w-full sm:w-auto hover:bg-[#ffffff]/80 focus:bg-[#fdf8f3]/80
                                   focus:ring-1 focus:ring-[#492910] px-4 py-2 sm:px-10 md:px-20 sm:py-1 rounded-xl leading-height">Canceled</button>
                        </div>

                    </div>

                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-4 sm:p-6 shadow relative z-10">
                        
                        <div class="flex flex-col sm:flex-row sm:justify-around items-center gap-2 text-sm md:text-base"> 
                            <div class="flex items-center gap-2">
                                <i data-lucide="shopping-bag" class="size-5"></i>
                                <h2 class="text-sm">OrderID-CA11</h2>
                            </div>
                            <h2>Hòa lạc, Hà Nội</h2>
                            <h2>Estimated arrival: 30 September 2025</h2>
                            <h2>Ba Vì, Hà Nội</h2>
                        </div>

                        <div class="flex flex-col sm:flex-row gap-4 p-4 border border-[#4B2E17]/50 rounded-lg m-2 md:m-6"> <img src="images/giaolinhtimnhat.jpg" alt="timnhat" class="w-full sm:w-24 h-48 sm:h-32 object-cover bg-gray-400 rounded-2xl" /> <div class="grow block">
                                <p class="text-lg sm:text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                <p class="text-base sm:text-xl pb-2"> 350.000đ x1</p>
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

                        <div class="flex flex-col sm:flex-row gap-4 p-4 border border-[#4B2E17]/50 rounded-lg m-2 md:m-6"> <img src="images/AoTacNam.jpg" alt="timnhat" class="w-full sm:w-24 h-48 sm:h-32 object-cover bg-gray-400 rounded-2xl" /> <div class="grow block">
                                <p class="text-lg sm:text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                <p class="text-base sm:text-xl pb-2"> 350.000đ x1</p>
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

                        <div class="flex flex-col sm:flex-row justify-between items-center gap-4 sm:gap-0 ml-2 mr-2 md:ml-6 md:mr-6">
                            <h1 class="text-lg sm:text-xl font-bold text-center ">Total: 715.000đ</h1>
                            
                            <div>
                                <button class=" w-fit text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-1
                                               hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                               focus:outline-none focus:ring-1 focus:ring-[#492910] cursor-pointer" onclick="window.location.href = 'orderDetail.jsp'">
                                    Detail
                                </button>
                            </div>

                        </div>
                    </div>

                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-4 sm:p-6 shadow relative z-10">
                        <div class="flex flex-col sm:flex-row sm:justify-around items-center gap-2 text-sm md:text-base"> 
                            <div class="flex items-center gap-2">
                                <i data-lucide="shopping-bag" class="size-5"></i>
                                <h2 class="text-sm">OrderID-CA11</h2>
                            </div>
                            <h2>Hòa lạc, Hà Nội</h2>
                            <h2>Estimated arrival: 30 September 2025</h2>
                            <h2>Ba Vì, Hà Nội</h2>
                        </div>

                        <div class="flex flex-col sm:flex-row gap-4 p-4 border border-[#4B2E17]/50 rounded-lg m-2 md:m-6">
                            <img src="images/giaolinhtimnhat.jpg" alt="timnhat" class="w-full sm:w-24 h-48 sm:h-32 object-cover bg-gray-400 rounded-2xl" />
                            <div class="grow block">
                                <p class="text-lg sm:text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                <p class="text-base sm:text-xl pb-2"> 350.000đ x1</p>
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

                        <div class="flex flex-col sm:flex-row gap-4 p-4 border border-[#4B2E17]/50 rounded-lg m-2 md:m-6">
                            <img src="images/AoTacNam.jpg" alt="timnhat" class="w-full sm:w-24 h-48 sm:h-32 object-cover bg-gray-400 rounded-2xl" />
                            <div class="grow block">
                                <p class="text-lg sm:text-2xl font-bold pb-2">Giao Lĩnh Tơ Xước Tím Nhạt </p>
                                <p class="text-base sm:text-xl pb-2"> 350.000đ x1</p>
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

                        <div class="flex flex-col sm:flex-row justify-between items-center gap-4 sm:gap-0 ml-2 mr-2 md:ml-6 md:mr-6">
                            <h1 class="text-lg sm:text-xl font-bold text-center ">Total: 715.000đ</h1>
                            <div>
                                <button class=" w-fit text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-1
                                               hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80
                                               focus:outline-none focus:ring-1 focus:ring-[#492910] cursor-pointer" onclick="window.location.href = 'orderDetail.jsp'">
                                    Detail
                                </button>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            </section>
    </body>
    <script>
        lucide.createIcons();
    </script>
</html>