<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
request.setCharacterEncoding("UTF-8");

String username = request.getParameter("username");
String password = request.getParameter("password");

boolean result = UserService.loginUser(username, password);

if (result) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
    <script>
        alert("환영합니다.");
        location.href = "welcome.jsp";
    </script>
</body>
</html>
<%
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
<body>
    <script>
        alert("잘못된 입력입니다.");
        location.href = "login.jsp";
    </script>
</body>
</html>
<%
}
%>