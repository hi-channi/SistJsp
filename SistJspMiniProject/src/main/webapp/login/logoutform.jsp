<%@page import="data.dao.MemberDao"%>
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
<style type="text/css">
div.intro {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>

<%
	String loginOk=(String)session.getAttribute("loginOk");

	if(loginOk==null) {	
		%>
		<button class="btn btn-info" style="width: 120px; margin-left: 100px;" onclick="location.href=''">로그인</button>
	<% } else {
		MemberDao dao=new MemberDao();
		// 세션에 저장된 아이디 얻기
		String id=(String)session.getAttribute("id");
		String name=dao.getName(id);
	%>
	<div class="intro">
		<b><%=name %>님 환영합니다.</b>
		<br>
		<br>
		<button type="button" class="btn btn-success" style="width: 120px; margin-left: 30px;" onclick="location.href='index.jsp?main=login/logoutaction.jsp'">로그아웃</button>
	</div>
	<%} 
%>

<br>
<img alt="" src="../image2/7.png">

</body>
</html>