package com.diemxua.utils;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
    "/cart.jsp",
    "/category.jsp",
    "/admin_addProduct.jsp",
    "/admin_analysis.jsp",
    "/admin_order.jsp",
    "/admin_orderDetail.jsp",
    "/admin_product.jsp",
    "/admin_productDetail.jsp",
    "/admin_sidebar.jsp",
    "/buy.jsp",
    "/formUserDetail.jsp",
    "/orderDetail.jsp",
    "/paymentResult.jsp",
    "/productDetail.jsp",
    "/ProductServlet",
    "/AdminAddAddressServlet",
    "/AdminAddProductServlet",
    "/AdminDeleteProductServlet",
    "/AdminOrderDetailServlet",
    "/AdminOrderServlet",
    "/AdminProductDetailServlet",
    "/AdminProductServlet",
    "/AdminUpdateOrderStatusServlet",
    "/AdminUpdateProductServlet",
    "/AdminUserServlet",
    "/AnalysisServlet",
    "/BuyDetailServlet",
    "/CancelOrderServlet",
    "/CartDetailServlet",
    "/CartServlet",
    "/ChangeCartServlet",
    "/DeleteAddressServlet",
    "/DeleteCartItemServlet",
    "/FirebaseLogoutServlet",
    "/OrderDetailServlet",
    "/OrderServlet",
    "/ProductDetailServlet",
    "/TryOnServlet",
    "/UpdateInforCustomerServlet",
    "/UpdateRoleUserServlet",
    "/UserInforServlet",
    "/UserProfileServlet"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        Object authAttribute = (session != null) ? session.getAttribute("isAuthenticated") : null;
        boolean isLoggedIn = authAttribute instanceof Boolean && (Boolean) authAttribute;

        if (isLoggedIn) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/home.jsp?showLogin=true");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
