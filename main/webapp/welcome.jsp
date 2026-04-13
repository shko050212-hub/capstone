<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String loginUser = (String) session.getAttribute("loginUser");
if (loginUser == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영 페이지</title>
<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
        font-family: Arial, sans-serif;
        text-align: center;
    }

    .box {
        margin-top: 200px;
        font-size: 40px;
        font-weight: bold;
    }

    .sub {
        margin-top: 20px;
        font-size: 20px;
    }

    .btn {
        margin-top: 30px;
    }

    .btn button {
        width: 140px;
        height: 45px;
        font-size: 16px;
        cursor: pointer;
    }
</style>
</head>
<body>
    <div class="box">환영합니다</div>
    <div class="sub"><%= loginUser %>님 로그인 성공</div>
    <div class="btn">
        <button onclick="location.href='login.jsp'">로그인 화면</button>
    </div>
</body>
</html>