<%-- 
    Document   : home
    Created on : Oct 3, 2025, 9:11:41 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Page Title</title>
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
    <script src="main.js"></script>

</head>

<body>
    <%@include file="login.jsp" %>
    <%@include file="search.jsp" %>
    <%@include file="navbar.jsp" %>

    <section
        id="home"
        class="w-full min-h-screen bg-[url('images/Trangchu.png')] bg-cover bg-center bg-fixed overflow-hidden"
        >
        <!--<div class="flex justify-between w-full h-full fixed z-20 opacity-80">-->
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
        <!--</div>-->
    </section>

    <section id="category" class="w-full min-h-screen bg-[url('images/Background3.png')] bg-cover bg-center bg-no-repeat shadow-lg bg-fixed overflow-hidden">
        <h2
            class="justify-center text-center text-2xl font-bold underline text-brown-800 p-20"
            >
            Danh Mục
        </h2>

        <div class="flex gap-20 justify-center mb-40">
            <div class="text-center cursor-pointer" onclick="window.location.href = 'category.jsp'">
                <img
                    src="images/AoGiaoLinh.jpg"
                    alt="AoGiaoLinh"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-800">Áo Giao Lĩnh</h3>
            </div>

            <div class="text-center cursor-pointer" onclick="window.location.href = 'category.jsp'">
                <img
                    src="images/AoTacNu.jpg"
                    alt="AoTacNu"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-800">Áo Tấc Nữ</h3>
            </div>

            <div class="text-center cursor-pointer" onclick="window.location.href = 'category.jsp'">
                <img
                    src="images/VienLinh.jpg"
                    alt="VienLinh"
                    class="w-80 h-[420px] object-cover rounded-lg shadow-2xl"
                    />
                <h3 class="mt-4 text-xl font-bold text-brown-1000">Áo Viên Lĩnh</h3>
            </div>
        </div>

        <div class="relative w-full h-[800px] overflow-hidden object-cover z-10" id="feedback">
            <div class="slide" style="background-image: url('images/f1.jpg')"></div>
            <div class="slide" style="background-image: url('images/f2.jpg')"></div>
            <div class="slide" style="background-image: url('images/f3.jpg')"></div>
            <div class="slide" style="background-image: url('images/f4.jpg')"></div>

            <div
                class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-white text-5xl font-bold drop-shadow-lg"
                >
                FEEDBACK
            </div>
        </div>
    </section>

    <footer class="bg-[#4B2E17] text-white py-10 overflow-hidden" id="footer">
        <div
            class="container mx-auto px-6 md:px-12 flex flex-col md:flex-row justify-between items-center gap-6"
            >
            <!-- Cột trái -->
            <div class="text-center md:text-left">
                <img src="images/lgo.png" alt="logo" class="w-30 h-20 object-cover" />
                <p class="text-sm text-gray-300 max-w-sm">
                    Hành trình tìm lại hương sắc Việt
                </p>
            </div>

            <!-- Cột giữa -->
            <div class="flex gap-6 text-sm">
                <a href="#home" class="hover:text-yellow-400 transition">Giới thiệu</a>
                <a href="#category" class="hover:text-yellow-400 transition">Danh mục</a>
                <a href="#feedback" class="hover:text-yellow-400 transition">Feedback</a>
                <a href="#footer" class="hover:text-yellow-400 transition">Liên hệ</a>
            </div>

            <!-- Cột phải -->
            <div class="flex gap-4">
                <i
                    data-lucide="facebook "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
                <i
                    data-lucide="instagram "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
                <i
                    data-lucide="mail "
                    class="w-5 h-5 hover:text-yellow-400 cursor-pointer"
                    ></i>
            </div>
        </div>

        <div
            class="border-t border-gray-600 mt-6 pt-4 text-center text-sm text-gray-400"
            >
            © 2025 Diễm Xưa. All rights reserved.
        </div>
    </footer>
    <script>
        lucide.createIcons();

        const loginModal = document.getElementById("login-modal");
        const loginButton = document.getElementById("login-button");

        const searchModal = document.getElementById("search-modal");
        const searchButton = document.getElementById("search-button");

        if (loginButton && loginModal) {
            loginButton.addEventListener("click", () => {
                loginModal.classList.remove("hidden");
            })
        }
        if (loginModal) {
            loginModal.addEventListener("click", (event) => {
                if (event.target === loginModal) {
                    loginModal.classList.add("hidden");
                }
            })
        }

        if (searchModal && searchButton) {
            searchButton.addEventListener("click", () => {
                searchModal.classList.remove("hidden");
            })
        }
        if (searchModal) {
            searchModal.addEventListener("click", (event) => {
                if (event.target === searchModal) {
                    searchModal.classList.add("hidden");
                }
            })
        }
    </script>
    <script>
        // --- Logic Xử lý Đăng nhập Firebase ---

        // 1. Hàm gửi Token lên Servlet (Backend)
        function sendTokenToServer(user) {
            user.getIdToken().then(idToken => {
                fetch('FirebaseLoginServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `idToken=${idToken}`
                })
                        .then(res => {
                            if (res.ok) {
                                window.location.href = 'home.jsp';
                            } else {
                                alert('Xác thực Server thất bại.');
                            }
                        })
                        .catch(error => console.error('Lỗi fetch:', error));
            });
        }

        // 2. Hàm đăng nhập (Được gọi từ nút trong login.jsp)
        function signInWithGoogle() {
            const provider = new firebase.auth.GoogleAuthProvider();
            auth.signInWithPopup(provider).catch((error) => {
                console.error("Lỗi đăng nhập:", error);
            });
        }

        // 3. FIX LỖI 2: ĐẶT onAuthStateChanged Ở NGOÀI CÙNG
        // Hàm này chạy ngay khi trang tải xong và mỗi khi trạng thái đăng nhập thay đổi.
        auth.onAuthStateChanged(user => {
            if (user) {
                // Đóng modal nếu nó đang mở
                const modal = document.getElementById("login-modal");
                if (modal)
                    modal.classList.add("hidden");

                // Gửi token chỉ khi người dùng vừa đăng nhập hoặc đã được lưu session
                sendTokenToServer(user);
            }
        });

    </script>
</body>
</html>
