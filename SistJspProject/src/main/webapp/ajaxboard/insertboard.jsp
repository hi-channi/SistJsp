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
	// post방식 처리를 위한 인코딩
	request.setCharacterEncoding("utf-8");
	
	// 데이터 읽기
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pfimg=request.getParameter("pfimg");
	
	// Dto 선언 후 데이터 dto로 넘겨주기
	AjaxboardDto dto=new AjaxboardDto();
	
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPfimg(pfimg);
	
	// Insert 메소드 호출
	AjaxboardDao dao=new AjaxboardDao();
	dao.insertBoard(dto);
%>

</body>
</html>