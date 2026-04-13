<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
body {
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
}
.container {
    width: 320px;
}
.title {
    text-align: center;
    font-size: 26px;
    font-weight: bold;
    margin-bottom: 30px;
}
.field {
    margin-bottom: 20px;
}
.label {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 5px;
}
.input {
    width: 100%;
    height: 40px;
    font-size: 16px;
    padding-left: 10px;
    box-sizing: border-box;
}
.id-row {
    display: flex;
    gap: 10px;
}
.id-row input {
    flex: 1;
}
.check-btn {
    width: 100px;
    height: 40px;
    font-size: 14px;
    cursor: pointer;
}
#checkResult {
    margin-top: 5px;
    font-size: 14px;
    font-weight: bold;
    min-height: 20px;
}
.btn-area {
    display: flex;
    justify-content: space-between;
}
.btn-area button {
    width: 48%;
    height: 40px;
    font-size: 16px;
    cursor: pointer;
}
</style>
<script>
function checkDuplicate() {
    const username = document.getElementById("username").value.trim();

    if (username === "") {
        alert("아이디를 입력해주세요.");
        return;
    }

    fetch("idCheck.jsp?username=" + encodeURIComponent(username))
        .then(res => res.text())
        .then(data => {
            document.getElementById("checkResult").innerHTML = data;
        })
        .catch(() => {
            document.getElementById("checkResult").innerHTML =
                "<span style='color:red'>중복확인 중 오류가 발생했습니다.</span>";
        });
}
</script>
</head>
<body>
<div class="container">
    <div class="title">회원가입</div>

    <form action="signupProcess.jsp" method="post">
        <div class="field">
            <div class="label">이름</div>
            <input class="input" type="text" name="name" required>
        </div>

        <div class="field">
            <div class="label">아이디</div>
            <div class="id-row">
                <input class="input" type="text" name="username" id="username" required>
                <button type="button" class="check-btn" onclick="checkDuplicate()">중복확인</button>
            </div>
            <div id="checkResult"></div>
        </div>

        <div class="field">
            <div class="label">비밀번호</div>
            <input class="input" type="password" name="password" required>
        </div>

        <div class="btn-area">
            <button type="submit">회원가입</button>
            <button type="button" onclick="location.href='login.jsp'">취소</button>
        </div>
    </form>
</div>
</body>
</html>
