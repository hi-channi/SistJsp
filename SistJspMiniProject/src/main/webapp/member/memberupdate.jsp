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
	String pw=request.getParameter("pw");
	String hp=request.getParameter("hp");
	String addr=request.getParameter("addr1")
			+"?"+request.getParameter("addr2")
			+"?("+request.getParameter("zipcode")+")";
	String email=request.getParameter("email1")
			+"@"+request.getParameter("email2");
	
	dto.setName(name);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setEmail(email);
	dto.setNum(num);
	
	MemberDao dao=new MemberDao();
	
	// 암호는 빈칸으로 넘겼을 때(바꾸지 않을 때) 기존 암호로 대치해야 함
	if(pw==null || pw.equals("")) {
		String oldpw=dao.getDate(dto.getNum()).getPw();
		dto.setPw(oldpw);
	} else {
		dto.setPw(pw);
	}
	
	dao.updateMember(dto);
	
	// memberlist.jsp로 이동(경로 주의 >> 출력되는 곳에 대한 경로)
	response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
%>

</body>
</html>