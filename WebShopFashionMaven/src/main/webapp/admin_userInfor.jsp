<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.diemxua.model.User, com.diemxua.model.UserProfile" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List Dashboard</title>
        <link rel="stylesheet" href="css/admin_home.css" />

        <style>
            .main-content {
                flex-grow: 1;
                padding: 30px;
                font-family: 'Segoe UI', sans-serif;
            }

            .section {
                background-color: #fff;
                padding: 24px;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            }

            h3 {
                font-size: 1.6rem;
                font-weight: 600;
                color: #1e90ff;
                margin-bottom: 18px;
            }

            .user-list-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0 10px;
            }

            .user-list-table th {
                text-transform: uppercase;
                font-size: 0.75rem;
                font-weight: 700;
                color: #666;
                padding: 12px;
                background: none;
                border: none;
                letter-spacing: 0.5px;
            }

            .user-list-table td {
                background: #fdfdfd;
                padding: 16px 12px;
                font-size: 0.92rem;
                border-top: 1px solid #eee;
                border-bottom: 1px solid #eee;
                color: #333;
            }

            .user-list-table tbody tr:hover td {
                background: #f5faff;
                transition: .2s;
            }

            .select-wrapper {
                width: 120px;
                position: relative;
            }

            .role-select {
                width: 100%;
                background: #eef1f5;
                border-radius: 6px;
                border: 1px solid #d0d5dd;
                padding: 7px 30px 7px 10px;
                font-size: 0.85rem;
                font-weight: 500;
                cursor: pointer;
                color: #333;
                outline: none;
                transition: .2s;
                appearance: none;
            }

            .role-select:hover,
            .role-select:focus {
                background: #fff;
                border-color: #1e90ff;
            }

            .select-wrapper::after {
                content: "\25BC";
                font-size: 10px;
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
            }

            .select-wrapper.role-admin .role-select {
                background: #fdecec;
                color: #c62828;
                border-color: #e57373;
            }

            .select-wrapper.role-user .role-select {
                background: #eaf4ff;
                color: #1565c0;
                border-color: #64b5f6;
            }

            .total-users {
                color: #444;
                font-size: 0.9rem;
                text-align: right;
                margin-top: 18px;
            }

        </style>
    </head>
    <body>

        <div class="dashboard-container">
            <%@include file="admin_sidebar.jsp" %>

            <div class="main-content">

                <div id="user-list-section" class="section">
                    <h3>👥 Danh sách Người dùng</h3>
                    <%
                        List<com.diemxua.model.User> users = (List<com.diemxua.model.User>) request.getAttribute("listUsers");
                        List<com.diemxua.model.UserProfile> userProfile = (List<com.diemxua.model.UserProfile>) request.getAttribute("userProfile");
                    %>

                    <table class="user-list-table">
                        <thead>
                            <tr>
                                <th>Mã User</th>
                                <th>Họ Tên</th>
                                <th>Email</th>
                                <th>Số Điện thoại</th>
                                <th>Vai trò (Role)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(int i =0;i < users.size(); i++){
                                    com.diemxua.model.User u = users.get(i);
                                    com.diemxua.model.UserProfile up = userProfile.get(i);
                                    String roleClass = "";
                                    String displayRole = "";

                                    switch(u.getRole()) {
                                        case "admin":
                                            roleClass = "role-admin";
                                            displayRole = "Quản trị viên";
                                            break;
                                        case "client":
                                            roleClass = "role-user";
                                            displayRole = "Người dùng";
                                            break;
                                        default:
                                            roleClass = "role-user";
                                            displayRole = u.getRole();
                                    }
                            %>
                            <tr>
                                <td><%= u.getUserID() %></td> 
                                <td><%= up.getFullName() %></td> 
                                <td><%= u.getEmail() %></td> 
                                <td><%= up.getPhone() %></td> 
                                <td>
                                    <form action="UpdateRoleUserServlet" method="get" class="select-wrapper <%= roleClass %>">
                                        <input type="hidden" value="<%= u.getFirebaseUID()%>" name="userID">
                                        <select name="role" class="role-select cursor-pointer" onchange="this.form.submit()">
                                            <option class="cursor-pointer" value="admin" <%= "admin".equalsIgnoreCase(u.getRole()) ? "selected" : "" %>> Quản trị viên </option>
                                            <option class="cursor-pointer" value="client" <%= "client".equalsIgnoreCase(u.getRole()) ? "selected" : "" %>>Người dùng</option>
                                        </select>
                                    </form>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>

                    <p style="margin-top: 25px; text-align: right; color: #555;">Tổng số người dùng: **<%= users.size() %>** </p>
                </div>

            </div>
        </div>

    </body>
</html>