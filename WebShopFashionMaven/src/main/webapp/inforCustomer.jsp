<%-- 
    Document : formUserDetail
    Created on : Oct 17, 2025, 8:31:48 AM
    Author : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, 
         java.util.ArrayList, 
         com.diemxua.model.Address,
         com.diemxua.model.User,
         com.diemxua.model.UserProfile" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Thông tin cá nhân và Giao hàng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
    </head>

    <body class="bg-[#f5f0e8] min-h-screen">
        <section>
            <%@include file="navbar.jsp" %>
            <%
                com.diemxua.model.User user = (com.diemxua.model.User) request.getAttribute("user");
                com.diemxua.model.UserProfile userProfile = (com.diemxua.model.UserProfile) request.getAttribute("userProfile");
            %>
            <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

            <div class="relative pt-[100px] pb-10 w-full min-h-screen flex justify-center items-start">

                <div class="w-full max-w-xl lg:max-w-2xl mx-auto px-4 sm:px-6">

                    <form action="UserProfileServlet" method="post" 
                          class="bg-[#fdf8f3]/90 rounded-2xl p-6 sm:p-8 shadow-2xl relative z-10 space-y-6">

                        <h2 class="text-3xl font-bold text-[#4B2E17] mb-6 text-center">Chỉnh Sửa Hồ Sơ</h2>

                        <div class="space-y-4 border-b border-[#4B2E17]/10 pb-6">
                            <h3 class="text-xl sm:text-2xl font-bold text-white p-3 rounded-xl text-center bg-[#4B2E17]">
                                Thông tin cá nhân
                            </h3>

                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label for="fullname" class="block text-sm font-semibold text-gray-700 mb-1">
                                        Họ và tên (Fullname):
                                    </label>
                                    <input type="text" id="fullname" name="fullname" value="<%= userProfile.getFullName()%>" required 
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                </div>

                                <div>
                                    <label for="phone" class="block text-sm font-semibold text-gray-700 mb-1">
                                        Số điện thoại (Phone):
                                    </label>
                                    <input type="tel" id="phone" name="phone" required value="<%= userProfile.getPhone()%>"
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                </div>

                                <div>
                                    <label for="dateOfBirth" class="block text-sm font-semibold text-gray-700 mb-1">
                                        Ngày sinh (Date of Birth):
                                    </label>
                                    <input type="date" id="dateOfBirth" name="dateOfBirth" required value="<%= userProfile.getDateOfBirth()%>"
                                           class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                </div>

                                <div class="md:col-span-1">
                                    <label class="block text-sm font-semibold text-gray-700 mb-1">
                                        Giới tính (Gender):
                                    </label>
                                    <div class="flex flex-wrap gap-x-4 gap-y-2 mt-2 text-sm">
                                        <label class="flex items-center cursor-pointer text-gray-800">
                                            <input type="radio" id="male" name="gender" value="Male" 
                                                   class="mr-2 accent-[#4B2E17]"
                                                   <% if("Male".equals(userProfile.getGender())){ %> checked <% } %> />
                                            Nam
                                        </label>
                                        <label class="flex items-center cursor-pointer text-gray-800">
                                            <input type="radio" id="female" name="gender" value="Female" 
                                                   class="mr-2 accent-[#4B2E17]"
                                                   <% if("Female".equals(userProfile.getGender())){ %> checked <% } %> />
                                            Nữ
                                        </label>
                                        <label class="flex items-center cursor-pointer text-gray-800">
                                            <input type="radio" id="other" name="gender" value="Other" 
                                                   class="mr-2 accent-[#4B2E17]"
                                                   <% if("Other".equals(userProfile.getGender())){ %> checked <% } %> />
                                            Khác
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <button type="submit" 
                                    class="md:col-span-2 w-full text-lg sm:text-xl font-bold
                                    rounded-xl bg-[#C0A785] text-[#4B2E17]
                                    hover:bg-[#B3997A] transition duration-200 shadow-md">
                                Lưu thay đổi
                            </button>
                        </div>

                        <div class="space-y-4">
                            <h3 class="text-xl sm:text-2xl font-bold text-white p-3 rounded-xl text-center bg-[#4B2E17]">
                                Thông tin giao hàng
                            </h3>
                            <%
                                List<com.diemxua.model.Address> addresses = (List<com.diemxua.model.Address>) request.getAttribute("addresses");
                                for(com.diemxua.model.Address a : addresses){
                            %>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4" style="border-bottom: 2px solid #4B2E17; padding-bottom: 20px">
                                <form method="post" action="">
                                    <div class="md:col-span-2">
                                        <label for="recipientName" class="block text-sm font-semibold text-gray-700 mb-1">
                                            Tên người nhận (Recipient Name):
                                        </label>
                                        <input type="text" id="recipientName" name="recipientName" required value="<%= a.getRecipientName() %>"
                                               class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                    </div>

                                    <div>
                                        <label for="shippingPhone" class="block text-sm font-semibold text-gray-700 mb-1">
                                            Số điện thoại nhận hàng (Phone):
                                        </label>
                                        <input type="tel" id="shippingPhone" name="shippingPhone" required value="<%= a.getPhone() %>"
                                               class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                    </div>

                                    <div>
                                        <label for="country" class="block text-sm font-semibold text-gray-700 mb-1">
                                            Quốc gia (Country):
                                        </label>
                                        <input type="text" id="country" name="country" required value="<%= a.getCountry() %>"
                                               class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                    </div>

                                    <div>
                                        <label for="city" class="block text-sm font-semibold text-gray-700 mb-1">
                                            Thành phố (City):
                                        </label>
                                        <input type="text" id="city" name="city" required value="<%= a.getCity() %>"
                                               class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c]"/>
                                    </div>

                                    <div class="md:col-span-2">
                                        <label for="addressDetail" class="block text-sm font-semibold text-gray-700 mb-1">
                                            Địa chỉ chi tiết (Address Detail):
                                        </label>
                                        <textarea id="addressDetail" name="addressDetail" required rows="3"
                                                  class="w-full px-4 py-2 border border-gray-300 rounded-lg shadow-sm focus:ring-[#6a401c] focus:border-[#6a401c] resize-none"><%= a.getAddressDetail() %></textarea>
                                    </div>
                                    <button type="submit" 
                                            class="md:col-span-2 w-full text-lg sm:text-xl font-bold
                                            rounded-xl bg-[#C0A785] text-[#4B2E17]
                                            hover:bg-[#B3997A] transition duration-200 shadow-md">
                                        Lưu thay đổi
                                    </button>
                                </form>
                            </div>
                            <% } %>
                        </div>


                    </form>
                </div>
            </div>
        </section>
        <script>
            lucide.createIcons();
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
    </body>
</html>