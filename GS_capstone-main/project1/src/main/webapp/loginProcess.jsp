<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
request.setCharacterEncoding("UTF-8");

String username = request.getParameter("username");
String password = request.getParameter("password");

boolean result = false;

if (username != null && password != null
        && !username.trim().isEmpty()
        && !password.trim().isEmpty()) {
    result = UserService.loginUser(username.trim(), password);
}

if (result) {
    session.setAttribute("loginUser", username.trim());
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<script>
<% if (result) { %>
    alert("로그인 성공!");
    location.href = "welcome.jsp";
<% } else { %>
    alert("아이디 또는 비밀번호가 틀립니다.");
    location.href = "login.jsp";
<% } %>
</script>
</body>
</html>
