<%@page import="mymem.MymemDao"%>
<%@page import="mymem.MymemDto"%>
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

<!-- 입력폼을 통해 받은 값을 DB에 전달 -->
<%
	request.setCharacterEncoding("UTF-8");
	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String hp=request.getParameter("acode")
			+"-"+request.getParameter("hp1")
			+"-"+request.getParameter("hp2");
	String email=request.getParameter("email1")
				+"@"+request.getParameter("email2");
	
	
	MymemDto dto=new MymemDto();
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setHp(hp);
	dto.setEmail(email);
	
	MymemDao db=new MymemDao();
	db.insertMem(dto);
	
	response.sendRedirect("mymemlist.jsp");
%>

</body>
</html>