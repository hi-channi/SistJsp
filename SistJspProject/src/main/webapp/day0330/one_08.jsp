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
request.setCharacterEncoding("utf-8"); // include는 보내는 쪽에서 인코딩 처리를 해야만 가능
%>

<h3>two파일 전달_한글 전달</h3>
<jsp:include page="twoInclude_08.jsp">

	<jsp:param value="이수연" name="name"/>
	<jsp:param value="서울시 강남구 테헤란로" name="addr"/>
</jsp:include>
	


</body>
</html>