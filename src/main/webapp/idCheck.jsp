<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="login.UserService" %>

<%
String username = request.getParameter("username");

boolean exists = UserService.isUsernameExists(username);

if (exists) {
    out.print("<span style='color:red'>아이디를 수정해야합니다</span>");
} else {
    out.print("<span style='color:green'>사용 가능한 아이디입니다</span>");
}
%>