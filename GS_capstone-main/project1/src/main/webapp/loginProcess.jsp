<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<h2>로그인 처리 결과</h2>
<%
request.setCharacterEncoding("UTF-8");

String username = request.getParameter("username");
String password = request.getParameter("password");

out.println("<p>username = " + username + "</p>");
out.println("<p>password 입력됨 = " + (password != null ? "YES" : "NO") + "</p>");

try {
    boolean result = UserService.loginUser(username, password);
    out.println("<p>loginUser 결과 = " + result + "</p>");

    if (result) {
        session.setAttribute("loginUser", username);
        out.println("<p style='color:green;'>로그인 성공</p>");
        out.println("<a href='welcome.jsp'>welcome.jsp로 이동</a>");
    } else {
        out.println("<p style='color:red;'>로그인 실패: 아이디/비밀번호 불일치 또는 DB 조회 실패</p>");
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
