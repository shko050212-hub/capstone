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
function resetCheckStatus() {
    document.getElementById("idChecked").value = "false";
    document.getElementById("checkedUsername").value = "";
    document.getElementById("checkResult").innerHTML = "";
}

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

            if (data.includes("사용 가능한 아이디입니다")) {
                document.getElementById("idChecked").value = "true";
                document.getElementById("checkedUsername").value = username;
            } else {
                document.getElementById("idChecked").value = "false";
                document.getElementById("checkedUsername").value = "";
            }
        });
}

function validateForm() {
    const name = document.getElementById("name").value.trim();
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const idChecked = document.getElementById("idChecked").value;
    const checkedUsername = document.getElementById("checkedUsername").value;

    if (name === "" || username === "" || password === "") {
        alert("모든 항목을 입력해주세요.");
        return false;
    }

    if (idChecked !== "true") {
        alert("아이디 중복확인을 해주세요.");
        return false;
    }

    if (username !== checkedUsername) {
        alert("아이디가 변경되었습니다. 다시 중복확인 해주세요.");
        return false;
    }

    return true;
}
</script>

</head>
<body>

<div class="container">

    <div class="title">회원가입</div>

    <form action="signupProcess.jsp" method="post" onsubmit="return validateForm();">

        <!-- 중요: name 반드시 있어야 서버로 넘어감 -->
        <input type="hidden" name="idChecked" id="idChecked" value="false">
        <input type="hidden" name="checkedUsername" id="checkedUsername" value="">

        <div class="field">
            <div class="label">이름</div>
            <input class="input" type="text" name="name" id="name" required>
        </div>

        <div class="field">
            <div class="label">아이디</div>

            <div class="id-row">
                <input class="input" type="text" name="username" id="username" required oninput="resetCheckStatus()">
                <button type="button" class="check-btn" onclick="checkDuplicate()">중복확인</button>
            </div>

            <div id="checkResult"></div>
        </div>

        <div class="field">
            <div class="label">비밀번호</div>
            <input class="input" type="password" name="password" id="password" required>
        </div>

        <div class="btn-area">
            <button type="submit">회원가입</button>
            <button type="button" onclick="location.href='login.jsp'">취소</button>
        </div>

    </form>

</div>

</body>
</html>