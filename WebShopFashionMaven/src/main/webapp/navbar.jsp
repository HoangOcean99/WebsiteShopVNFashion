<%-- 
    Document   : navbar
    Created on : Oct 3, 2025, 9:12:36 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String userName =(String) session.getAttribute("userName");
%>
<style>
    .dropdown-container {
        position: relative;
        display: inline-block;
    }
    .dropdown-menu {
        position: absolute;
        top: 100%;
        right: 0;
        z-index: 50; /* Tăng z-index để đảm bảo nó ở trên cùng */
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        padding: 12px 0;
        display: none;
    }
    .dropdown-menu a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown-menu a:hover {
        background-color: #ddd;
    }
    .dropdown-menu.show {
        display: block;
    }
</style>

<nav class="fixed top-0 left-0 w-full z-40 bg-[#4B2E17] text-white">

    <div class="container mx-auto hidden lg:flex items-center justify-center px-12 py-2">
        
        <div class="flex gap-10"> <% boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin"); 
            if(role){ %>
            <a href="AdminProductServlet" class="hover:text-yellow-400 text-xl">Dashboard</a>
            <% } %>
            <a href="home.jsp#home" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-xl">Giới Thiệu</a>
            <a href="home.jsp#category" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-xl">Danh Mục</a>
        </div>

        <div class="flex-shrink-0">
            <img
                src="images/lgo.png"
                alt="Logo"
                class="h-20 object-cover items-center justify-center mx-auto rounded-full" 
                />
        </div>

        <div class="flex items-center gap-10"> <a href="home.jsp#feedback" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-xl">Feedback</a>
            <a href="home.jsp#footer" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md  text-xl">Liên Hệ</a>
        </div>

        <div class="flex items-center gap-4 pl-12">
            <span 
                class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md" 
                onclick="window.location.href = 'orders.jsp'"
            >
                <i data-lucide="handbag" class="w-5 h-5"></i>
            </span>

            <span 
                class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md" 
                onclick="window.location.href = 'CartDetailServlet'"
            >
                <i data-lucide="shopping-cart" class="w-5 h-5"></i>
            </span>
            
            <% if(userName == null) { %>
            <span 
                class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md" 
                onclick="window.location.href = 'CartDetailServlet'"
            >
              <i data-lucide="user" class="w-5 h-5 cursor-pointer" id="login-button"></i>
            </span>
            
            <% } %>
            <% if(userName != null) { %>
            <div class="dropdown-container">
                <span style="cursor: pointer" id="userNameTrigger" class="dropdown-trigger"><%= userName %></span>
                <div id="userDropdownMenu" class="dropdown-menu">
                    <a href="#" style="cursor: pointer">Thông tin tài khoản</a>
                    <a onclick="signOutUser()" style="cursor: pointer">Đăng xuất</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <div class="container mx-auto flex lg:hidden items-center justify-between px-4 py-2">
        <div class="flex-shrink-0">
            <img src="images/lgo.png" alt="Logo" class="h-16 w-auto object-cover rounded-full" /> </div>

        <div class="flex items-center gap-2">
            <span class="flex items-center cursor-pointer p-2 rounded-md" onclick="window.location.href = 'orders.jsp'">
                <i data-lucide="handbag" class="w-5 h-5"></i>
            </span>
            <span class="flex items-center cursor-pointer p-2 rounded-md" onclick="window.location.href = 'CartDetailServlet'">
                <i data-lucide="shopping-cart" class="w-5 h-5"></i>
            </span>
            
            <% if(userName == null) { %>
            <span class="flex items-center cursor-pointer p-2 rounded-md" onclick="window.location.href = 'CartDetailServlet'">
                <i data-lucide="user" class="w-5 h-5 cursor-pointer" id="login-button-mobile"></i>
            </span>
            <% } %>
            
            <% if(userName != null) { %>
            <div class="dropdown-container">
                <span style="cursor: pointer" id="userNameTriggerMobile" class="dropdown-trigger p-2"><%= userName %></span>
                <div id="userDropdownMenuMobile" class="dropdown-menu">
                    <a href="#" style="cursor: pointer">Thông tin tài khoản</a>
                    <a onclick="signOutUser()" style="cursor: pointer">Đăng xuất</a>
                </div>
            </div>
            <% } %>

            <button id="mobile-menu-button" class="p-2 rounded-md focus:outline-none focus:bg-white/20">
                <i data-lucide="menu" class="w-6 h-6"></i>
            </button>
        </div>
    </div>

    <div id="mobile-menu" class="hidden lg:hidden w-full bg-[#4B2E17] absolute top-full left-0">
        <div class="flex flex-col px-4 py-2">
            <% if(role){ %>
            <a href="AdminProductServlet" class="block px-3 py-2 rounded-md hover:bg-white hover:text-[#4B2E17]">Dashboard</a>
            <% } %>
            <a href="home.jsp#home" class="block px-3 py-2 rounded-md hover:bg-white hover:text-[#4B2E17]">Giới Thiệu</a>
            <a href="home.jsp#category" class="block px-3 py-2 rounded-md hover:bg-white hover:text-[#4B2E17]">Danh Mục</a>
            <a href="home.jsp#feedback" class="block px-3 py-2 rounded-md hover:bg-white hover:text-[#4B2E17]">Feedback</a>
            <a href="home.jsp#footer" class="block px-3 py-2 rounded-md hover:bg-white hover:text-[#4B2E17]">Liên Hệ</a>
        </div>
    </div>
</nav>

<script>
    // Đảm bảo code chạy sau khi trang đã tải xong
    document.addEventListener("DOMContentLoaded", function() {
        
        // --- 1. Xử lý Menu Hamburger ---
        const menuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        
        if (menuButton) {
            menuButton.addEventListener('click', function(e) {
                e.stopPropagation(); // Ngăn click lan ra ngoài
                mobileMenu.classList.toggle('hidden');
            });
        }

        // --- 2. Xử lý User Dropdown (cho cả mobile và desktop) ---
        // Tìm TẤT CẢ các nút trigger
        const triggers = document.querySelectorAll('.dropdown-trigger');
        
        triggers.forEach(trigger => {
            trigger.addEventListener('click', function(e) {
                e.stopPropagation(); // Ngăn click lan ra window
                
                const menu = this.nextElementSibling; // Tìm .dropdown-menu ngay sau nó
                
                // Đóng tất cả các menu khác đang mở
                document.querySelectorAll('.dropdown-menu.show').forEach(m => {
                    if (m !== menu) {
                        m.classList.remove('show');
                    }
                });
                
                // Bật/tắt menu hiện tại
                if (menu && menu.classList.contains('dropdown-menu')) {
                    menu.classList.toggle('show');
                }
            });
        });

        // --- 3. Đóng dropdown khi click ra ngoài ---
        window.addEventListener('click', function() {
            // Đóng tất cả menu user
            document.querySelectorAll('.dropdown-menu.show').forEach(menu => {
                menu.classList.remove('show');
            });
            
            // Đóng cả menu hamburger (nếu đang mở)
            if (!mobileMenu.classList.contains('hidden')) {
                mobileMenu.classList.add('hidden');
            }
        });
    });
</script>