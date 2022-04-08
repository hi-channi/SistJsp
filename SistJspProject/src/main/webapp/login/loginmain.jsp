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
	String loginOk=(String)session.getAttribute("loginOk");

	if (loginOk==null || loginOk.equals("")) {		// 로그아웃 상태
	%>
		<jsp:include page="loginform.jsp"></jsp:include>
	<% } else {		// 로그인 상태
	%>
		<jsp:include page="logoutform.jsp"></jsp:include>
	<%}
%>

</body>
</html>