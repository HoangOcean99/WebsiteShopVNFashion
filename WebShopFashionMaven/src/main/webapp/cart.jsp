<%--
    Document : cart
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
        <title>Giỏ Hàng & Thanh Toán</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
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
            
            /* Xóa CSS tùy chỉnh cho grid vì chúng ta sẽ dùng lớp Tailwind */
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
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 items-start">
                    
                    <div class="bg-[#fdf8f3]/90 rounded-2xl p-4 sm:p-8 shadow relative z-10 order-2 md:order-1 md:col-span-2">
                        <h2 class="text-xl sm:text-2xl font-bold mb-4">Giỏ hàng</h2>
                        <div>  
                            <% List<com.diemxua.model.Product> productsCartItems = (List<com.diemxua.model.Product>) request.getAttribute("listProductCart"); 
                            List<com.diemxua.model.CartItems> cartItems = (List<com.diemxua.model.CartItems>) request.getAttribute("cartItems");       
                            if (cartItems != null && productsCartItems != null) {
                                for(int i=0 ;i < cartItems.size(); i++){
                                    com.diemxua.model.Product productsCart = productsCartItems.get(i);
                                    com.diemxua.model.CartItems cartItem = cartItems.get(i);
                            %>
                            <div class="flex gap-3 sm:gap-[20px] p-3 border border-[#4B2E17]/20 rounded-lg mb-4 items-center">
                                
                                <form action="ChangeCartServlet" method="post" class="flex-shrink-0">
                                    <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>"></input>
                                    <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>"></input>
                                    <input type="checkbox" name="selectProduct"
                                                class="w-5 h-5 my-auto rounded-md border-2 border-[#492910]/70
                                                text-[#492910] focus:ring-[#492910]
                                                cursor-pointer" <%= cartItem.isIsSelect() ? "checked" : "" %>
                                                onchange="this.form.submit()"
                                                />
                                </form>
                                
                                <img src="<%= productsCart.getImageProduct1() %>" alt="<%= productsCart.getProductName() %>" 
                                     class="w-16 h-20 sm:w-20 sm:h-24 object-cover rounded-lg flex-shrink-0" />
                                
                                <div class="grow block min-w-0">
                                    <p class="text-base sm:text-xl font-bold pb-1 truncate"><%= productsCart.getProductName() %> </p>
                                    <p class="text-sm sm:text-lg pb-2"><%= productsCart.getFormatPrice() %>đ </p>
                                    
                                    <div class="flex flex-wrap gap-4 items-center">
                                        <form action="ChangeCartServlet" method="post" class="cart-item-form flex gap-2 items-center">
                                            <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>">
                                            <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>">

                                            <select class="border border-gray-300 rounded-full px-2 py-1 text-xs sm:text-sm focus:outline-none"
                                                         name="inputSize" 
                                                         onchange="this.form.submit()">
                                                <option value="XL" <% if("XL".equals(cartItem.getSizeCart())) {%> selected <% } %>>XL</option>
                                                <option value="L" <% if("L".equals(cartItem.getSizeCart())) {%> selected <% } %>>L</option>
                                                <option value="M" <% if("M".equals(cartItem.getSizeCart())) {%> selected <% } %>>M</option>
                                                <option value="S" <% if("S".equals(cartItem.getSizeCart())) {%> selected <% } %>>S</option>
                                            </select>

                                            <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-1 py-0.5 space-x-1 sm:space-x-2 cart-item text-sm sm:text-base">
                                                <button type="button" class="leading-none px-1 select-none" onclick="decrease(this)">-</button>
                                                <input type="number" 
                                                             value="<%= cartItem.getQuantityCart() %>" 
                                                             min="1" 
                                                             class="w-6 sm:w-8 text-center bg-transparent focus:outline-none" 
                                                             name="inputQuantity" 
                                                             data-price="<%= productsCart.getPrice() %>"/>
                                                <button type="button" class="leading-none px-1 select-none" onclick="increase(this)">+</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                
                                <div class="flex flex-col items-end flex-shrink-0">
                                    <p class="text-base sm:text-xl font-bold mb-8 sm:mb-12"><%= cartItem.getFormatPriceCart()%>đ</p>
                                    <form action="DeleteCartItemServlet" method="post">
                                        <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>"></input>
                                        <button type="submit" class="flex items-center gap-1 text-sm sm:text-base text-red-600 hover:text-red-800 transition">
                                            <i data-lucide="trash-2" class="size-4 sm:size-5"></i>
                                            <span>Xóa</span>
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <% } 
                            } else { %>
                                <p class="text-center py-10 text-gray-600">Giỏ hàng của bạn đang trống.</p>
                            <% } %>
                        </div>


                    </div>

                    <form method="post" class="order-1 md:order-2 md:col-span-1">
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
                                <span class="text-sm">Ngày giao hàng dự kiến: </span><span name id="dateDisplay" class="font-semibold text-sm"> </span>
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
                                        <input type="radio" name="payment" class="accent-[#492910]" checked value="COD">
                                        <span>Thanh toán khi nhận hàng</span>
                                    </label>
                                    <label class="flex items-center space-x-2">
                                        <input type="radio" name="payment" class="accent-[#492910]" value="vnpay">
                                        <span>Thanh toán bằng MoMo</span>
                                    </label>
                                </div>
                            </div>

                            <% long mainPrice = (request.getAttribute("mainPrice") != null) ? (long) request.getAttribute("mainPrice") : 0;
                                String priceString = (String) request.getAttribute("priceString");
                                String taxString = (String) request.getAttribute("taxString");
                                long totalPrice = (request.getAttribute("totalPrice") != null) ? (long) request.getAttribute("totalPrice") : 0;
                            %>
                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 text-sm">
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
                                <div class="flex justify-between text-base font-bold mt-2 sm:text-lg">
                                    <p>Tổng tiền: </p>
                                    <p id="totalPriceDisplay"><%= totalPrice %>đ</p>
                                </div>

                                <input type="hidden" name="totalBill" id="sendPrice" value="0">
                                <input type="hidden" name="type" value="cart">
                                
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
                    </form>
                </div>

            </div>

        </section>
        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;

// Xử lý toggle form thêm địa chỉ
            const addAddressBtn = document.getElementById("addAddressBtn");
            const newAddressForm = document.getElementById("newAddressForm");
            const addressInputs = newAddressForm.querySelectorAll('input, textarea');
            const addressSelect = document.getElementById("addressSelect");


            function toggleAddressRequired(enable) {
                addressInputs.forEach(input => {
                    if (enable) {
                        input.setAttribute('required', 'required');
                        // Nếu đang thêm địa chỉ mới, bỏ chọn địa chỉ cũ
                        addressSelect.value = '';
                    } else {
                        input.removeAttribute('required');
                    }
                });
            }

            addAddressBtn.onclick = (e) => {
                e.preventDefault(); // Ngăn chặn hành vi submit mặc định của nút trong form
                newAddressForm.classList.toggle("hidden");
                const isHidden = newAddressForm.classList.contains("hidden");
                toggleAddressRequired(!isHidden);
            };

            window.addEventListener('DOMContentLoaded', () => {
                // Đảm bảo trạng thái ban đầu của required fields
                if (newAddressForm.classList.contains("hidden")) {
                    toggleAddressRequired(false);
                }
            });

            // Hàm đã giữ nguyên logic tính toán của bạn
            function updateTotal() {
                const priceDeli = document.getElementById("priceDeli");
                const totalPriceDisplay = document.getElementById("totalPriceDisplay");
                const sendPrice = document.getElementById("sendPrice");
                let subtotal = <%= mainPrice %>; // Lấy mainPrice làm giá trị ban đầu

                const deliText = priceDeli.textContent.replace(/\./g, '').replace('₫', '');
                const deli = parseInt(deliText) || 0;
                
                // Giữ nguyên logic tính toán của bạn cho totalPrice
                let finalTotal;
                if (document.querySelector('input[name="deliver"][value="fast"]').checked) {
                    finalTotal = <%= totalPrice %> + 25000;
                } else {
                     finalTotal = <%= totalPrice %>;
                }

                sendPrice.value = finalTotal;
                totalPriceDisplay.textContent = finalTotal.toLocaleString('vi-VN') + 'đ';
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
                dateDisplay.textContent = futureDateString;
                dateSend.value = futureDateString;
                
                const deliPrice = (type === 'free') ? '0' : '25.000';
                priceDeli.textContent = deliPrice;
                
                updateTotal();
            }

            // Hàm đã giữ nguyên logic quantity của bạn
            function decrease(btn) {
                const form = btn.closest('.cart-item-form');
                const input = form.querySelector('input[name="inputQuantity"]');
                if (parseInt(input.value) > 1)
                    input.value--;
                form.submit(); // gửi số lượng mới về server
            }

            function increase(btn) {
                const form = btn.closest('.cart-item-form');
                const input = form.querySelector('input[name="inputQuantity"]');
                input.value++;
                form.submit(); // gửi số lượng mới về server
            }


            window.onload = () => {
                selectDeliver('free');
                updateTotal();
            };
        </script>

        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>