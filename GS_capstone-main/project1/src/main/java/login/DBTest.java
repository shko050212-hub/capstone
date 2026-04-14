<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="login.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결 테스트</title>
</head>
<body>
<h2>DB 연결 테스트</h2>
<%
try {
    Connection conn = DBUtil.getConnection();
    out.println("<p style='color:green;'>DB 연결 성공</p>");
    conn.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>DB 연결 실패</p>");
    out.println("<pre>");
    e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</pre>");
}
%>
</body>
</html>
