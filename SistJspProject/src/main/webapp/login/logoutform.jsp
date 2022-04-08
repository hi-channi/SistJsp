<%@page import="log.LogDao"%>
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
	// 세션으로부터 id 읽어오기 >> id에 해당하는 name값 얻기 위함
	String id=(String)session.getAttribute("idOk");
	
	//id에 해당하는 이름 얻기
	LogDao dao=new LogDao();
	String name=dao.getName(id);
%>

<br><br> 
<b style="colior: gray"><%=name %></b>님이 로그인 하셨습니다.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="button" value="로그아웃" onclick="location.href='logoutproc.jsp'">

</body>
</html>