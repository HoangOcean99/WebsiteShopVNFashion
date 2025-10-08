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
        <!--        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />-->
        <!--<link rel="stylesheet" href="css/category.css" />-->
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
        </script>
    </body>
</html>
