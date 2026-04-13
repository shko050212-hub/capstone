<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
    body {
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
        font-family: Arial, sans-serif;
    }

    .container {
        width: 500px;
        margin: 120px auto;
    }

    .row {
        display: flex;
        align-items: center;
        margin-bottom: 25px;
    }

    .label {
        width: 100px;
        font-size: 32px;
        font-weight: bold;
    }

    .input-box input {
        width: 350px;
        height: 55px;
        font-size: 22px;
        padding-left: 10px;
        box-sizing: border-box;
    }

    .btn-area {
        margin-left: 100px;
        margin-top: 10px;
    }

    .btn-area button {
        width: 150px;
        height: 60px;
        font-size: 20px;
        margin-right: 10px;
        border: 1px solid black;
        background-color: white;
        cursor: pointer;
    }

    .btn-area button:hover {
        background-color: #eaeaea;
    }
</style>

</head>
<body>

<div class="container">

    <form action="loginProcess.jsp" method="post">

        <div class="row">
            <div class="label">ID</div>
            <div class="input-box">
                <input type="text" name="username" required>
            </div>
        </div>

        <div class="row">
            <div class="label">PW</div>
            <div class="input-box">
                <input type="password" name="password" required>
            </div>
        </div>

        <div class="btn-area">
            <button type="submit">로그인</button>
            <button type="button" onclick="location.href='signup.jsp'">회원가입</button>
        </div>

    </form>

</div>

</body>
</html>