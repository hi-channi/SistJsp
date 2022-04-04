<%@page import="memo.MemoDto"%>
<%@page import="memo.MemoDao"%>
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
MemoDao dao=new MemoDao();

request.setCharacterEncoding("UTF-8");

// 데이터 읽기
String writer=request.getParameter("writer");
String content=request.getParameter("content");
String avatar=request.getParameter("avatar");
//String writeday=request.getParameter("writeday");

// dto로 묶어주기
MemoDto dto=new MemoDto();
dto.setWriter(writer);
dto.setContent(content);
//dto.setAvatar(avatar);

// insert 메소드 호출
dao.insertMemo(dto);

%>




</body>
</html>