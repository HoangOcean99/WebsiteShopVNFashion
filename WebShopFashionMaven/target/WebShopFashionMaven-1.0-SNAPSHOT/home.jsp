<%-- 
    Document : home
    Created on : Oct 3, 2025, 9:11:41 AM
    Author : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Trang Chủ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://unpkg.com/lucide@latest"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/9.6.0/firebase-auth-compat.js"></script>
        <link rel="stylesheet" href="css/home.css" />
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
        <style>
            .scroll-hide::-webkit-scrollbar {
                display: none;
            }
            .scroll-hide {
                -ms-overflow-style: none; /* IE and Edge */
                scrollbar-width: none; /* Firefox */
            }
        </style>
    </head>

    <body>  
        <%
            boolean doneUserDetail = session.getAttribute("doneUserDetail") != null && (Boolean) session.getAttribute("doneUserDetail");
        %>
        <%
            // Khai báo biến isAuthenticated (FIXED: Đảm bảo biến được định nghĩa)
            boolean isAuthenticated = session.getAttribute("isAuthenticated") != null && (Boolean) session.getAttribute("isAuthenticated");
        %>

        <div class="fixed inset-0 w-full h-full bg-black/40 z-50 flex justify-center items-center hidden" id="login-modal">
            <%@include file="login.jsp" %>
        </div>    

        <%@include file="search.jsp" %>
        <%@include file="navbar.jsp" %>

        <section
            id="home"
            class="w-full min-h-screen bg-[url('images/Trangchu.png')] bg-cover bg-center bg-fixed overflow-hidden pt-16 lg:pt-0"
            >
            <img
                src="images/cloudLeft.png"
                alt="cloundLeft"
                class="absolute top-0 left-0 h-2/3 w-auto animate-cloud-left"
                />

            <img
                src="images/cloudRight.png"
                alt="cloundRight"
                class="absolute top-0 right-0 h-2/3 w-auto animate-cloud-right"
                />
        </section>

        <section id="category" class="w-full min-h-screen bg-[url('images/Background3.png')] bg-cover bg-center bg-no-repeat shadow-lg bg-fixed overflow-hidden">
            <h2
                class="justify-center text-center text-xl sm:text-2xl font-bold underline text-brown-800 pt-10 pb-10 sm:p-20"
                >
                Danh Mục
            </h2>

            <div class="flex overflow-x-auto scroll-hide whitespace-nowrap justify-start lg:justify-center mb-10 lg:mb-40 px-4 lg:px-0">

                <div class="text-center cursor-pointer flex-shrink-0 w-64 sm:w-80 mx-4 lg:mx-0 lg:ml-0" 
                     onclick="window.location.href = 'ProductServlet?categoryId=1'">
                    <img
                        src="images/AoGiaoLinh.jpg"
                        alt="AoGiaoLinh"
                        class="w-full h-[300px] sm:h-[420px] object-cover rounded-lg shadow-2xl"
                        />
                    <h3 class="mt-4 text-lg sm:text-xl font-bold text-brown-800">Áo Giao Lĩnh</h3>
                </div>

                <div class="text-center cursor-pointer flex-shrink-0 w-64 sm:w-80 mx-4" 
                     onclick="window.location.href = 'ProductServlet?categoryId=2'">
                    <img
                        src="images/VienLinh.jpg"
                        alt="VienLinh"
                        class="w-full h-[300px] sm:h-[420px] object-cover rounded-lg shadow-2xl"
                        />
                    <h3 class="mt-4 text-lg sm:text-xl font-bold text-brown-1000">Áo Viên Lĩnh</h3>
                </div>

                <div class="text-center cursor-pointer flex-shrink-0 w-64 sm:w-80 mx-4 lg:mx-0 lg:mr-0" 
                     onclick="window.location.href = 'ProductServlet?categoryId=4'">
                    <img
                        src="images/AoTacNu.jpg"
                        alt="AoTacNu"
                        class="w-full h-[300px] sm:h-[420px] object-cover rounded-lg shadow-2xl"
                        />
                    <h3 class="mt-4 text-lg sm:text-xl font-bold text-brown-800">Áo Tấc Nữ</h3>
                </div>

            </div>

            <div class="relative w-full h-[500px] sm:h-[800px] overflow-hidden object-cover z-10" id="feedback">
                <div class="slide" style="background-image: url('images/f1.jpg')"></div>
                <div class="slide" style="background-image: url('images/f2.jpg')"></div>
                <div class="slide" style="background-image: url('images/f3.jpg')"></div>
                <div class="slide" style="background-image: url('images/f4.jpg')"></div>

                <div
                    class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-white text-3xl sm:text-5xl font-bold drop-shadow-lg text-center"
                    >
                    FEEDBACK
                </div>
            </div>
        </section>

        <footer class="bg-[#4B2E17] text-white py-8 sm:py-10 overflow-hidden" id="footer">
            <div
                class="container mx-auto px-6 md:px-12 flex flex-col md:flex-row justify-between items-center md:items-start gap-8"
                >
                <div class="text-center md:text-left order-1 md:order-none">
                    <img src="images/lgo.png" alt="logo" class="w-20 h-16 sm:w-30 sm:h-20 object-cover mx-auto md:mx-0" />
                    <p class="text-sm text-gray-300 max-w-sm mt-2">
                        Hành trình tìm lại hương sắc Việt
                    </p>
                </div>

                <div class="flex flex-col sm:flex-row sm:gap-6 text-sm order-3 md:order-none space-y-2 sm:space-y-0 text-center">
                    <a href="#home" class="hover:text-yellow-400 transition">Giới thiệu</a>
                    <a href="#category" class="hover:text-yellow-400 transition">Danh mục</a>
                    <a href="#feedback" class="hover:text-yellow-400 transition">Feedback</a>
                    <a href="#footer" class="hover:text-yellow-400 transition">Liên hệ</a>
                </div>

                <div class="flex gap-4 order-2 md:order-none">
                    <i
                        data-lucide="facebook "
                        class="w-6 h-6 hover:text-yellow-400 cursor-pointer"
                        ></i>
                    <i
                        data-lucide="instagram "
                        class="w-6 h-6 hover:text-yellow-400 cursor-pointer"
                        ></i>
                    <i
                        data-lucide="mail "
                        class="w-6 h-6 hover:text-yellow-400 cursor-pointer"
                        ></i>
                </div>
            </div>

            <div
                class="border-t border-gray-600 mt-8 pt-4 text-center text-sm text-gray-400"
                >
                © 2025 Diễm Xưa. All rights reserved.
            </div>
        </footer>

        <script>
            lucide.createIcons();

            const isServerAuthenticated = <%= isAuthenticated %>;
            const doneUserDetail = <%= doneUserDetail %>;
            const contextPath = '<%= request.getContextPath() %>';

            // Gỡ bỏ logic cũ trong DOMContentLoaded và chuyển sang handleUI.js và handleAuth.js
            // Giữ nguyên phần liên quan đến modal nếu bạn không muốn chuyển ra file ngoài.
            document.addEventListener('DOMContentLoaded', function () {
                const loginModal = document.getElementById("login-modal");
                const searchModal = document.getElementById("search-modal");
                const loginButton = document.getElementById("login-button");
                const searchButton = document.getElementById("search-button");

                const urlParams = new URLSearchParams(window.location.search);
                const shouldShowLogin = urlParams.get('showLogin');

                if (shouldShowLogin === 'true' && !isServerAuthenticated && loginModal) {
                    loginModal.classList.remove("hidden");
                    window.history.replaceState(null, null, window.location.pathname);
                }

                if (loginButton && loginModal) {
                    loginButton.addEventListener("click", () => {
                        loginModal.classList.remove("hidden");
                    });
                }
                if (loginModal) {
                    loginModal.addEventListener("click", (event) => {
                        // Đóng modal khi click ra ngoài, nhưng không phải click vào nội dung modal
                        if (event.target === loginModal) {
                            loginModal.classList.add("hidden");
                        }
                    });
                }

                // Giả sử searchModal và searchButton được định nghĩa trong search.jsp
                const actualSearchButton = document.querySelector('.search-button'); // Giả định có class này trong search.jsp
                const actualSearchModal = document.getElementById("search-modal");

                if (actualSearchButton && actualSearchModal) {
                    actualSearchButton.addEventListener("click", () => {
                        actualSearchModal.classList.remove("hidden");
                    });
                }
                if (actualSearchModal) {
                    actualSearchModal.addEventListener("click", (event) => {
                        if (event.target === actualSearchModal) {
                            actualSearchModal.classList.add("hidden");
                        }
                    });
                }
            });
        </script>
        <script src="js/handleUI.js"></script>
        <script src="js/handleAuth.js"></script>
        <script src="//code.tidio.co/jm8e5ai5yvtjna1r1r5tpne389fpfjgb.js" async></script>    
    </body>
</html>