<%@page import="team.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<%
// num 읽기
String num=request.getParameter("num");

// 선언 후 메소드 호출
TeamDao dao=new TeamDao();

dao.teamDelete(num);

// 삭제 완료 후list로 돌아가기
response.sendRedirect("teamlist.jsp");

%>

</body>
</html>