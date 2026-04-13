<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>
<%
request.setCharacterEncoding("UTF-8");

String username = request.getParameter("username");
boolean exists = false;

if (username != null && !username.trim().isEmpty()) {
    exists = UserService.isUsernameExists(username.trim());
}

if (exists) {
    out.print("<span style='color:red'>이미 사용 중인 아이디입니다</span>");
} else {
    out.print("<span style='color:green'>사용 가능한 아이디입니다</span>");
}
%>
