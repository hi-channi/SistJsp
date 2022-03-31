<%@page import="member.MemberDto"%>
<%@page import="java.util.Vector"%>
<%@page import="member.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<style type="text/css">
	table * {
	font-family: 'Noto Sans KR';
	}
	</style>
<title>Insert title here</title>
</head>

<%

	MemberDao dao = new MemberDao();
	Vector<MemberDto> list = dao.getAllDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd HH:mm");
	%>
	
<body>
	<table class="table table-bordered"
		style="width: 700px; margin: 50px 0 0 50px;">
		<caption>Member 목록</caption>
		<tr>
			<th width="60">번호</th>
			<th>이름</th>
			<th>연락처</th>
			<th>등록일</th>
		</tr>
		<tr>
		<% for(int i=0; i<list.size();i++) {
			MemberDto dto=list.get(i);
			%>
		
			<td><%=i+1 %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=sdf.format(dto.getSdate())%></td>
			<td colspan="2" align="center">
			<button type="button" class="btn btn-xs btn-warning" onclick="location.href='updateform.jsp?num=<%=dto.getNum() %>'">수정</button>
			<button type="button" class="btn btn-xs btn-danger" onclick="location.href='deleteform.jsp?num=<%=dto.getNum() %>'">삭제</button>
			</td>
		</tr>
		<% }
		%>	
	</table>

</body>
</html>