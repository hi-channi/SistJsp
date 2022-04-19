<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.CartDto"%>
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
	/*
	request.setCharacterEncoding("UTF-8");

	// id 읽기
	String shopnum=request.getParameter("shopnum");
	String num=request.getParameter("num");
	int cnt=Integer.parseInt(request.getParameter("cnt"));

	CartDto dto=new CartDto();
	dto.setSnum(shopnum);
	dto.setNum(num);
	dto.setCnt(cnt);

	//dao선언
	ShopDao dao=new ShopDao();
	dao.insertCart(dto);
	*/
%>
	<!-- JavaBean으로 데이터 가져오기 -->
	<jsp:useBean id="dao" class="data.dao.ShopDao"/>
	<jsp:useBean id="dto" class="data.dto.CartDto"/>
	<jsp:setProperty property="*" name="dto"/>
<%
	dao.insertCart(dto);
%>

</body>
</html>