<%@page import="Userinfo.UserinfoDao"%>
<%@page import="Userinfo.UserinfoDto"%>
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
	request.setCharacterEncoding("UTF-8");
	
	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	String hp=request.getParameter("acode")
			+"-"+request.getParameter("hp1")
			+"-"+request.getParameter("hp2");
	String birth=request.getParameter("birth");

	UserinfoDto dto=new UserinfoDto();
	
	dto.setName(name);
	dto.setBlood(blood);
	dto.setHp(hp);
	dto.setBirth(birth);

	UserinfoDao dao=new UserinfoDao();
	dao.insertInfo(dto);
	
	
	response.sendRedirect("userlist.jsp");
%>

</body>
</html>