/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diemxua.vnpay.common;

import com.diemxua.model.CartItems;
import com.diemxua.model.OrderDetails;
import com.diemxua.model.Orders;
import com.diemxua.model.Product;
import com.diemxua.model.ProductSalesSummary;
import com.diemxua.services.CartItemsService;
import com.diemxua.services.OrderDetailService;
import com.diemxua.services.OrdersService;
import com.diemxua.services.ProductSalesSummaryService;
import com.diemxua.services.ProductService;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.core.Response;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CTT VNPAY
 */
public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String bankCode = req.getParameter("bankCode");
        String type = req.getParameter("type");
        OrdersService orderService = new OrdersService();
        OrderDetailService orderDetailService = new OrderDetailService();
        ProductSalesSummaryService productSaleSummaryService = new ProductSalesSummaryService();
        CartItemsService cartItemService = new CartItemsService();
        ProductService productService = new ProductService();
        if (req.getParameter("totalBill") == null) {
            resp.sendRedirect("CartDetailServlet");
            return;
        }
        double amountDouble = Double.parseDouble(req.getParameter("totalBill"));
        long amount = (long) (amountDouble);
        int orderID = -1;
        if (type.equals("buy")) {
            String deliver = req.getParameter("deliver");
            String addressSelect = req.getParameter("addressSelect");
            int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
            int quantityBuy = Integer.parseInt(req.getParameter("inputQuantity"));
            String sizeBuy = req.getParameter("inputSize");
            int productIDBuy = Integer.parseInt(req.getParameter("ProductID"));
            long PriceOrigin = Long.parseLong(req.getParameter("PriceOrigin"));
            int extraTime = 0;
            if (deliver.equals("fast")) {
                extraTime = 3;
            } else {
                extraTime = 6;
            }

            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DAY_OF_MONTH, extraTime);
            Date newDate = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateStr = sdf.format(newDate);
            if (req.getParameter("payment").equals("COD")) {
                orderID = orderService.insert(new Orders("Cho-xac-nhan", deliver, "COD", amount, Integer.parseInt(addressSelect), userID, dateStr));
                orderDetailService.insert(new OrderDetails(productIDBuy, quantityBuy, PriceOrigin, orderID, sizeBuy));
                productSaleSummaryService.insert(new ProductSalesSummary(productIDBuy, quantityBuy, PriceOrigin));
                resp.sendRedirect("OrderServlet");
                return;
            } else {
                orderID = orderService.insert(new Orders("Chua-thanh-toan", deliver, "vnpay", amount, Integer.parseInt(addressSelect), userID, dateStr));
                orderDetailService.insert(new OrderDetails(productIDBuy, quantityBuy, PriceOrigin, orderID, sizeBuy));
                productSaleSummaryService.insert(new ProductSalesSummary(productIDBuy, quantityBuy, PriceOrigin));
            }
        } else {
            String deliver = req.getParameter("deliver");
            String addressSelect = req.getParameter("addressSelect");
            int userID = Integer.parseInt(String.valueOf(session.getAttribute("UserID")));
            List<CartItems> listProductCart = cartItemService.getByCartId(userID);
            List<CartItems> listResult = new ArrayList<>();
            int extraTime = 0;
            if (deliver.equals("fast")) {
                extraTime = 3;
            } else {
                extraTime = 6;
            }

            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DAY_OF_MONTH, extraTime);
            Date newDate = cal.getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String dateStr = sdf.format(newDate);
            for (CartItems c : listProductCart) {
                if (c.isIsSelect()) {
                    listResult.add(c);
                }
            }
            if (listResult.size() == 0) {
                resp.sendRedirect("CartDetailServlet");
                return;
            }
            if (req.getParameter("payment").equals("COD")) {
                orderID = orderService.insert(new Orders("Cho-xac-nhan", deliver, "COD", amount, Integer.parseInt(addressSelect), userID, dateStr));
                for (CartItems c : listResult) {
                    Product p = productService.getProductByProductId(c.getProductId());
                    orderDetailService.insert(new OrderDetails(c.getProductId(), c.getQuantityCart(), p.getPrice(), orderID, c.getSizeCart()));
                    productSaleSummaryService.insert(new ProductSalesSummary(c.getProductId(), c.getQuantityCart(), p.getPrice()));
                }
                resp.sendRedirect("OrderServlet");
                return;
            } else {
                orderID = orderService.insert(new Orders("Chua-thanh-toan", deliver, "vnpay", amount, Integer.parseInt(addressSelect), userID, dateStr));
                for (CartItems c : listResult) {
                    Product p = productService.getProductByProductId(c.getProductId());
                    orderDetailService.insert(new OrderDetails(c.getProductId(), c.getQuantityCart(), p.getPrice(), orderID, c.getSizeCart()));
                    productSaleSummaryService.insert(new ProductSalesSummary(c.getProductId(), c.getQuantityCart(), p.getPrice()));
                }
            }
        }

        session.setAttribute("typeAction", type);
        session.setAttribute("orderID", orderID);

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        String vnp_TxnRef = orderID + "";
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        resp.sendRedirect(paymentUrl);
    }
}
