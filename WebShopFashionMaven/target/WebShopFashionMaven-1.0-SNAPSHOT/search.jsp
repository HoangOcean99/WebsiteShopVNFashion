<%-- 
    Document   : search
    Created on : Oct 11, 2025, 11:40:37 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-full h-full bg-black/40 fixed z-50 flex justify-center items-center hidden" id="search-modal">
    <div class="flex items-center px-3 py-1.5 border border-white border-[3px] shadow-sm transition-all duration-300 w-1/3 focus-within:border-gray focus-within:ring-5 focus-within:ring-gray/50">
        <i data-lucide="search" class="w-10 h-10 cursor-pointer text-white mx-2"></i>
        <input 
            type="text" 
            placeholder="Tìm kiếm sản phẩm..." 
            class=" mx-2 w-full text-white text-[20px] font-bold bg-transparent outline-none placeholder:text-white placeholder:text-[20px]"
            />
    </div>
</div>