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
div.layout {
	border: 1px solid gray;
	position: absolute;
}

div.title {
	width: 100%;
	height: 100px;
	margin: 35px;
	text-align: center;
	
}
div.menu {
	width: 100%;
	height: 80px;
	line-height: 80px;
	font-size: 20pt;
	font-family: 'Noto Sans KR';
	text-align: center;
	top: 150px;
}
div.info {
	width: 220px;
	height: 200px;
	line-height: 10px;
	font-size: 15pt;
	top: 300px;
	padding: 20px 10px;
	margin: 40px;
	border: 5px groove;
	border-radius: 30px;
}
div.main {
	width: 1200px;
	height: 700px;
	font-size: 13pt;
	left: 300px;
	top: 250px;
	padding: 20px 20px 0;
}
a, a:hover{
	text-decoration: none;
	color: black;
}
</style>
</head>

<%
	// 프로젝트 경로 구하기
	String root=request.getContextPath();

	String mainPage="layout/main.jsp";
	
	// url을 통해 main값을 읽어 mainPage에 출력
	if(request.getParameter("main")!=null) {
		mainPage=request.getParameter("main");
	}
%>

<body>

<div class="layout title">
	<jsp:include page="layout/title.jsp"/>
</div>

<div class="layout menu">
	<jsp:include page="layout/menu.jsp"/>
</div>

<div class="layout info">
	<jsp:include page="layout/info.jsp"/>
</div>

<div class="layout main">
	<jsp:include page="<%=mainPage %>"/>
</div>

</body>
</html>