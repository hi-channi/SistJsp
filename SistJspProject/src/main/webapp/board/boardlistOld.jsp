<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDao"%>
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
<style type="text/css">
div.list {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>

<%
	BoardDao dao=new BoardDao();
	Vector<BoardDto> list=dao.getAllBoard();
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd\nHH:mm");
	
%>

<!-- 페이징 처리 하기 전 리스트 -->
<div class="list">
<table class="table table-hover" style="width: 800px;">
	<caption>게시판 목록&nbsp;<span class="badge">총 <%=list.size() %>개 </span>
		<button class="btn btn-success btn-xs glyphicon glyphicon-plus-sign" onclick="location.href='boardform.jsp'">추가하기</button>
	</caption>
	<tr align="center">
		<th width="75">No</th>
		<th width="380">제목</th>
		<th width="120">작성자</th>
		<th width="150">작성일</th>
		<th width="75">조회</th>
	</tr>
	
	<% if(list.size()==0) {
		%>
		<tr>
			<td colspan="8" align="center">
			<b>등록된 게시글이 없습니다.</b>
			</td>
		</tr>
	<% } else {
			for(int i=0;i<list.size();i++) {
				int no=list.size()-i;
				BoardDto dto=list.get(i);
		%>
		<tr>
			<td align="center"><%=no %></td>
			<td><img alt="" src="../photo/<%=dto.getImgname() %>" style="width: 30px; height: 30px;"> 
			&nbsp;<a href="content.jsp?num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
			</td>
			<td><%=dto.getWriter() %></td>
			<td><%=sdf.format(dto.getWday()) %></td>
			<td align="center"><%=dto.getReadcount() %></td>
		</tr>
		<% }
	}%>
	</table>
</div>
	
</body>
</html>