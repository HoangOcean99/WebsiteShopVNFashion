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
        z-index: 1;
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
<nav class="fixed top-0 left-0 w-full z-40 bg-[#4B2E17] text-white items-center">
    <div class="container mx-auto flex items-center justify-center px-12 py-2">
        <div class="flex gap-20">
            <a href="home.jsp#home" class="hover:text-yellow-400 text-xl">Giới Thiệu</a>
            <a href="home.jsp#category" class="hover:text-yellow-400 text-xl">Danh Mục</a>
        </div>

        <div class="flex-shrink-0">
            <img
                src="images/lgo.png"
                alt="Logo"
                class="w-25 h-20 object-cover items-center justify-center mx-auto rounded-full px-20"
                />
        </div>

        <div class="flex items-center gap-20">
            <a href="home.jsp#feedback" class="hover:text-yellow-400 text-xl">Feedback</a>
            <a href="home.jsp#footer" class="hover:text-yellow-400 text-xl">Liên Hệ</a>
        </div>

        <div class="flex items-center gap-4 pl-20">
            <i data-lucide="handbag" class="w-5 h-5 cursor-pointer"  onclick="window.location.href = 'orders.jsp'"></i>
            <i data-lucide="shopping-cart" class="w-5 h-5 cursor-pointer" onclick="window.location.href = 'CartDetailServlet'"></i>
            <% if(userName == null) { %>
            <i data-lucide="user" class="w-5 h-5 cursor-pointer" id="login-button"></i>
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
</nav>

