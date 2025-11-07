/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.diemxua.utils;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.WebListener;
import java.io.InputStream;
import java.io.IOException;

@WebListener
public class AppContextListener implements ServletContextListener {

    private static final String SERVICE_ACCOUNT_PATH = "/WEB-INF/diemxua-8f674-firebase-adminsdk-fbsvc-c462fd91a4.json";

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        try (InputStream serviceAccount = context.getResourceAsStream(SERVICE_ACCOUNT_PATH)) {

            if (serviceAccount == null) {
                System.err.println("LỖI CẤU HÌNH: Không tìm thấy file Service Account tại: " + SERVICE_ACCOUNT_PATH);
                return;
            }

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
                System.out.println("✅ Firebase Admin SDK đã được khởi tạo thành công.");
            }
        } catch (IOException e) {
            System.err.println("Lỗi I/O khi khởi tạo Firebase: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
