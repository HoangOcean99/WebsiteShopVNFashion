<%-- 
    Document   : formUserDetail
    Created on : Oct 17, 2025, 8:31:48 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/cart.css" />
        <script src="jscript/javascript.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin cá nhân và Giao hàng</title>
    </head>
    <body>
        <section>
            <%@include file="navbar.jsp" %>
            <div class="absolute top-[120px] left-0 w-full h-full">
                <div class="grid gap-6 w-2/5 mx-auto items-stretch">
                    <img src="images/Background3.png" alt="Trang chủ" class="w-full h-full object-cover fixed inset-0 -z-10" />

                    <form action="UserProfileServlet" method="post" class="align-items bg-[#fdf8f3]/60 rounded-2xl p-6 shadow relative z-10">

                        <h2 class="text-2xl font-bold mb-4">Thông Tin Khách Hàng</h2>
                        <div>
                            <div class="p-6">
                                <h2 class="text-2xl font-bold flex justify-around align-items items-center  border border-gray-600 rounded-2xl w-full h-full bg-[#4B2E17] text-white">Thông tin cá nhân</h2>

                                <div class="space-y-4">

                                    <div>
                                        <label for="fullname" class="block text-sm font-medium text-gray-800 m-1">
                                            Họ và tên (Fullname):
                                        </label>
                                        <input type="text" id="fullname" name="fullname" required 
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="phone" class="block text-sm font-medium text-gray-800 mb-1">
                                            Số điện thoại (Phone):
                                        </label>
                                        <input type="tel" id="phone" name="phone" required 
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="dateOfBirth" class="block text-sm font-medium text-gray-800 mb-1">
                                            Ngày sinh (Date of Birth):
                                        </label>
                                        <input type="date" id="dateOfBirth" name="dateOfBirth" required 
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label class="block text-sm font-medium text-gray-800 mb-1">
                                            Giới tính (Gender):
                                        </label>
                                        <div class="flex items-center gap-6 mt-2">

                                            <label class="flex items-center cursor-pointer">
                                                <input type="radio" id="male" name="gender" value="Male" checked 
                                                       class="mr-2 text-[#6a401c] focus:ring-[#6a401c]">
                                                Nam
                                            </label>

                                            <label class="flex items-center cursor-pointer">
                                                <input type="radio" id="female" name="gender" value="Female" 
                                                       class="mr-2 text-[#6a401c] focus:ring-[#6a401c]">
                                                Nữ
                                            </label>

                                            <label class="flex items-center cursor-pointer">
                                                <input type="radio" id="other" name="gender" value="Other" 
                                                       class="mr-2 text-[#6a401c] focus:ring-[#6a401c]">
                                                Khác
                                            </label>

                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div  class="p-6">

                                <h2 class="text-2xl font-bold flex justify-center align-items items-center  border border-gray-600 rounded-2xl w-full h-full bg-[#4B2E17]/90 text-white">Thông tin giao hàng</h2>

                                <div class="space-y-4">

                                    <div>
                                        <label for="recipientName" class="block text-sm font-medium text-gray-800 m-1">
                                            Tên người nhận (Recipient Name):
                                        </label>
                                        <input type="text" id="recipientName" name="recipientName" required
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="shippingPhone" class="block text-sm font-medium text-gray-800 mb-1">
                                            Số điện thoại nhận hàng (Phone):
                                        </label>
                                        <input type="tel" id="shippingPhone" name="shippingPhone" required
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="country" class="block text-sm font-medium text-gray-800 mb-1">
                                            Quốc gia (Country):
                                        </label>
                                        <input type="text" id="country" name="country" required
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="city" class="block text-sm font-medium text-gray-800 mb-1">
                                            Thành phố (City):
                                        </label>
                                        <input type="text" id="city" name="city" required
                                               class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                               focus:outline-none focus:ring-2 focus:ring-[#6a401c]">
                                    </div>

                                    <div>
                                        <label for="addressDetail" class="block text-sm font-medium text-gray-800 mb-1">
                                            Địa chỉ chi tiết (Address Detail):
                                        </label>
                                        <textarea id="addressDetail" name="addressDetail" required rows="4"
                                                  class="w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm
                                                  focus:outline-none focus:ring-2 focus:ring-[#6a401c]"></textarea>
                                    </div>

                                </div>
                            </div>
                            <div class="pt-4 flex justify-center">
                                <button type="submit"
                                        class="text-md font-bold text-white bg-[#4B2E17]/90 rounded-2xl shadow-lg
                                        px-10 py-3 transition-colors duration-200 hover:bg-[#6a401c]">
                                    Lưu thay đổi
                                </button>
                            </div>
                        </div>
                </div>

                </form>
            </div>
        </div>
    </section>
</body>
</html>
