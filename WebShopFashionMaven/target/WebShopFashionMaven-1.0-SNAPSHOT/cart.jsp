<%-- 
    Document   : cart
    Created on : Oct 9, 2025, 8:51:03 PM
    Author     : Admin
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
        <style>
            .deliverOption {
                display: flex;
                align-items: center;
                gap: 6px;
                padding: 10px 16px;
                border-radius: 10px;
                /*border: 2px solid #492910;*/
                cursor: pointer;
                user-select: none;
                transition: 0.2s;
            }

            input[type="radio"]:checked + label,
            .deliverOption:hover {
                background-color: #49291010;
                border-color: #492910;
            }
        </style>

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
                        <h2 class="text-2xl font-bold mb-4">Giỏ hàng</h2>
                        <div>  
                            <% List<com.diemxua.model.Product> productsCartItems = (List<com.diemxua.model.Product>) request.getAttribute("listProductCart"); 
                            List<com.diemxua.model.CartItems> cartItems = (List<com.diemxua.model.CartItems>) request.getAttribute("cartItems");                                 
                            for(int i=0 ;i < cartItems.size(); i++){
                                com.diemxua.model.Product productsCart = productsCartItems.get(i);
                                com.diemxua.model.CartItems cartItem = cartItems.get(i);
                            %>
                            <div class="flex gap-[20px] p-2 border border-[#4B2E17]-2000 rounded-lg mb-2">
                                <form action="ChangeCartServlet" method="post">
                                    <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>"></input>
                                    <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>"></input>
                                    <input type="checkbox" name="selectProduct"
                                           class="w-5 h-5 my-auto rounded-md border-2 border-[#492910]/70
                                           text-[#492910] focus:ring-[#492910]
                                           cursor-pointer" <%= cartItem.isIsSelect() ? "checked" : "" %>
                                           onchange="this.form.submit()"
                                           />
                                </form>
                                <img src="<%= productsCart.getImageProduct1() %>" art="<%= productsCart.getProductName() %>" class="w-25 h-52 bg-gray-400 rounded-2xl" />
                                <div class="grow block">
                                    <p class="text-2xl font-bold pb-2"><%= productsCart.getProductName() %> </p>
                                    <p class="text-xl pb-2"> <%= productsCart.getFormatPrice() %>đ </p>
                                    <div class="flex gap-6">
                                        <form action="ChangeCartServlet" method="post">
                                            <button class="flex space-x-3 " type="button">
                                                <select class="border border-gray-300 rounded-full px-2 py-1 text-sm focus:outline-none"
                                                        name="inputSize" 
                                                        onchange="this.form.submit()">
                                                    <option value="XL" <% if("XL".equals(cartItem.getSizeCart())) {%> selected <% } %>>XL</option>
                                                    <option value="L" <% if("L".equals(cartItem.getSizeCart())) {%> selected <% } %>>L</option>
                                                    <option value="M" <% if("M".equals(cartItem.getSizeCart())) {%> selected <% } %>>M</option>
                                                    <option value="S" <% if("S".equals(cartItem.getSizeCart())) {%> selected <% } %>>S</option>
                                                </select>
                                            </button>
                                            <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>"></input>
                                            <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>"></input>
                                            <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-2 py-1 space-x-2">
                                                <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-2 py-1 space-x-2">
                                                    <button type="button" class="text-lg leading-none px-2 select-none" onclick="decrease(this)">-</button>
                                                    <input type="number" value="<%= quantityBuy %>" min="1" class="w-8 text-center bg-transparent" name="inputQuantity" />
                                                    <button type="button" class="text-lg leading-none select-none" onclick="increase(this)">+</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <form action="DeleteCartItemServlet" method="post">
                                    <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>"></input>
                                    <p class="text-2xl font-bold pb-12"><%= cartItem.getFormatPriceCart()%>đ</p>
                                    <div class="flex gap-2 ">
                                        <i data-lucide="trash-2" class="size-5"></i>
                                        <input type="submit" class="text-md cursor-pointer" value="Delete">
                                    </div>
                                </form>
                            </div>
                            <% } %>
                        </div>


                    </div>

                    <form method="post">
                        <div class="bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">
                            <h2 class="text-xl font-bold mb-4">Thông tin vận chuyển</h2>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <div class="border border-[#492910]/60 bg-[#a29992]/80 rounded-xl flex w-fit leading-height space-x-3 px-2 py-1 mb-2">
                                    <label class="deliverOption">
                                        <input type="radio" name="deliver" value="free" checked onclick="selectDeliver('free')">
                                        Free
                                    </label>

<<<<<<< HEAD
                                    <label class="deliverOption">
                                        <input type="radio" name="deliver" value="fast" onclick="selectDeliver('fast')">
                                        Express (25.000₫)
                                    </label>
                                </div>
                                <span>Ngày giao hàng dự kiến: </span><span name id="dateDisplay"> </span>
                                <input type="hidden" name="dateSend" id="dateSend">
=======
                                <label class="deliverOption">
                                    <input type="radio" name="deliver" value="fast" onclick="selectDeliver('fast')">
                                    Express (25.000₫)
                                </label>
                            </div>
                            <p id="dateDisplay">Ngày giao hàng dự kiến: </p>
                        </div>

                        <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                            <h3 class="font-bold mb-2">Địa chỉ giao hàng</h3>
                            <div class="flex space-x-2 items-center">
                                <select id="addressSelect"
                                        class="w-full border border-[#492910]/60 bg-[#ffffff]/60 rounded-xl px-3 py-2 focus:ring-1 focus:ring-[#492910] focus:outline-none">
                                    <option value="">-- Chọn thông tin nhận hàng --</option>
                                    <% 
                                        List<com.diemxua.model.Address> listAddress = (List<com.diemxua.model.Address>) request.getAttribute("listAddress");
                                        for(com.diemxua.model.Address a : listAddress){
                                    %>
                                    <option value="<%= a.getAddressID() %>"><%= a.getRecipientName() +" - "+ a.getPhone() +" - "+  a.getAddressDetail() +" - "+  a.getCity() %></option>
                                    <% } %>
                                </select>
                                <button id="addAddressBtn" class="border border-[#492910]/60 rounded-xl px-3 py-2 hover:bg-[#fdf8f3]/70 focus:ring-1 focus:ring-[#492910]">
                                    Thêmoc
                                </button>
>>>>>>> feature/category-page
                            </div>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <h3 class="font-bold mb-2">Địa chỉ giao hàng</h3>
                                <div class="flex space-x-2 items-center">
                                    <select id="addressSelect"
                                            name="addressSelect"
                                            class="w-full border border-[#492910]/60 bg-[#ffffff]/60 rounded-xl px-3 py-2 focus:ring-1 focus:ring-[#492910] focus:outline-none">
                                        <% 
                                            List<com.diemxua.model.Address> listAddress = (List<com.diemxua.model.Address>) request.getAttribute("listAddress");
                                            for(com.diemxua.model.Address a : listAddress){
                                        %>
                                        <option value="<%= a.getAddressID() %>"><%= a.getRecipientName() +" - "+ a.getPhone() +" - "+  a.getAddressDetail() +" - "+  a.getCity() %></option>
                                        <% } %>
                                    </select>
                                    <button id="addAddressBtn" class="border border-[#492910]/60 rounded-xl px-3 py-2 hover:bg-[#fdf8f3]/70 focus:ring-1 focus:ring-[#492910]">
                                        Thêm
                                    </button>
                                </div>

                                <div id="newAddressForm" class="mt-3 hidden">
                                    <input name="newRecipientName" type="text" placeholder="Tên người nhận (Recipient Name)..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910] focus:outline-none" required="true" />
                                    <input name="newPhone" type="text" placeholder="Số điện thoại nhận hàng (Phone)..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910] focus:outline-none" required="true" />
                                    <input name="newCountry" placeholder="Quốc gia (Country)..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910] focus:outline-none" required="true"></input>
                                    <input name="newCity" placeholder="Thành phố (City)..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910] focus:outline-none" required="true"></input>
                                    <textarea name="newDetailAddress" placeholder="Địa chỉ chi tiết (Address Detail)..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910] focus:outline-none" required="true"></textarea>

                                    <button formaction="AdminAddAddressServlet" type="submit" class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 bg-[#a29992]/70 hover:bg-[#a29992]/90 font-semibold focus:ring-1 focus:ring-[#492910]">
                                        Save Address
                                    </button>
                                </div>
                            </div>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <h3 class="font-bold mb-2">Hình thức thành toán</h3>
                                <div class="space-y-2">
                                    <label class="flex items-center space-x-2">
                                        <input type="radio" name="payment" class="accent-[#492910]" checked value="COD">
                                        <span>Thanh toán khi nhận hàng</span>
                                    </label>
                                    <label class="flex items-center space-x-2">
                                        <input type="radio" name="payment" class="accent-[#492910]" value="vnpay">
                                        <span>Thanh toán bằng MoMo</span>
                                    </label>
                                </div>
                            </div>

                            <% long mainPrice = (long) request.getAttribute("mainPrice");
                                String priceString = (String) request.getAttribute("priceString");
                                String taxString = (String) request.getAttribute("taxString");
                                long totalPrice = (long) request.getAttribute("totalPrice");
                            %>
                            <div class="block border-b border-dotted border-[#492910]/100 pb-4">
                                <div class="flex justify-between">
                                    <p>Giá gốc: </p>
                                    <p><%= priceString %>đ</p>
                                </div>
                                <div class="flex justify-between">
                                    <p>Phí giao hàng: </p>
                                    <p>+ <span id="priceDeli">0</span>đ</p>
                                </div>
                                <div class="flex justify-between">
                                    <p>Thuế (1.5%):</p>
                                    <p>+ <%= taxString %>đ</p>
                                </div>
                            </div>

                            <div>
                                <div class="flex justify-between text-md font-bold mt-2">
                                    <p>Tổng tiền: </p>
                                    <p id="totalPriceDisplay">0đ</p>
                                </div>

                                <input type="hidden" name="totalBill" id="sendPrice" value="0">
                                <input type="hidden" name="type" id="sendPrice" value="cart">
                                <button 
                                    formaction="ajaxServlet"
                                    type="submit"
                                    class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 my-4
                                    hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                    Mua
                                </button>
                                <button 
                                    type="button" 
                                    onclick="window.location.href = 'ProductServlet?categoryId=1'" 
                                    class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 mb-2
                                    hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">
                                    Tiếp tục mua hàng
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;

// Xử lý toggle form thêm địa chỉ
            const addAddressBtn = document.getElementById("addAddressBtn");
            const newAddressForm = document.getElementById("newAddressForm");
            const addressInputs = newAddressForm.querySelectorAll('input, textarea');

            function toggleAddressRequired(enable) {
                addressInputs.forEach(input => {
                    if (enable) {
                        input.setAttribute('required', 'required');
                    } else {
                        input.removeAttribute('required');
                    }
                });
            }

            addAddressBtn.onclick = () => {
                newAddressForm.classList.toggle("hidden");
                const isHidden = newAddressForm.classList.contains("hidden");
                toggleAddressRequired(!isHidden);
            };

            window.addEventListener('DOMContentLoaded', () => {
                if (newAddressForm.classList.contains("hidden")) {
                    toggleAddressRequired(false);
                }
            });

// Tổng tiền
            function updateTotal() {
                const priceDeli = document.getElementById("priceDeli");
                const totalPriceDisplay = document.getElementById("totalPriceDisplay");
                const sendPrice = document.getElementById("sendPrice");
                let subtotal = 0;

                // Cộng tổng tất cả sản phẩm được chọn
                document.querySelectorAll('.cart-item').forEach(div => {
                    const qty = parseInt(div.querySelector('input[name="inputQuantity"]').value);
                    const price = parseInt(div.querySelector('.priceCart').dataset.price);
                    subtotal += qty * price;
                });

                const deli = parseInt(priceDeli.textContent.replace(/\./g, '').replace('đ', '')) || 0;
                const total = subtotal + deli;
                sendPrice.value = total;
                totalPriceDisplay.textContent = total.toLocaleString('vi-VN') + 'đ';
            }

// Chọn hình thức giao hàng
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
                dateDisplay.textContent = futureDateString;
                dateSend.value = futureDateString;
                priceDeli.textContent = (type === 'free') ? '0' : '25.000';
                updateTotal();
            }

            function decrease(btn) {
                const input = btn.parentElement.querySelector("input");
                if (input.value > 1)
                    input.value--;
                const mainPrice = <%= priceProduct %> * input.value;
                document.getElementById("mainPrice").textContent = mainPrice.toLocaleString('vi-VN') + "đ";
                updateTotal();
            }

            function increase(btn) {
                const input = btn.parentElement.querySelector("input");
                input.value++;
                const mainPrice = <%= priceProduct %> * input.value;
                document.getElementById("mainPrice").textContent = mainPrice.toLocaleString('vi-VN') + "đ";
                updateTotal();
            }

// Khởi tạo khi load trang
            window.onload = () => {
                selectDeliver('free');
                updateTotal();
            };
        </script>

        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>