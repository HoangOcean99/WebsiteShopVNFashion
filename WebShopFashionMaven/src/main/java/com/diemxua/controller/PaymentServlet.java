package com.diemxua.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.*;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class PaymentServlet extends HttpServlet {

    private static final String PARTNER_CODE = "MOMO_TEST"; // replace sandbox partnerCode
    private static final String ACCESS_KEY = "your_access_key";
    private static final String SECRET_KEY = "your_secret_key";
    private static final String CREATE_ORDER_URL = "https://test-payment.momo.vn/v2/gateway/api/create";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = "ORDER_" + System.currentTimeMillis();
        String requestId = orderId;
        String amount = req.getParameter("amount"); // e.g. "50000"
        String orderInfo = "Thanh toan don hang " + orderId;
        String returnUrl = "https://your-site.com/momo-return";
        String notifyUrl = "https://your-site.com/momo-notify";
        String extraData = ""; // optional

        // build raw signature string (the exact order/fields must follow MoMo doc)
        String rawSignature = "accessKey=" + ACCESS_KEY
                + "&amount=" + amount
                + "&extraData=" + extraData
                + "&orderId=" + orderId
                + "&orderInfo=" + orderInfo
                + "&partnerCode=" + PARTNER_CODE
                + "&redirectUrl=" + returnUrl
                + "&requestId=" + requestId
                + "&notifyUrl=" + notifyUrl
                + "&requestType=captureWallet";

        String signature = hmacSHA256(rawSignature, SECRET_KEY);

        // build JSON payload
        String jsonPayload = "{"
                + "\"partnerCode\":\"" + PARTNER_CODE + "\","
                + "\"accessKey\":\"" + ACCESS_KEY + "\","
                + "\"requestId\":\"" + requestId + "\","
                + "\"amount\":\"" + amount + "\","
                + "\"orderId\":\"" + orderId + "\","
                + "\"orderInfo\":\"" + orderInfo + "\","
                + "\"redirectUrl\":\"" + returnUrl + "\","
                + "\"ipnUrl\":\"" + notifyUrl + "\","
                + "\"extraData\":\"" + extraData + "\","
                + "\"requestType\":\"captureWallet\","
                + "\"signature\":\"" + signature + "\""
                + "}";

        // POST to MoMo
        URL url = new URL(CREATE_ORDER_URL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        con.setDoOutput(true);

        try (OutputStream os = con.getOutputStream()) {
            os.write(jsonPayload.getBytes("UTF-8"));
        }

        int status = con.getResponseCode();
        InputStream is = (status >= 200 && status < 300) ? con.getInputStream() : con.getErrorStream();
        StringBuilder respText = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = br.readLine()) != null) {
                respText.append(line);
            }
        }
        con.disconnect();

        // parse JSON response simply (bạn có thể dùng Jackson/Gson)
        String responseBody = respText.toString();
        // tìm payUrl trong response (nên dùng JSON parser)
        String payUrl = extractValueFromJson(responseBody, "payUrl"); // implement a safe parser

        if (payUrl != null && !payUrl.isEmpty()) {
            // redirect user tới payUrl (MoMo sandbox)
            resp.sendRedirect(payUrl);
        } else {
            resp.getWriter().write("Create order failed: " + responseBody);
        }
    }

    // helper: HMAC SHA256 -> hex
    private static String hmacSHA256(String data, String key) {
        try {
            Mac mac = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_spec = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
            mac.init(secret_spec);
            byte[] digest = mac.doFinal(data.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();
        } catch (Exception ex) {
            throw new RuntimeException("Error generating HMAC", ex);
        }
    }

    // VERY SIMPLE JSON extractor (demo only) - replace with GSON/Jackson in production
    private static String extractValueFromJson(String json, String key) {
        String pattern = "\"" + key + "\":\"";
        int idx = json.indexOf(pattern);
        if (idx == -1) {
            return null;
        }
        int start = idx + pattern.length();
        int end = json.indexOf("\"", start);
        if (end == -1) {
            return null;
        }
        return json.substring(start, end);
    }
}
