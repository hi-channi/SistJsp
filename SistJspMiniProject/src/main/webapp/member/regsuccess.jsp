<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
	// id에 해당하는 name 출력 위해 id 읽기
	String id=request.getParameter("id");

	// name값 얻기
	MemberDao dao=new MemberDao();
	String name=dao.getName(id);
%>	

<div style="margin: 0 auto; width: 100%">
	<img alt="" src="image2/s6.JGP">
	<b><%=name %>님의 회원가입을 축하합니다</b>
	<br>
	<br>
	<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
	<button type="button" class="btn btn-warning" onclick="location.href='index.jsp'">메인페이지</button>
</div>
</body>
</html>