<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="login.UserService" %>

<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String username = request.getParameter("username");
String password = request.getParameter("password");

boolean result = UserService.registerUser(name, username, password);
%>

<script>
<% if(result){ %>
    alert("회원가입 완료!");
    location.href="login.jsp";
<% } else { %>
    alert("회원가입 실패");
    history.back();
<% } %>
</script>