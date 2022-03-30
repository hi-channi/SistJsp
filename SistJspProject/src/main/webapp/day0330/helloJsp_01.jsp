<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<h2>JSP는 HTML 구조에 Java 코드를 사용할 수 있는 서버 언어</h2>
<h2>Servlet은 확장자가 java이면 자바 클래스 구조에<br>
html, css, Javascript도 사용할 수 있다.</h2>
<h4>JSP의 주석은 2가지</h4>
<hr>
<!-- 주석1: html 기본 주석(소스 보기에서 보임) -->
<%-- 주석2: jsp 주석(소스 보기에서 보이지 않음) --%>
<%! // 선언문
	// 변수 선언 및 메소드 작성 >> 클래스 멤버변수 등록
	// 위치 상관 없음 %>
<h4>Java 코드를 쓰려면 Scriptlet 영역을 표시 후 코딩</h4>

<%
	// scriptlet
	// 여기서 선언하면 지역변수 등록
	// ★선언한 곳보다 아래에서 사용해야 함★
	
	int age=20;
	String name="조아라";
	
	// 내장 객체인 out을 이용해 브라우저에 출력
	out.print("내 이름은 "+name+"이고 나이는 "+age+"입니다.");
%>

<h4>문자열이나 변수 출력은 표현식을 이용해서 출력을 많이 함</h4>
<b>이름: </b><%=name %><br>
<b>나이: </b><%=age %>


</body>
</html>