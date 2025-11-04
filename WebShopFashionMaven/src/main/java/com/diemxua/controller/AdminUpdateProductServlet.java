package com.diemxua.controller;

import com.diemxua.model.Product;
import com.diemxua.model.ProductDetail;
import com.diemxua.model.ProductMaterial;
import com.diemxua.services.ProductService;
import com.diemxua.services.ProductDetailService;
import com.diemxua.services.ProductMaterialsService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;
import java.util.UUID;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class AdminUpdateProductServlet extends HttpServlet {

    private static final String SUPABASE_URL = "https://gahbelswwpdrumuiwznm.supabase.co";
    private static final String SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdhaGJlbHN3d3BkcnVtdWl3em5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYwNDk2MjQsImV4cCI6MjA3MTYyNTYyNH0.ZZUySoiV4uUgeQ1pKdZ7Q1kBzhAUm7NgxLOm_JIYrQs";
    private static final String SUPABASE_BUCKET_NAME = "WebsiteDiemXua";

    private static final String SUPABASE_UPLOAD_BASE_ENDPOINT = SUPABASE_URL + "/storage/v1/object/" + SUPABASE_BUCKET_NAME + "/";
    private static final String SUPABASE_PUBLIC_BASE_URL = SUPABASE_URL + "/storage/v1/object/public/" + SUPABASE_BUCKET_NAME + "/";

    private ProductService productService = new ProductService();
    private ProductDetailService detailService = new ProductDetailService();
    private ProductMaterialsService materialService = new ProductMaterialsService();

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf('=') + 2, s.length() - 1);
            }
        }
        return UUID.randomUUID().toString();
    }

    private String uploadFileToSupabase(Part filePart, String folderName) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        String originalFileName = extractFileName(filePart);
        String fileExtension = "";
        int lastDot = originalFileName.lastIndexOf('.');
        if (lastDot > 0) {
            fileExtension = originalFileName.substring(lastDot);
        }

        String uniqueFileName = folderName + UUID.randomUUID().toString() + fileExtension;

        String uploadUrl = SUPABASE_UPLOAD_BASE_ENDPOINT + uniqueFileName;

        try {
            HttpClient client = HttpClient.newHttpClient();

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(uploadUrl))
                    .header("Authorization", "Bearer " + SUPABASE_ANON_KEY)
                    .header("Content-Type", filePart.getContentType())
                    .header("x-upsert", "true")
                    .PUT(HttpRequest.BodyPublishers.ofInputStream(() -> {
                        try {
                            return filePart.getInputStream();
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    }))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() >= 200 && response.statusCode() < 300) {
                return SUPABASE_PUBLIC_BASE_URL + uniqueFileName;
            } else {
                System.err.println("Supabase Upload Failed. Status: " + response.statusCode());
                System.err.println("Response Body: " + response.body());
                return null;
            }

        } catch (Exception e) {
            System.err.println("Error during Supabase upload: " + e.getMessage());
            return null;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            String description = request.getParameter("Desctiption");
            String gender = request.getParameter("gender");
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            String createDate = request.getParameter("createDate");
            long price = Long.parseLong(request.getParameter("price"));
            String trait = request.getParameter("features");
            String items = request.getParameter("items");

            Product existingProduct = productService.getProductByProductId(productID);
            Part imagePart1 = request.getPart("image1");
            Part imagePart2 = request.getPart("image2");
            Part imagePart3 = request.getPart("image3");

            String image1Url = uploadFileToSupabase(imagePart1, "product_images/");
            String image2Url = uploadFileToSupabase(imagePart2, "product_images/");
            String image3Url = uploadFileToSupabase(imagePart3, "product_images/");

            if (image1Url == null) {
                image1Url = existingProduct.getImageProduct1();
            }
            if (image2Url == null) {
                image2Url = existingProduct.getImageProduct2();
            }
            if (image3Url == null) {
                image3Url = existingProduct.getImageProduct3();
            }

            Product product = new Product(productID, productName, description, gender, categoryID,
                    createDate, price, trait, items, image1Url, image2Url, image3Url);

            productService.editProduct(product);

            String[] materialNames = request.getParameterValues("materialName");
            materialService.deleteProductID(productID);
            if (materialNames != null) {
                for (String name : materialNames) {
                    if (name != null && !name.trim().isEmpty()) {
                        ProductMaterial m = new ProductMaterial();
                        m.setMaterialName(name.trim());
                        m.setProductID(productID);
                        materialService.insert(m);
                    }
                }
            }

            String[] sizes = request.getParameterValues("size");
            String[] stocks = request.getParameterValues("stock");
            detailService.deleteProductID(productID); // xóa cũ
            if (sizes != null && stocks != null) {
                for (int i = 0; i < sizes.length; i++) {
                    String s = sizes[i];
                    String st = stocks[i];
                    if (s != null && !s.trim().isEmpty() && st != null && !st.trim().isEmpty()) {
                        ProductDetail pd = new ProductDetail();
                        pd.setProductID(productID);
                        pd.setSize(s.trim());
                        pd.setStockQuantity(Long.parseLong(st.trim()));
                        detailService.insert(pd);
                    }
                }
            }

            response.sendRedirect("AdminProductServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật sản phẩm.");
        }
    }
}
