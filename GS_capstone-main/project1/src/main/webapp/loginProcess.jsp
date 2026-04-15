<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
    // 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // 로그인 검증 (디버깅용 출력 삭제)
    boolean result = UserService.loginUser(username, password);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <script>
    <% if (result) { %>
        alert("로그인에 성공했습니다. 환영합니다!");
        location.href = "welcome.jsp"; // 성공 시 이동할 페이지
    <% } else { %>
        alert("아이디 또는 비밀번호가 일치하지 않습니다.");
        location.href = "login.jsp";   // 실패 시 다시 로그인 창으로
    <% } %>
    </script>
</body>
</html>
