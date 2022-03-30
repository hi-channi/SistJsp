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
<!--
include: 이동했다 돌아옴 >> ex.방문횟수 카운트
forward: 이동했다 돌아오지 않음
redirect: forward는 url이 바뀌지 않고, redirect는 url이 변경됨
* forward는 request, response가 그대로 전달되지만 redirect는 전달되지 않음
-->
</head>
<body>
<h2>다른 폴더의 파일 include하기</h2>
<h4>3번 구구단 예제</h4>
	<jsp:include page="gugu_03.jsp"/>
<h4>5번 중첩배열 이미지 출력 예제</h4>
	<jsp:include page="imgArrayQuiz_05.jsp"/>

</body>
</html>