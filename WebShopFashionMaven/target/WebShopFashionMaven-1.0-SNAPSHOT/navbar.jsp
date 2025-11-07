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

    /* ✅ Hide middle menu in mobile */
    @media (max-width: 768px) {
        .nav-main-menu {
            display: none !important;
        }
    }

    /* ✅ Mobile dropdown positioning */
    .mobile-menu {
        display: none;
    }
</style>


<nav class="fixed top-0 left-0 w-full z-40 bg-[#4B2E17] text-white items-center">
    <div class="container mx-auto flex items-center justify-between px-4 lg:px-12 py-2 flex-wrap gap-4">

        <div class="flex gap-20 nav-main-menu">
            <% boolean role = session.getAttribute("RoleUser") != null && (Boolean) session.getAttribute("RoleUser").equals("admin"); 
            if(role){ %>
            <a href="AdminUserServlet" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-lg">Dashboard</a>
            <% } %>
            <a href="home.jsp#home" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-lg">Giới Thiệu</a>
            <a href="home.jsp#category" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-lg">Danh Mục</a>
        </div>

        <div class="flex items-center gap-3">
            <a href="https://www.facebook.com/Diemxua.7Aspire" target="blank">
                <img
                    src="images/lgo.png"
                    alt="Logo"
                    class="w-25 h-20 object-cover rounded-full"
                    />
            </a>

            <button id="mobileMenuToggle"
                    class="lg:hidden block text-white text-3xl cursor-pointer">
                ☰
            </button>
        </div>

        <div class="flex items-center gap-20 nav-main-menu">
            <a href="home.jsp#feedback" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-lg">Feedback</a>
            <a href="home.jsp#footer" class="hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md text-lg">Liên Hệ</a>
        </div>

        <!-- Icon cart + profile -->
        <div class="flex items-center gap-4">
            <span 
                class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md" 
                onclick="window.location.href = 'OrderServlet'">
                <i data-lucide="handbag" class="w-5 h-5"></i>
            </span>

            <span 
                class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md" 
                onclick="window.location.href = 'CartDetailServlet'">
                <i data-lucide="shopping-cart" class="w-5 h-5"></i>
            </span>

            <% if(userName == null) { %>
            <span class="flex items-center cursor-pointer hover:bg-white hover:text-[#4B2E17] px-3 py-8 rounded-md">
                <i data-lucide="user" class="w-5 h-5 cursor-pointer" id="login-button"></i>
            </span>
            <% } %>

            <% if(userName != null) {
                String photoURL = (String) session.getAttribute("userImage");
                if(photoURL == null || photoURL.isEmpty()){
                    photoURL = "images/lgo.png";
                }%>
            <div class="dropdown-container flex items-center gap-2">
                <div id="userTrigger" class="flex items-center gap-2 cursor-pointer">
                    <span id="userNameTrigger" class="dropdown-trigger"><%= userName %></span>
                    <img src="<%= photoURL %>"
                         alt="Avatar"
                         class="w-8 h-8 rounded-full object-cover" />
                </div>

                <div id="userDropdownMenu" class="dropdown-menu">
                    <a href="UserInforServlet">Thông tin tài khoản</a>
                    <a onclick="signOutUser()">Đăng xuất</a>
                </div>
            </div>
            <% } %>

        </div>
    </div>

    <div id="mobileMenu" class="mobile-menu lg:hidden flex-col gap-2 bg-[#4B2E17] w-full px-4 pb-2">
        <a href="home.jsp#home" class="block py-2 text-lg">Giới Thiệu</a>
        <a href="home.jsp#category" class="block py-2 text-lg">Danh Mục</a>
        <a href="home.jsp#feedback" class="block py-2 text-lg">Feedback</a>
        <a href="home.jsp#footer" class="block py-2 text-lg">Liên Hệ</a>
    </div>
</nav>


<script>
    const toggleBtn = document.getElementById("mobileMenuToggle");
    const mobileMenu = document.getElementById("mobileMenu");

    toggleBtn.addEventListener("click", () => {
        mobileMenu.style.display =
                mobileMenu.style.display === "flex" ? "none" : "flex";
    });
</script>
