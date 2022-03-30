<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String[] str = { "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png", "9.png", "10,png" };
	
	int n = 0; // 증가하는 변수
	%>
	<table class="table table=bordered" style="width: 500px;">
		<% for (int i = 0; i < 3; i++){ // 행
		%>
		<tr>
			<% for (int j = 0; j < 3; j++) { //열
			%>
			<td><img alt="" src="../image/<%=str[n]%>" width="150px;"
				height="150px;"></td>
			<% n++;
			}%>
		</tr>
		<%} 
		%>
	</table>
</body>
</html>