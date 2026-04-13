<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="login.UserService" %>

<%
request.setCharacterEncoding("UTF-8");

String username = request.getParameter("username");
String password = request.getParameter("password");

boolean result = UserService.loginUser(username, password);
%>

<script>
<% if(result){ %>
    alert("로그인 성공!");
    location.href="welcome.jsp";
<% } else { %>
    alert("아이디 또는 비밀번호가 틀립니다.");
    location.href="login.jsp";
<% } %>
</script>
