<%@page import="mymem.MymemDao"%>
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

<!-- 수정 버튼을 클릭한 회원의 num값을 받아 DB에서 삭제 -->
<%
	String num=request.getParameter("num");

	MymemDao dao=new MymemDao();
	dao.deleteMem(num);
	
	response.sendRedirect("mymemlist.jsp");
%>

</body>
</html>