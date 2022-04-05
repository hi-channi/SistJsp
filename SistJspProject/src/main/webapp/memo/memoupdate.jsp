<%@page import="memo.MemoDto"%>
<%@page import="memo.MemoDao"%>
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
	// post 방식으로 처리 위해 인코딩
	request.setCharacterEncoding("utf-8");

	// 데이터 읽어오기 >> 수정 폼의 데이터를 읽기 때문에 'u-' value값 읽기
	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String content=request.getParameter("ucontent");
	String avatar=request.getParameter("uavatar");

	// dto에 수정할 데이터 넣기
	MemoDto dto=new MemoDto();
	dto. setNum(num);
	dto. setWriter(writer);
	dto. setContent(content);
	dto. setAvatar(avatar);

	// 수정 메소드 호출
	MemoDao dao=new MemoDao();
	dao.updateMemo(dto);
%>

</body>
</html>