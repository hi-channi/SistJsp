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
request.setCharacterEncoding("utf-8");
String name=request.getParameter("name");
String pw=request.getParameter("pw");
String license=request.getParameter("license");
%>

<h2>결과출력</h2>
<h4>이름: <%=name %></h4>
<h4>암호: <%=pw %></h4>
<h4>운전면허: <%=license==null?"없음":"있음" %></h4>


</body>
</html>