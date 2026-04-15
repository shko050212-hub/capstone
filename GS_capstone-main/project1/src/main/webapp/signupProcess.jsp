<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 회원가입 실행
    boolean result = UserService.registerUser(name, username, password);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <script>
    <% if (result) { %>
        alert("회원가입이 완료되었습니다! 로그인해 주세요.");
        location.href = "login.jsp";
    <% } else { %>
        alert("회원가입에 실패했습니다. 다시 시도해 주세요.");
        history.back(); // 이전 페이지(회원가입 폼)로 돌아가기
    <% } %>
    </script>
</body>
</html>
