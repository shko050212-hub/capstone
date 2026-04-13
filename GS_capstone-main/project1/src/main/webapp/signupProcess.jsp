<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String username = request.getParameter("username");
String password = request.getParameter("password");

boolean result = false;

if (name != null && username != null && password != null
        && !name.trim().isEmpty()
        && !username.trim().isEmpty()
        && !password.trim().isEmpty()) {

    result = UserService.registerUser(name.trim(), username.trim(), password);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<script>
<% if(result){ %>
    alert("회원가입 완료!");
    location.href = "login.jsp";
<% } else { %>
    alert("회원가입 실패");
    location.href = "signup.jsp";
<% } %>
</script>
</body>
</html>
