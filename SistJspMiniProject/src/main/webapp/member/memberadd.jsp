<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
	request.setCharacterEncoding("utf-8");	
	String num=request.getParameter("num");
	
	MemberDto dto=new MemberDto();
	
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr1")
			+" "+request.getParameter("addr2")
			+" ("+request.getParameter("zipcode")+")";
	String email=request.getParameter("email1")
			+"@"+request.getParameter("email2");
	
	dto.setName(name);
	dto.setId(id);
	dto.setPw(pw);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	
	MemberDao dao=new MemberDao();
	dao.insertMember(dto);
	
	// regsuccess.jsp로 이동(경로 주의 >> 출력되는 곳에 대한 경로)
	response.sendRedirect("../index.jsp?main=member/regsuccess.jsp?id="+id);
%>

</body>
</html>