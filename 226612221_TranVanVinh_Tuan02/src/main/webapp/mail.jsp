<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Gửi Mail</title>
</head>
<body>
<form action="sendMail" method="post" enctype="multipart/form-data">
    <label>Người nhận:</label>
    <input type="email" name="to" required><br><br>

    <label>Tiêu đề:</label>
    <input type="text" name="subject" required><br><br>

    <label>Nội dung:</label><br>
    <textarea name="content" rows="5" cols="40"></textarea><br><br>

    <label>File đính kèm:</label>
    <input type="file" name="file"><br><br>

    <button type="submit">Gửi Mail</button>
</form>
</body>
</html>
