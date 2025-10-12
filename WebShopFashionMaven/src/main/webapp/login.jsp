<%-- 
    Document   : login
    Created on : Oct 11, 2025, 10:18:15 PM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-full h-full bg-black/40 fixed z-50 flex justify-center items-center hidden" id="login-modal">
    <div class="mx-auto ring-4 ring-white w-1/4 h-1/3 flex justify-center items-center flex-col rounded-xl">
        <h1 class="text-white text-[38px] font-bold mb-5">- Sign in with -</h1>
        <a class="bg-white inline-flex px-6 py-2 rounded-xl justify-center items-center" onclick="signInWithGoogle()">
            <span class="text-[23px]">G</span>
            <span class="ms-3">Google</span>
        </a>
    </div>
</div>
