<%@page import="java.util.Date"%>
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
	// 세션을 지정, 저장하는 방법
	session.setAttribute("msg", "Happy Day");
	
	// 세션 유지 시간 설정
	session.setMaxInactiveInterval(60); 	// 유지시간 60초
%>

<h3>세션 값 얻기</h3>
세션 값:<%=session.getAttribute("msg") %><br>
세션 유지시간:<%=session.getMaxInactiveInterval() %>초<br>
세션 생성시간:<%=new Date(session.getCreationTime()) %>

</body>
</html>