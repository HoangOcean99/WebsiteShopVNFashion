<%-- 
    Document   : cart
    Created on : Oct 9, 2025, 8:51:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.Product, com.diemxua.model.CartItems, com.diemxua.model.Address" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Giỏ hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
        <style>
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
            input[type="radio"]:checked + label, .deliverOption:hover {
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

                    <!-- Bảng Giỏ hàng -->
                    <div class="bg-[#fdf8f3]/60 rounded-2xl p-8 shadow relative z-10">
                        <h2 class="text-2xl font-bold mb-4">Giỏ hàng</h2>
                        <div>
                            <% 
                                List<Product> productsCartItems = (List<Product>) request.getAttribute("listProductCart");
                                List<CartItems> cartItems = (List<CartItems>) request.getAttribute("cartItems");
                                for(int i=0; i<cartItems.size(); i++){
                                    Product productsCart = productsCartItems.get(i);
                                    CartItems cartItem = cartItems.get(i);
                            %>
                            <div class="flex gap-[20px] p-2 border border-[#4B2E17]-2000 rounded-lg mb-2 cart-item">
                                <form action="ChangeCartServlet" method="post">
                                    <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>" />
                                    <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>" />
                                    <input type="checkbox" name="selectProduct"
                                           class="w-5 h-5 my-auto rounded-md border-2 border-[#492910]/70 text-[#492910] focus:ring-[#492910] cursor-pointer"
                                           <%= cartItem.isIsSelect() ? "checked" : "" %> onchange="this.form.submit()" />
                                </form>

                                <img src="<%= productsCart.getImageProduct1() %>" alt="<%= productsCart.getProductName() %>" class="w-25 h-52 bg-gray-400 rounded-2xl" />

                                <div class="grow block">
                                    <p class="text-2xl font-bold pb-2"><%= productsCart.getProductName() %></p>
                                    <p class="text-xl pb-2"><%= productsCart.getFormatPrice() %>đ</p>

                                    <div class="flex gap-6">
                                        <form action="ChangeCartServlet" method="post">
                                            <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>" />
                                            <input type="hidden" name="ProductID" value="<%= productsCart.getProductID() %>" />

                                            <div class="flex border border-gray bg-[#fdf8f3] w-fit rounded-full px-2 py-1 space-x-2">
                                                <button type="button" class="text-lg leading-none px-2 select-none" onclick="decrease(this)">-</button>
                                                <input type="number" value="<%= cartItem.getQuantityCart() %>" min="1" class="w-8 text-center bg-transparent" name="inputQuantity" />
                                                <button type="button" class="text-lg leading-none select-none" onclick="increase(this)">+</button>
                                            </div>

                                            <!-- Giá sản phẩm dùng cho JS tính toán -->
                                            <input type="hidden" class="priceCart" data-price="<%= productsCart.getPrice() %>" />
                                        </form>
                                    </div>
                                </div>

                                <form action="DeleteCartItemServlet" method="post">
                                    <input type="hidden" name="CartItemID" value="<%= cartItem.getCartItemId() %>" />
                                    <p class="text-2xl font-bold pb-12"><%= cartItem.getFormatPriceCart() %>đ</p>
                                    <div class="flex gap-2">
                                        <i data-lucide="trash-2" class="size-5"></i>
                                        <input type="submit" class="text-md cursor-pointer" value="Delete">
                                    </div>
                                </form>
                            </div>
                            <% } %>
                        </div>
                    </div>

                    <!-- Bảng Thông tin vận chuyển -->
                    <form method="post">
                        <div class="bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">
                            <h2 class="text-xl font-bold mb-4">Thông tin vận chuyển</h2>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <div class="border border-[#492910]/60 bg-[#a29992]/80 rounded-xl flex w-fit leading-height space-x-3 px-2 py-1 mb-2">
                                    <label class="deliverOption">
                                        <input type="radio" name="deliver" value="free" checked onclick="selectDeliver('free')">
                                        Free
                                    </label>

                                    <label class="deliverOption">
                                        <input type="radio" name="deliver" value="fast" onclick="selectDeliver('fast')">
                                        Express (25.000₫)
                                    </label>
                                </div>
                                <span>Ngày giao hàng dự kiến: </span><span id="dateDisplay"> </span>
                                <input type="hidden" name="dateSend" id="dateSend">
                            </div>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <h3 class="font-bold mb-2">Địa chỉ giao hàng</h3>
                                <div class="flex space-x-2 items-center">
                                    <select id="addressSelect" name="addressSelect" class="w-full border border-[#492910]/60 bg-[#ffffff]/60 rounded-xl px-3 py-2 focus:ring-1 focus:ring-[#492910] focus:outline-none">
                                        <%
                                            List<Address> addresses = (List<Address>) request.getAttribute("listAddress");
                                            if(addresses != null){
                                                for(Address a : addresses){
                                        %>
                                        <option value="<%= a.getAddressID() %>"><%= a.getRecipientName() + " - " + a.getPhone() + " - " + a.getAddressDetail() + " - " + a.getCity() %></option>
                                        <% } } %>
                                    </select>
                                    <button id="addAddressBtn" class="border border-[#492910]/60 rounded-xl px-3 py-2 hover:bg-[#fdf8f3]/70 focus:ring-1 focus:ring-[#492910]">Thêm</button>
                                </div>

                                <div id="newAddressForm" class="mt-3 hidden">
                                    <input name="newRecipientName" type="text" placeholder="Tên người nhận..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910]" required />
                                    <input name="newPhone" type="text" placeholder="Số điện thoại..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910]" required />
                                    <input name="newCountry" placeholder="Quốc gia..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910]" required />
                                    <input name="newCity" placeholder="Thành phố..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910]" required />
                                    <textarea name="newDetailAddress" placeholder="Địa chỉ chi tiết..." class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 mb-2 focus:ring-1 focus:ring-[#492910]" required></textarea>
                                    <button formaction="AdminAddAddressServlet" type="submit" class="w-full border border-[#492910]/60 rounded-xl px-3 py-2 bg-[#a29992]/70 hover:bg-[#a29992]/90 font-semibold focus:ring-1 focus:ring-[#492910]">Save Address</button>
                                </div>
                            </div>

                            <div class="block border-b border-dotted border-[#492910]/100 pb-4 mb-4">
                                <h3 class="font-bold mb-2">Hình thức thanh toán</h3>
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

                            <% 
                                long mainPrice = (long) request.getAttribute("mainPrice");
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
                                <input type="hidden" name="type" id="sendType" value="cart">
                                <button formaction="ajaxServlet" type="submit" class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 my-4 hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">Mua</button>
                                <button type="button" onclick="window.location.href = 'ProductServlet?categoryId=1'" class="w-full text-center font-bold border border-[#492910]/60 rounded-2xl px-2 py-2 mb-2 hover:bg-[#fdf8f3]/50 focus:bg-[#fdf8f3]/80 focus:outline-none focus:ring-1 focus:ring-[#492910]">Tiếp tục mua hàng</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </section>

        <script>
            lucide.createIcons();
            const isServerAuthenticated = <%= isAuthenticated %>;

            // Toggle form thêm địa chỉ
            const addAddressBtn = document.getElementById("addAddressBtn");
            const newAddressForm = document.getElementById("newAddressForm");
            const addressInputs = newAddressForm.querySelectorAll('input, textarea');

            function toggleAddressRequired(enable) {
                addressInputs.forEach(input => enable ? input.setAttribute('required', 'required') : input.removeAttribute('required'));
            }

            addAddressBtn.onclick = () => {
                newAddressForm.classList.toggle("hidden");
                toggleAddressRequired(!newAddressForm.classList.contains("hidden"));
            };

            window.addEventListener('DOMContentLoaded', () => {
                if (newAddressForm.classList.contains("hidden"))
                    toggleAddressRequired(false);
            });

            // Tổng tiền
            function updateTotal() {
                const priceDeli = parseInt(document.getElementById("priceDeli").textContent.replace(/\./g, '').replace('đ', '')) || 0;
                let total = 0;
                document.querySelectorAll('.cart-item').forEach(item => {
                    const qty = parseInt(item.querySelector('input[name="inputQuantity"]').value);
                    const price = parseInt(item.querySelector('.priceCart').dataset.price);
                    total += qty * price;
                });
                total += priceDeli;
                document.getElementById('sendPrice').value = total;
                document.getElementById('totalPriceDisplay').textContent = total.toLocaleString('vi-VN') + 'đ';
            }

            // Chọn hình thức giao hàng
            function selectDeliver(type) {
                const priceDeliElem = document.getElementById('priceDeli');
                const currentDate = new Date();
                const extraTime = type === 'free' ? 6 : 3;
                currentDate.setDate(currentDate.getDate() + extraTime);
                const day = String(currentDate.getDate()).padStart(2, '0');
                const month = String(currentDate.getMonth() + 1).padStart(2, '0');
                const year = currentDate.getFullYear();
                document.getElementById('dateDisplay').textContent = day + '/' + month + '/' + year;
                document.getElementById('dateSend').value = day + '/' + month + '/' + year;
                priceDeliElem.textContent = type === 'free' ? '0' : '25.000';
                updateTotal();
            }

            // Nút + / -
            function decrease(btn) {
                const input = btn.parentElement.querySelector('input[name="inputQuantity"]');
                if (input.value > 1)
                    input.value--;
                updateTotal();
            }
            function increase(btn) {
                const input = btn.parentElement.querySelector('input[name="inputQuantity"]');
                input.value++;
                updateTotal();
            }

            // Khi load trang
            window.onload = () => {
                selectDeliver('free');
                updateTotal();
            };
        </script>

        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>
