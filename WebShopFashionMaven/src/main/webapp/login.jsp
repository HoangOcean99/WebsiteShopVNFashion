<%-- 
    Document : login
    Created on : Oct 11, 2025, 10:18:15 PM
    Author : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-gray-900 bg-opacity-50 backdrop-blur-sm">

    <div class="relative w-full max-w-sm md:max-w-md
         ring-4 ring-white flex justify-center items-center flex-col
         rounded-xl p-6 sm:p-10 bg-white/70 shadow-2xl">

        <h1 class="text-[#4B2E17] text-3xl sm:text-4xl font-bold mb-6 sm:mb-8 text-center">
            - Đăng nhập -
        </h1>

        <a style="cursor: pointer" 
           class="bg-white w-full max-w-xs inline-flex px-8 py-3 rounded-xl justify-center items-center shadow-lg hover:bg-gray-50 transition duration-200" 
           onclick="signInWithGoogle()">

            <span class="text-2xl sm:text-3xl text-[#4285F4] me-3 font-bold">G</span>
            <span class="ms-1 text-gray-700 font-semibold text-lg sm:text-xl">
                Sign in with Google
            </span>
        </a>

        <button class="absolute top-3 right-3 text-[#4B2E17] hover:text-gray-700">
            <i data-lucide="x" class="w-6 h-6"></i>
        </button>

    </div>
</div>

<script>
    // Khởi tạo Lucide Icons (nếu tệp này là độc lập)
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

    // Đảm bảo hàm signInWithGoogle tồn tại
    if (typeof signInWithGoogle !== 'function') {
        window.signInWithGoogle = function () {
            console.log('Attempting Google Sign-In...');
            // Logic Firebase/OAuth sẽ được thực thi ở đây
        };
    }

    // Logic đóng modal (chỉ là ví dụ, cần kết hợp với mã HTML/JS gọi modal)
    document.querySelector('.fixed.inset-0').addEventListener('click', function (e) {
        if (e.target === this || e.target.closest('button')) {
            // Logic để đóng modal ở đây (ví dụ: ẩn/xóa class fixed)
            console.log('Modal closed');
        }
    });
</script>