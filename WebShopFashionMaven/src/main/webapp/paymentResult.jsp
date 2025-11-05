<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kết quả giao dịch</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body style="background-color: #f4f4f4; font-family: Arial, sans-serif; margin: 0; padding: 20px;">

        <%
            // Lấy kết quả giao dịch từ servlet
            Boolean transResult = (Boolean) request.getAttribute("transResult");
        %>

        <section style="margin-top: 50px; text-align: center;">
            <div>
                <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Review-empty.png"
                     alt="Transaction Status"
                     style="width: 120px; height: 120px; margin-bottom: 20px;">
            </div>

            <!-- Thành công -->
            <% if (transResult != null && transResult) { %>
            <div>
                <h3 style="font-weight: bold; color: #28a745;">
                    Bạn đã giao dịch thành công!
                    <i class="fas fa-check-circle"></i>
                </h3>
                <p style="font-size: 18px; margin-top: 15px;">Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
                <strong style="color: red; font-size: 24px;">0968178905</strong><br/><br/>
                <button name="orderPageButton" onclick="window.location.href = 'OrderServlet'">Đi đến đơn hàng</button>
            </div>
            <% } %>

            <!-- Thất bại -->
            <% if (transResult != null && !transResult) { %>
            <div>
                <h3 style="font-weight: bold; color: #dc3545;">
                    Đơn hàng giao dịch thất bại!
                </h3>
                <p style="font-size: 18px; margin-top: 15px;">Đơn hàng sẽ tự động được chuyển sang hình thức thanh toán khi nhận hàng (COD)</p>
                <p style="font-size: 18px;">Liên hệ tổng đài để được tư vấn:</p>
                <strong style="color: red; font-size: 24px;">0968178905</strong><br/><br/>
                <button name="orderPageButton" onclick="window.location.href = 'OrderServlet'">Đi đến đơn hàng</button>
            </div>
            <% } %>

            <!-- Đang xử lý -->
            <% if (transResult == null) { %>
            <div>
                <h3 style="font-weight: bold; color: #ffc107;">
                    Chúng tôi đã tiếp nhận đơn hàng, xin chờ quá trình xử lý!
                </h3>
                <p style="font-size: 18px; margin-top: 15px;">Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
                <strong style="color: red; font-size: 24px;">0968178905</strong><br/><br/>
                <button name="orderPageButton" onclick="window.location.href = 'OrderServlet'">Đi đến đơn hàng</button>
            </div>
            <% } %>

        </section>

    </body>
</html>
