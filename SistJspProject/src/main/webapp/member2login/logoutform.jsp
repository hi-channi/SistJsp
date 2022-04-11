<%@page import="member2.Member2Dao"%>
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
	String loginOK=(String)session.getAttribute("loginOK");

	if(loginOK==null) {	
	%>
		<button class="btn btn-info" style="width: 120px; margin-left: 100px;" onclick="location.href=''">로그인</button>
	<% } else {
		Member2Dao dao=new Member2Dao();
		// 세션에 저장된 아이디 얻기
		String id=(String)session.getAttribute("id");
		String name=dao.getName(id);
	%>
	<b><%=name %>님 환영합니다.</b>
	<br>
	<br>
	<button type="button" class="btn btn-success" style="width: 120px; margin-left: 30px;" onclick="location.href='logoutproc.jsp'">로그아웃</button>
	<%} 
%>
	
<br>
<img alt="" src="../image/7.png">
</body>
</html>