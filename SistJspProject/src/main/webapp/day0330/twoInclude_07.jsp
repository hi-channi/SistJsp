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
String message=request.getParameter("msg");
String imgname=request.getParameter("imgname");

%>

<h3>전달받은 메시지: <%=message %></h3>
<h3>전달받은 이미지명: 
<img alt="" src="<%=imgname%>"></h3>
</body>
</html>