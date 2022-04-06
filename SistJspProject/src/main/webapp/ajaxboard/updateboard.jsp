<%@page import="ajaxboard.AjaxboardDao"%>
<%@page import="ajaxboard.AjaxboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//post 방식으로 처리 위해 인코딩
	request.setCharacterEncoding("utf-8");
	
	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String content=request.getParameter("ucontent");
	String pfimg=request.getParameter("upfimg");
	
	// dto에 수정할 데이터 넣기
	AjaxboardDto dto=new AjaxboardDto();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPfimg(pfimg);
	
	// 수정 메소드 호출
	AjaxboardDao db=new AjaxboardDao();
	db.updateBoard(dto);
%>

</body>
</html>