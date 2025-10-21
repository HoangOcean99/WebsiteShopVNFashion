<%-- 
    Document   : login
    Created on : Oct 11, 2025, 10:18:15 PM
    Author     : Duong
--%>

<%-- login.jsp (Phiên bản chỉ chứa nội dung hộp thoại) --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="relative mx-auto ring-4 ring-white w-1/4 h-1/3 flex justify-center items-center flex-col rounded-xl p-6 bg-white/40 backdrop-blur-sm">

    <h1 class="text-[#4B2E17] text-[38px] font-bold mb-5">- Sign in with -</h1>

    <a style="cursor: pointer" class="bg-white inline-flex px-6 py-2 rounded-xl justify-center items-center" onclick="signInWithGoogle()">
        <span class="text-[23px] text-[#4285F4] me-3 font-bold">G</span>
        <span class="ms-1 text-gray-700 font-semibold">Google</span>
    </a>

</div>
