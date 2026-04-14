<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<h2>회원가입 처리 결과</h2>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String username = request.getParameter("username");
String password = request.getParameter("password");

out.println("<p>name = " + name + "</p>");
out.println("<p>username = " + username + "</p>");
out.println("<p>password 입력됨 = " + (password != null ? "YES" : "NO") + "</p>");

try {
    boolean result = UserService.registerUser(name, username, password);
    out.println("<p>registerUser 결과 = " + result + "</p>");

    if (result) {
        out.println("<p style='color:green;'>회원가입 성공</p>");
        out.println("<a href='login.jsp'>로그인으로 이동</a>");
    } else {
        out.println("<p style='color:red;'>회원가입 실패: DB insert 실패 또는 중복/연결 문제</p>");
    }
} catch (Exception e) {
    out.println("<p style='color:red;'>예외 발생</p>");
    out.println("<pre>");
    e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</pre>");
}
%>
</body>
</html>
