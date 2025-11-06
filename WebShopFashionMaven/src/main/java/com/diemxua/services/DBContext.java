package com.diemxua.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection connection;

    public DBContext() {
//        try {
//            //Change the username password and url to connect your own database
//            String username = "sa";
//            String password = "haiduong090905";
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShopFashionVietNam;encrypt=true;trustServerCertificate=true";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            connection = DriverManager.getConnection(url, username, password);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
        try {
            String serverName = "diemxua.database.windows.net";
            String databaseName = "DiemXuaShop";
            String username = "adminlogin";
            String password = "H@iduong090905";

            String url = "jdbc:sqlserver://" + serverName + ":1433;"
                    + "database=" + databaseName + ";"
                    + "encrypt=true;"
                    + "trustServerCertificate=false;"
                    + "hostNameInCertificate=*.database.windows.net;"
                    + "loginTimeout=30;";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 

            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Kết nối Azure SQL thành công");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Kết nối Azure SQL thất bại");
        }
    }
}
