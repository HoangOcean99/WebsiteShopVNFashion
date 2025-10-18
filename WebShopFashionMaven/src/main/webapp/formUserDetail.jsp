<%-- 
    Document   : formUserDetail
    Created on : Oct 17, 2025, 8:31:48 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin cá nhân và Giao hàng</title>
        <style>
            body {
                font-family: sans-serif;
                line-height: 1.6;
                padding: 20px;
                max-width: 600px;
                margin: auto;
                background-color: #f4f4f4;
            }
            form {
                background: #fff;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            fieldset {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
            }
            legend {
                font-weight: bold;
                color: #007bff;
                padding: 0 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"],
            input[type="tel"],
            input[type="date"],
            input[type="url"],
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box; /* Important */
            }
            textarea {
                resize: vertical;
                min-height: 80px;
            }
            .gender-group label {
                font-weight: normal;
                margin-right: 15px;
            }
            button {
                background-color: #007bff;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>

        <form action="UserProfileServlet" method="post">
            <h2>Form Thông Tin</h2>

            <fieldset>
                <legend>Thông tin cá nhân</legend>
                <div class="form-group">
                    <label for="fullname">Họ và tên (Fullname):</label>
                    <input type="text" id="fullname" name="fullname" required>
                </div>

                <div class="form-group">
                    <label for="phone">Số điện thoại (Phone):</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <div class="form-group">
                    <label for="dateOfBirth">Ngày sinh (Date of Birth):</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" required>
                </div>

                <div class="form-group">
                    <label>Giới tính (Gender):</label>
                    <div class="gender-group">
                        <input type="radio" id="male" name="gender" value="Male" checked>Nam
                        <br/>
                        <input type="radio" id="female" name="gender" value="Female">Nữ
                        <br/>
                        <input type="radio" id="other" name="gender" value="Other">Khác
                    </div>
                </div>
            </fieldset>

            <!--            <fieldset>
                            <legend>Thông tin giao hàng</legend>
                            <div class="form-group">
                                <label for="recipientName">Tên người nhận (Recipient Name):</label>
                                <input type="text" id="recipientName" name="recipientName" required>
                            </div>
            
                            <div class="form-group">
                                <label for="shippingPhone">Số điện thoại nhận hàng (Phone):</label>
                                <input type="tel" id="shippingPhone" name="shippingPhone" required>
                            </div>
            
                            <div class="form-group">
                                <label for="country">Quốc gia (Country):</label>
                                <input type="text" id="country" name="country" required>
                            </div>
            
                            <div class="form-group">
                                <label for="city">Thành phố (City):</label>
                                <input type="text" id="city" name="city" required>
                            </div>
            
                            <div class="form-group">
                                <label for="addressDetail">Địa chỉ chi tiết (Address Detail):</label>
                                <textarea id="addressDetail" name="addressDetail" required></textarea>
                            </div>
                        </fieldset>-->
            <button type="submit">Gửi thông tin</button>
        </form>
    </body>
</html>
