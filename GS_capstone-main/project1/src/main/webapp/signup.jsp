<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h2>회원가입</h2>

<form action="signupProcess.jsp" method="post">
    이름: <input type="text" name="name"><br><br>
    아이디: <input type="text" name="username"><br><br>
    비밀번호: <input type="password" name="password"><br><br>

    <button type="submit">회원가입</button>
</form>

<br>
<a href="login.jsp">로그인으로 돌아가기</a>

</body>
</html>
