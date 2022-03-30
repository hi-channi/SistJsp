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
	request.setCharacterEncoding("utf-8");
	String c1 = request.getParameter("city1");
	// 여러 값을 한번에 받으려면 array와 getParameterValues 사용
	String[] c2 = request.getParameterValues("city2"); 
	%>

	<h2>결과 출력</h2>
	<hr>
	<h4>
		희망근무지 1: <%=c1 %>
	</h4>

	<h4>
		희망근무지 2:
		<% if(c2==null) {
			%><font color="red">지역선택 안함.</font>
		<% } else {
			for (int i = 0; i < c2.length; i++) {
				%>[<%=c2[i]%>]&nbsp;
			<% }
			%>
		<br><b>총<%=c2.length %>개 지역 선택됨.</b><br>
		<% }
		%>
	</h4>
	<!-- 이전 페이지로 돌아가는 2가지 방법 -->
	<a href="selectForm_12.html">다시 입력하기</a><br>
	<a href="javascript:history.back()">다시 입력하기</a>
</body>
</html>