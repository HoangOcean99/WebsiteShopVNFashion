<%--
    Document : cart (BuyDetail Version)
    Created on : Oct 9, 2025, 8:51:03 PM
    Author : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Product" %>
<%@ page import="java.util.List, com.diemxua.model.Address" %>

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
        <link rel="stylesheet" href="css/cart.css" />
        <script>
            // KHỞI TẠO FIREBASE
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
        <style>
            /* Giữ nguyên CSS tùy chỉnh */
            .deliverOption {
                display: flex;
                align-items: center;
                gap: 6px;
                padding: 10px 16px;
                border-radius: 10px;
                cursor: pointer;
                user-select: none;
                transition: 0.2s;
            }

            input[type="radio"]:checked + label,
            .deliverOption:hover {
                background-color: #49291010;
                border-color: #492910;
            }

            /* XÓA CSS TÙY CHỈNH CHO GRID, CHUYỂN SANG INLINE STYLE */
        </style>

    </head>

    <body>
        <%
            boolean isAuthenticated = session.getAttribute("isAuthenticated") != null && (Boolean) session.getAttribute("isAuthenticated");
        %>
        <%@include file="navbar.jsp" %>
        <section>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

            <div class="relative pt-[100px] md:pt-[120px] pb-10">

                <form id="payForm" action="ajaxServlet" method="post" class="w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 items-start">

                        <%
                            com.diemxua.model.Product productsCart = (com.diemxua.model.Product) request.getAttribute("productBuy");
                            long priceProduct = (productsCart != null) ? productsCart.getPrice() : 0;
                            int quantityBuy = (request.getAttribute("quantityBuy") != null) ? (int) request.getAttribute("quantityBuy") : 1;
                            String sizeBuy = (String) request.getAttribute("sizeBuy");
                            String priceString = (String) request.getAttribute("priceString");
                            String taxString = (String) request.getAttribute("taxString");
                            long totalPrice = (request.getAttribute("totalPrice") != null) ? (long) request.getAttribute("totalPrice") : 0;
                        %>

                        <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-8 shadow relative z-10 order-1 md:order-1 md:col-span-2">
                            <h2 class="text-xl sm:text-2xl font-bold mb-4">Sản phẩm</h2>
                            <div>  
                                <div class="flex gap-3 sm:gap-[20px] p-3 border border-[#4B2E17]/20 rounded-lg mb-2 items-center">
                                    <img src="<%= productsCart.getImageProduct1() %>" alt="<%= productsCart.getProductName() %>" 
                                         class="w-16 h-20 sm:w-20 sm:h-24 object-cover rounded-lg flex-shrink-0" />

                                    <div class="grow block min-w-0">
                                        <p class="text-base sm:text-xl font-bold pb-1 truncate"><%= productsCart.getProductName() %> </p>
                                        <p class="text-sm sm:text-lg pb-2"><%= productsCart.getFormatPrice() %>đ </p>

                                        <div class="flex flex-wrap gap-4 items-center">

                                            <select class="border border-gray-300 rounded-full px-2 py-1 text-xs sm:text-sm focus:outline-none"
                                                    name="inputSize">
                                                <option value="XL" <% if("XL".equals(sizeBuy)) {%> selected <% } %>>XL</option>
                                                <option value="L" <% if("L".equals(sizeBuy)) {%> selected <% } %>>L</option>
                                                <option value="M" <% if("M".equals(sizeBuy)) {%> selected <% } %>>M</option>
                                                <option value="S" <% if("S".equals(sizeBuy)) {%> selected <% } %>>S</option>
                                            </select>

                                            <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>"></input>
                                            <input type="hidden" name="PriceOrigin" value="<%= productsCart.getPrice() %>"></input>

                                            <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-1 py-0.5 space-x-1 sm:space-x-2 text-sm sm:text-base">
                                                <button type="button" class="leading-none px-1 select-none" onclick="decrease(this)">-</button>
                                                <input type="number" 
                                                       value="<%= quantityBuy %>"
                                                       min="1" 
                                                       class="w-6 sm:w-8 text-center bg-transparent focus:outline-none"
                                                       name="inputQuantity" />
                                                <button type="button" class="leading-none px-1 select-none" onclick="increase(this)">+</button>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="text-base sm:text-xl font-bold mb-8 sm:mb-12 flex-shrink-0" id="mainPrice"><%= priceString %>đ</p>
                                </div>
                            </div>
                        </div>

                        <div class="order-2 md:order-2 md:col-span-1">
                            <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-6 shadow relative z-10 sticky top-20">
                                <h2 class="text-xl font-bold mb-4">Thông tin vận chuyển</h2>

                                <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                    <div class="border border-[#492910]/60 bg-[#a29992]/80 rounded-xl flex flex-wrap justify-center sm:justify-start leading-height space-x-3 px-2 py-1 mb-2">
                                        <label class="deliverOption text-sm">
                                            <input type="radio" name="deliver" value="free" checked onclick="selectDeliver('free')">
                                            Free
                                        </label>

                                        <label class="deliverOption text-sm">
                                            <input type="radio" name="deliver" value="fast" onclick="selectDeliver('fast')">
                                            Express (25.000₫)
                                        </label>
                                    </div>
                                    <p class="text-sm" id="dateDisplay">Ngày giao hàng dự kiến: </p>
                                    <input type="hidden" name="dateSend" id="dateSend">
                                </div>

                                <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                    <h3 class="font-bold mb-2">Địa chỉ giao hàng</h3>
                                    <div class="flex flex-col sm:flex-row space-y-2 sm:space-y-0 sm:space-x-2 items-center">
                                        <select id="addressSelect"
                                                name="addressSelect"
                                                class="w-full border border-[#492910]/60 bg-[#ffffff]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none">
                                            <% 
                                                List<com.diemxua.model.Address> listAddress = (List<com.diemxua.model.Address>) request.getAttribute("listAddress");
                                                if (listAddress != null) {
                                                    for(com.diemxua.model.Address a : listAddress){
                                            %>
                                            <option value="<%= a.getAddressID() %>"><%= a.getRecipientName() +" - "+ a.getPhone() +" - "+ a.getAddressDetail() +" - "+ a.getCity() %></option>
                                            <% } 
                                                } else { %>
                                            <option value="">Chưa có địa chỉ nào</option>
                                            <% } %>
                                        </select>
                                        <button id="addAddressBtn" type="button" class="w-full sm:w-auto border border-[#492910]/60 rounded-xl px-3 py-2 hover:bg-[#fdf8f3]/70 focus:ring-1 focus:ring-[#492910] text-sm font-semibold flex-shrink-0">
                                            Thêm
                                        </button>
                                    </div>

                                    <div id="newAddressForm" class="mt-3 hidden space-y-2">
                                        <input name="newRecipientName" type="text" placeholder="Tên người nhận..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none" required />
                                        <input name="newPhone" type="text" placeholder="Số điện thoại..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none" required />
                                        <input name="newCountry" placeholder="Quốc gia..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none" required />
                                        <input name="newCity" placeholder="Thành phố..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none" required />
                                        <textarea name="newDetailAddress" placeholder="Địa chỉ chi tiết..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 text-sm focus:ring-1 focus:ring-[#492910] focus:outline-none" required></textarea>

                                        <button formaction="AdminAddAddressServlet" type="submit" class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 bg-[#a29992]/70 hover:bg-[#a29992]/90 font-semibold focus:ring-1 focus:ring-[#492910]">
                                            Lưu Địa chỉ
                                        </button>
                                    </div>
                                </div>

                                <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                    <h3 class="font-bold mb-2">Hình thức thành toán</h3>
                                    <div class="space-y-2 text-sm">
                                        <label class="flex items-center space-x-2">
                                            <input type="radio" name="payment" class="accent-[#492910]" value="COD" checked>
                                            <span>Thanh toán khi nhận hàng</span>
                                        </label>
                                        <label class="flex items-center space-x-2">
                                            <input type="radio" name="payment" class="accent-[#492910]" value="vnpay">
                                            <span>Thanh toán bằng VNPay</span>
                                        </label>
                                    </div>
                                </div>

                                <div class="block border-b border-dotted border-[#492910]/100 pb-4 text-sm">
                                    <div class="flex justify-between">
                                        <p>Giá gốc: </p>
                                        <p id="priceDisplay"><%= priceString %>đ</p>
                                    </div>
                                    <div class="flex justify-between">
                                        <p>Phí giao hàng: </p>
                                        <p>+ <span id="priceDeli">0</span>đ</p>
                                    </div>
                                    <div class="flex justify-between">
                                        <p>Thuế (1.5%):</p>
                                        <p id="taxDisplay">+ <%= taxString %>đ</p>
                                    </div>
                                </div>

                                <div>
                                    <div class="flex justify-between text-base font-bold mt-2 sm:text-lg">
                                        <p>Tổng tiền: </p>
                                        <p id="totalPriceDisplay">0đ</p>
                                    </div>

                                    <input type="hidden" name="totalBill" id="sendPrice" value="0">
                                    <input type="hidden" name="type" value="buy">

                                    <button 
                                        formaction="ajaxServlet"
                                        type="submit"
                                        class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 my-4 text-base
                                        hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                        Mua
                                    </button>
                                    <button 
                                        type="button" 
                                        onclick="window.location.href = 'ProductServlet?categoryId=1'" 
                                        class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 mb-2 text-base
                                        hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                        Tiếp tục mua hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

            </div>

        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;
            const addressSelect = document.getElementById("addressSelect");
            const addAddressBtn = document.getElementById("addAddressBtn");
            const newAddressForm = document.getElementById("newAddressForm");
            const addressInputs = newAddressForm.querySelectorAll('input, textarea');

            function formatNumber(num) {
                return num.toLocaleString('vi-VN');
            }

            // Hàm bật/tắt required cho tất cả input trong form địa chỉ mới
            function toggleAddressRequired(enable) {
                addressInputs.forEach(input => {
                    if (enable) {
                        input.setAttribute('required', 'required');
                        if (addressSelect)
                            addressSelect.value = '';
                    } else {
                        input.removeAttribute('required');
                    }
                });
            }

            addAddressBtn.onclick = (e) => {
                e.preventDefault();
                newAddressForm.classList.toggle("hidden");
                const isHidden = newAddressForm.classList.contains("hidden");
                toggleAddressRequired(!isHidden);
            };

            window.addEventListener('DOMContentLoaded', () => {
                if (newAddressForm.classList.contains("hidden")) {
                    toggleAddressRequired(false);
                }
            });


            function updateTotal() {
                const priceDeli = document.getElementById("priceDeli");
                const totalPriceDisplay = document.getElementById("totalPriceDisplay");
                const sendPrice = document.getElementById("sendPrice");

                let mainPriceText = document.getElementById("mainPrice").textContent.replace(/\D/g, '');
                let mainPrice = parseInt(mainPriceText) || 0;

                let taxText = document.getElementById("taxDisplay").textContent.replace(/\D/g, '');
                let tax = parseInt(taxText) || 0;

                const deliFee = (document.querySelector('input[name="deliver"][value="fast"]').checked) ? 25000 : 0;

                const finalTotal = mainPrice + tax + deliFee;

                sendPrice.value = finalTotal;
                totalPriceDisplay.textContent = formatNumber(finalTotal) + 'đ';
            }



            function selectDeliver(type) {
                const priceDeli = document.getElementById("priceDeli");

                const currentDate = new Date();
                const extraTime = (type === 'free') ? 6 : 3;
                currentDate.setDate(currentDate.getDate() + extraTime);
                const day = String(currentDate.getDate()).padStart(2, '0');
                const month = String(currentDate.getMonth() + 1).padStart(2, '0');
                const year = currentDate.getFullYear();
                const futureDateString = day + '/' + month + '/' + year;

                const dateDisplay = document.getElementById("dateDisplay");
                const dateSend = document.getElementById("dateSend");
                dateDisplay.textContent = 'Ngày giao hàng dự kiến: ' + futureDateString;
                dateSend.value = futureDateString;

                const deliPrice = (type === 'free') ? 0 : 25000;
                priceDeli.textContent = formatNumber(deliPrice);

                updateTotal();
            }

            function updatePrices(newQuantity) {
                const priceProduct = <%= priceProduct %>;
                const mainPrice = priceProduct * newQuantity;
                const tax = Math.round(mainPrice * 0.015);

                document.getElementById("mainPrice").textContent = formatNumber(mainPrice) + "đ";
                document.getElementById("priceDisplay").textContent = formatNumber(mainPrice) + "đ";
                document.getElementById("taxDisplay").textContent = '+ ' + formatNumber(tax) + "đ";

                updateTotal();
            }


            function decrease(btn) {
                const input = btn.parentElement.querySelector("input");
                if (parseInt(input.value) > 1) {
                    input.value = parseInt(input.value) - 1;
                    updatePrices(parseInt(input.value));
                }
            }

            function increase(btn) {
                const input = btn.parentElement.querySelector("input");
                input.value = parseInt(input.value) + 1;
                updatePrices(parseInt(input.value));
            }

            window.onload = () => {
                selectDeliver('free');
                updatePrices(<%= quantityBuy %>);
                updateTotal();
            };
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>