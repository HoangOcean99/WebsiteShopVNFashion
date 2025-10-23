package com.diemxua.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, 
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class TryOnServlet extends HttpServlet {

    private static final String RAPIDAPI_KEY = "ce63862d5emshe5ee05e7220c94fp19d18bjsn4fee322ae612";
    private static final String RAPIDAPI_HOST = "try-on-diffusion.p.rapidapi.com";
    private static final String API_TRY_ON_ENDPOINT = "https://" + RAPIDAPI_HOST + "/try-on-url";

    private static final String SUPABASE_URL = "https://gahbelswwpdrumuiwznm.supabase.co";
    private static final String SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhaGJlbHN3d3BkcnVtdWl3em5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYwNDk2MjQsImV4cCI6MjA3MTYyNTYyNH0.ZZUySoiV4uUgeQ1pKdZ7Q1kBzhAUm7NgxLOm_JIYrQs";
    private static final String SUPABASE_BUCKET_NAME = "WebsiteDiemXua";
    private static final String SUPABASE_FILE_PATH_PREFIX = "UserImageTryOn/";

    private static final String SUPABASE_UPLOAD_BASE_ENDPOINT = SUPABASE_URL + "/storage/v1/object/" + SUPABASE_BUCKET_NAME + "/";
    private static final String SUPABASE_PUBLIC_BASE_URL = SUPABASE_URL + "/storage/v1/object/public/" + SUPABASE_BUCKET_NAME + "/";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        response.setHeader("Access-Control-Allow-Origin", "*");

        String personImageUrl = null;
        String productImageUrl = request.getParameter("productImageUrl");

        Part personImagePart = request.getPart("personImageFile");

        if (personImagePart == null || personImagePart.getSize() == 0) {
            sendErrorResponse(response, "Vui lòng chọn ảnh người dùng.");
            return;
        }

        try {
            personImageUrl = uploadImageToSupabase(personImagePart);

            if (personImageUrl == null) {
                sendErrorResponse(response, "Lỗi: Không thể tải ảnh người dùng lên Supabase. Vui lòng kiểm tra Log Server.");
                return;
            }

            try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
                HttpPost postRequest = new HttpPost(API_TRY_ON_ENDPOINT);

                postRequest.addHeader("X-RapidAPI-Key", RAPIDAPI_KEY);
                postRequest.addHeader("X-RapidAPI-Host", RAPIDAPI_HOST);

                List<NameValuePair> params = new ArrayList<>();
                params.add(new BasicNameValuePair("clothing_image_url", productImageUrl));
                params.add(new BasicNameValuePair("avatar_image_url", personImageUrl));

                UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params, StandardCharsets.UTF_8);
                postRequest.setEntity(entity);

                try (CloseableHttpResponse httpResponse = httpClient.execute(postRequest)) {

                    int statusCode = httpResponse.getStatusLine().getStatusCode();

                    if (statusCode == 200) {
                        String contentType = httpResponse.getFirstHeader("Content-Type").getValue();

                        response.setContentType(contentType);
                        InputStream apiInputStream = httpResponse.getEntity().getContent();
                        OutputStream servletOutputStream = response.getOutputStream();

                        apiInputStream.transferTo(servletOutputStream);
                        servletOutputStream.flush();

                    } else {
                        // Lỗi API Try-On
                        String errorBody = EntityUtils.toString(httpResponse.getEntity());
                        sendErrorResponse(response, "Lỗi API Try-On (" + statusCode + "): " + errorBody);
                    }
                }
            }

        } catch (Exception e) {
            System.err.println("Exception in TryOnServlet: " + e.getMessage());
            e.printStackTrace();
            sendErrorResponse(response, "Lỗi Server nội bộ: " + e.getMessage());
        }
    }

    // --- Hàm Hỗ trợ: Tải ảnh lên Supabase Storage (Giữ nguyên logic sửa lỗi ảnh đen) ---
    private String uploadImageToSupabase(Part imagePart) throws IOException {

        String fileName = SUPABASE_FILE_PATH_PREFIX + UUID.randomUUID().toString() + ".jpg";

        String uploadUrl = SUPABASE_UPLOAD_BASE_ENDPOINT + fileName;
        String contentType = imagePart.getContentType();
        if (contentType == null || contentType.isEmpty()) {
            contentType = "image/jpeg";
        }

        // Đọc InputStream vào ByteArrayOutputStream để bảo toàn dữ liệu
        byte[] imageBytes;
        try (InputStream input = imagePart.getInputStream(); ByteArrayOutputStream output = new ByteArrayOutputStream()) {

            input.transferTo(output);
            imageBytes = output.toByteArray();
        }

        if (imageBytes.length == 0) {
            return null;
        }

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost uploadPost = new HttpPost(uploadUrl);

            uploadPost.addHeader("Authorization", "Bearer " + SUPABASE_ANON_KEY);
            uploadPost.addHeader("X-Upsert", "true");
            uploadPost.addHeader("Content-Type", contentType);

            // Gửi mảng byte trực tiếp với ByteArrayEntity
            org.apache.http.HttpEntity entity = new ByteArrayEntity(imageBytes, ContentType.parse(contentType));
            uploadPost.setEntity(entity);

            try (CloseableHttpResponse supabaseResponse = httpClient.execute(uploadPost)) {

                if (supabaseResponse.getStatusLine().getStatusCode() == 200 || supabaseResponse.getStatusLine().getStatusCode() == 201) {
                    // Trả về URL công khai
                    return SUPABASE_PUBLIC_BASE_URL + fileName;
                }

                String errorBody = EntityUtils.toString(supabaseResponse.getEntity());
                System.err.println("Supabase Upload Error (Status: " + supabaseResponse.getStatusLine().getStatusCode() + "): " + errorBody);

                if (supabaseResponse.getStatusLine().getStatusCode() == 403) {
                    System.err.println("Lỗi 403: Vui lòng kiểm tra Security Policy cho Bucket 'WebsiteDiemXua' trên Supabase.");
                }

                return null;
            }
        }
    }

    // --- Hàm Hỗ trợ: Gửi phản hồi lỗi về trình duyệt ---
    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.setContentType("text/plain");
        response.getWriter().write(message);
    }
}
