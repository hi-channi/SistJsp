<%@page import="team.TeamDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team.TeamDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
table * {
	font-family: 'Yeon Sung';
}
</style>
</head>

<%
// DB 목록 가져오기
TeamDao dao = new TeamDao();
ArrayList<TeamDto> list = dao.getAllDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<body>
	<button type="button" class="btn btn-info"
		style="width: 100px; margin-left: 200px"
		onclick="location.href='addform.html'">팀원추가</button>
	<br>
	<table class="tabel table-bordered" style="width: 800px;">
		<caption>팀원 정보 출력</caption>
		<tr bgcolor="tomato">
			<th>번호</th>
			<th>이름</th>
			<th>운전면허</th>
			<th>주소</th>
			<th>작성일</th>
			<th>삭제</th>
		</tr>
		
		<%
		for (int i=0;i<list.size();i++) {
			// i번째 dto를 받기
			TeamDto dto=list.get(i);
			%>
			<tr>
			<td align="center"><%=i+1 %></td>
			<td><%=dto.getName() %> </td>
			<td><%=dto.getDriver() %> </td>
			<td><%=dto.getAddr() %> </td>
			<td><%=sdf.format(dto.getWriteday()) %></td>
			<td align="center">
				<button type="button" class="btn btn-xs btn-danger" 
				onclick="location.href='teamdelete.jsp?num=<%=dto.getNum() %>'">Delete</button>
		<% } 
		%>
	</table>
</body>
</html>