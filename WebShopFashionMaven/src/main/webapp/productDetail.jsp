<%-- 
Document : productDetail
Created on : Oct 8, 2025, 10:04:12 PM
Author : Duong
--%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Diễm Xưa Shop</title>
        <link rel="icon" type="image/png" href="images/watermark2.png">     
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/category.css" />
        <script src="jscript/javascript.js"></script>
        <style>
            .image-display {
                height: 400px;
            }
            .image-display img {
                object-fit: contain;
            }
        </style>
        <script>
            const firebaseConfig = {
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
            com.diemxua.model.Product product = (com.diemxua.model.Product) request.getAttribute("product");
            List<com.diemxua.model.ProductMaterial> productMaterial = (List<com.diemxua.model.ProductMaterial>) request.getAttribute("productMaterial");
            String title = "GIAO LĨNH";
            if(product != null){
                if(product.getCategoryID() == 2){
                    title = "VIÊN LĨNH";
                }else if(product.getCategoryID() == 4) {
                    title = "ÁO TẤC";
                }
            }
            String urlImage = product != null ? product.getImageProduct1() : "";
        %>
        <section class="relative w-full bg-[#f5f0e8] pt-[40px] pb-10 min-h-screen">
            <img src="images/Home2.png" alt="Trang chủ" class="w-full h-full object-cover fixed top-0" />
            <div class="absolute text-center top-[80px] md:top-[100px] left-0 w-full h-full">
                <div class="bg-transparent min-h-screen py-8">
                    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                        <% if(product != null) { %>
                        <form method="get">
                            <header class="text-center mb-8">
                                <input type="hidden" value="<%= product.getProductID() %>" name="ProductID"/>
                                <h1 class="text-xl font-serif font-bold text-[#352F29] border-b border-b-[#352F29] inline-block tracking-widest">
                                    <%= title %>
                                </h1>
                            </header>

                            <div class=" w-full flex flex-col md:flex-row gap-8 md:gap-[100px] justify-center items-start">
                                <div class="w-full md:w-2/5 px-4 md:px-0">
                                    <div class="w-full h-[420px] bg-[#8FA79D] rounded-lg shadow-xl mb-4">
                                        <img src="<%= urlImage %>" alt="<%= product.getProductName() %>" id="mainImage" class="w-full h-full object-cover rounded-lg">
                                    </div>

                                    <div class="flex gap-4 justify-center md:justify-start">
                                        <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer">
                                            <img src="<%= product.getImageProduct1() %>" alt="<%= product.getProductName() %>" class="w-full h-full object-cover rounded-lg" onclick="changeImage('<%= product.getImageProduct1() %>')">
                                        </div>
                                        <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer">
                                            <img src="<%= product.getImageProduct2() %>" alt="<%= product.getProductName() %>" class="w-full h-full object-cover rounded-lg" onclick="changeImage('<%= product.getImageProduct2() %>')">
                                        </div>
                                        <div class="w-16 h-16 bg-[#8FA79D] rounded-lg opacity-70 cursor-pointer">
                                            <img src="<%= product.getImageProduct3() %>" alt="<%= product.getProductName() %>" class="w-full h-full object-cover rounded-lg" onclick="changeImage('<%= product.getImageProduct3() %>')">
                                        </div>
                                    </div>
                                </div>

                                <div class="w-full md:w-2/5 p-4 md:p-0">
                                    <h2 class="text-3xl sm:text-4xl font-serif text-[#352F29] mb-2 text-center md:text-start">
                                        <%= product.getProductName() %>
                                    </h2>
                                    <p class="text-2xl sm:text-3xl font-bold text-[#352F29] mb-6 text-center md:text-start">
                                        <%= product.getFormatPrice() %>₫
                                    </p>

                                    <div class="text-[#352F29] space-y-2 mb-8">
                                        <p class="font-semibold text-center md:text-start"><%= product.getDescription() %></p>
                                        <p class="font-semibold text-center md:text-start">Set đồ thuê gồm:</p>
                                        <ul class="list-none pl-4 space-y-1 text-sm text-center md:text-start">
                                            <% if(productMaterial != null){
                                                for(com.diemxua.model.ProductMaterial pm : productMaterial){
                                            %>

                                            <li class="relative before:content-['-'] before:absolute before:left-[-1rem] text-left inline-block md:block"><%= pm.getMaterialName() %></li>
                                                <% } }%>
                                        </ul>
                                        <p class="pt-2 text-center md:text-start">
                                            <%= product.getTrait() %>
                                        </p>
                                    </div>

                                    <div class="flex flex-wrap items-center gap-4">
                                        <div class="flex border border-gray-300 rounded-lg overflow-hidden w-40">
                                            <button class="w-1/3 py-2 text-xl bg-white hover:bg-gray-100 transition duration-150 border-r border-gray-300 text-[#352F29] font-bold" 
                                                    onclick="decrease(this)" type="button">
                                                -
                                            </button>
                                            <input name="quantityCart" type="text" value="1" readonly class="w-1/3 text-center text-xl py-2 border-none focus:outline-none text-[#352F29] font-semibold">
                                            <button class="w-1/3 py-2 text-xl bg-white hover:bg-gray-100 transition duration-150 border-l border-gray-300 text-[#352F29] font-bold" 
                                                    onclick="increase(this)" type="button">
                                                +
                                            </button>
                                        </div>
                                        <select class="border border-gray-300 rounded-full px-4 py-2 text-base focus:outline-none w-full sm:w-auto" name="sizeCart">
                                            <option value="XL">XL</option>
                                            <option value="L">L</option>
                                            <option value="M">M</option>
                                            <option value="S">S</option>
                                        </select>

                                        <button class="w-full py-3 px-6 bg-[#6B4B38] text-white font-semibold rounded-lg hover:bg-[#5A3F2F] transition duration-200 shadow-md" 
                                                formaction="CartServlet"
                                                type="submit">
                                            Add to Cart
                                        </button>
                                    </div>
                                    <button class="mt-4 w-full py-3 bg-[#C0A785] text-[#352F29] font-semibold rounded-lg hover:bg-[#B3997A] transition duration-200 shadow-md"
                                            formaction="BuyDetailServlet"
                                            type="submit">
                                        Buy Now
                                    </button>
                                </div>
                            </div>
                        </form>

                        <div class="container flex flex-col lg:flex-row justify-center gap-6 max-w-7xl mx-auto bg-transparent p-4 sm:p-8 rounded-xl my-5">

                            <div class="column flex flex-col items-center p-4 border border-gray-200 rounded-lg bg-white bg-opacity-70 shadow-xl w-full lg:w-1/3">
                                <h2 class="text-xl sm:text-2xl font-bold text-blue-600 mb-4 text-center">Ảnh của bạn</h2>
                                <div class="image-display w-full max-w-xs sm:max-w-sm flex justify-center items-center mb-4 bg-transparent overflow-hidden">
                                    <img id="personImagePreview" src="#" alt="Ảnh của bạn" class="max-w-full max-h-full hidden">
                                    <span id="personImagePlaceholder" class="text-gray-500">Tải ảnh lên</span>
                                </div>
                                <input type="file" id="personImageInput" accept="image/*" class="mb-3 text-sm text-gray-700 w-full max-w-xs">
                                <p class="text-sm text-gray-500">Chọn ảnh toàn thân của bạn.</p>
                            </div>

                            <div class="column flex flex-col items-center p-4 border border-gray-200 rounded-lg bg-white bg-opacity-70 shadow-xl w-full lg:w-1/3">
                                <h2 class="text-xl sm:text-2xl font-bold text-green-600 mb-4 text-center">Kết quả Thử Đồ Ảo</h2>
                                <div class="image-display w-full max-w-xs sm:max-w-sm flex justify-center items-center mb-4 bg-transparent overflow-hidden">
                                    <img id="tryOnResultImage" src="#" alt="Kết quả thử đồ" class="max-w-full max-h-full hidden">
                                    <span id="tryOnResultPlaceholder" class="text-gray-500">Kết quả sẽ hiển thị ở đây</span>
                                </div>
                                <button onclick="performTryOn()" id="tryOnButton" class="bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 px-6 rounded-lg transition duration-300 text-lg">
                                    Thử Đồ Ngay
                                </button>
                                <div class="loading-spinner mt-4" style="display: none" id="loadingSpinner">
                                    <svg class="animate-spin h-5 w-5 text-indigo-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                    </svg>
                                </div>
                                <p class="error-message text-red-600 font-bold mt-4 hidden" id="errorMessage"></p>
                            </div>

                            <div class="column flex flex-col items-center p-4 border border-gray-200 rounded-lg bg-white bg-opacity-70 shadow-xl w-full lg:w-1/3">
                                <h2 class="text-xl sm:text-2xl font-bold text-purple-600 mb-4 text-center">Trang Phục Đã Chọn</h2>
                                <div class="image-display w-full max-w-xs sm:max-w-sm border-2 border-indigo-600 flex justify-center items-center mb-4 bg-gray-50 overflow-hidden rounded-lg shadow-sm">
                                    <img id="selectedClothImage" 
                                         src="<%= product.getImageProduct1() %>" 
                                         alt="<%= product.getProductName() %>" 
                                         class="max-w-full max-h-full block object-contain">
                                </div>
                                <input type="hidden" id="selectedClothUrlInput" value="<%= product.getImageProduct1() %>"> 
                                <p class="text-sm text-gray-500 mt-4">Ảnh quần áo sẽ được sử dụng để thử đồ.</p>
                            </div>
                        </div>

                        <script>

                            let selectedClothUrlFromInput = null;

                            document.getElementById('personImageInput').addEventListener('change', function (event) {
                                const file = event.target.files[0];
                                const preview = document.getElementById('personImagePreview');
                                const placeholder = document.getElementById('personImagePlaceholder');
                                if (file) {
                                    const reader = new FileReader();
                                    reader.onload = function (e) {
                                        preview.src = e.target.result;
                                        preview.classList.remove('hidden');
                                        placeholder.classList.add('hidden');
                                    };
                                    reader.readAsDataURL(file);
                                } else {
                                    preview.src = '#';
                                    preview.classList.add('hidden');
                                    placeholder.classList.remove('hidden');
                                }
                            });

                            async function performTryOn() {
                                const personImageInput = document.getElementById('personImageInput');
                                const tryOnResultImage = document.getElementById('tryOnResultImage');
                                const tryOnResultPlaceholder = document.getElementById('tryOnResultPlaceholder');
                                const loadingSpinner = document.getElementById('loadingSpinner');
                                const errorMessage = document.getElementById('errorMessage');
                                const tryOnButton = document.getElementById('tryOnButton');

                                const selectedClothUrl = document.getElementById('selectedClothUrlInput').value;

                                errorMessage.classList.add('hidden');
                                tryOnResultImage.classList.add('hidden');
                                tryOnResultPlaceholder.classList.remove('hidden');

                                if (!personImageInput.files[0]) {
                                    errorMessage.textContent = 'Vui lòng chọn ảnh của bạn.';
                                    errorMessage.classList.remove('hidden');
                                    return;
                                }

                                if (!selectedClothUrl) {
                                    errorMessage.textContent = 'Không tìm thấy URL trang phục.';
                                    errorMessage.classList.remove('hidden');
                                    return;
                                }

                                loadingSpinner.style.display = 'block';
                                tryOnButton.disabled = true;

                                const formData = new FormData();
                                formData.append('personImageFile', personImageInput.files[0]);
                                formData.append('productImageUrl', selectedClothUrl);

                                try {
                                    const response = await fetch('TryOnServlet', {
                                        method: 'POST',
                                        body: formData
                                    });

                                    if (response.ok) {
                                        const blob = await response.blob();
                                        const imageUrl = URL.createObjectURL(blob);

                                        tryOnResultImage.src = imageUrl;
                                        tryOnResultImage.classList.remove('hidden');
                                        tryOnResultPlaceholder.classList.add('hidden');
                                        errorMessage.classList.add('hidden');
                                    } else {
                                        const errorText = await response.text();
                                        errorMessage.textContent = 'Lỗi thử đồ ảo: ' + errorText;
                                        errorMessage.classList.remove('hidden');
                                        console.error('API Error:', errorText);
                                    }
                                } catch (error) {
                                    errorMessage.textContent = 'Lỗi kết nối hoặc xử lý: ' + error.message;
                                    errorMessage.classList.remove('hidden');
                                    console.error('Fetch error:', error);
                                } finally {
                                    loadingSpinner.style.display = 'none';
                                    tryOnButton.disabled = false;
                                }
                            }
                        </script>
                        <% } else { %>
                        <p class="text-xl text-red-600 font-bold mt-10">Không tìm thấy thông tin sản phẩm.</p>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;
            function addToCart(productID) {
                const quantityInput = document.querySelector('input[name="quantityCart"]');
                const quantity = quantityInput ? quantityInput.value : '1';

                const sizeSelect = document.querySelector('select[name="sizeCart"]');
                const size = sizeSelect ? sizeSelect.value : '';

                const url = `CartServlet?ProductID=${productID}&quantityCart=${quantity}&sizeCart=${size}`;

                window.location.href = url;
            }
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
        <script src="js/handleChangeImage.js"></script>
    </body>
</html>