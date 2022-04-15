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
</head>

<%
	String root=request.getContextPath();
%>

<body>

<a href="<%=root %>">
	<img alt="" src="image/title.png">
</a>

<div style="float: right; padding-right: 100px;">

<%
	String loginOk=(String)session.getAttribute("loginOk");
	
	String myid=(String)session.getAttribute("id");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(myid);
	
	if(loginOk==null) {
		%>
		<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
	<% } else {
		%>
		<b style=""><%=name %></b>님&nbsp;
		<button type="button" class="btn btn-success btn-sm" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
	<% } 
%>

</div>
</body>
</html>