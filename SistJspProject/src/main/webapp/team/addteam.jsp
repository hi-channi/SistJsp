<%@page import="team.TeamDao"%>
<%@page import="team.TeamDto"%>
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
// 입력값 읽기
String name=request.getParameter("name");
String driver=request.getParameter("driver");
String addr=request.getParameter("addr");

// DTO 선언
TeamDto dto=new TeamDto();

dto.setName(name);
dto.setDriver(driver==null?"없음":"있음");
dto.setAddr(addr);

// 메소드 호출
TeamDao dao=new TeamDao();

dao.teamInsert(dto);

// 목록파일로 이동
response.sendRedirect("teamlist.jsp");


%>


</body>
</html>